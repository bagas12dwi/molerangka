
import 'package:dio/dio.dart' as Dio;
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:media_pembelajaran/controllers/user_controller.dart';
import 'package:media_pembelajaran/helpers/api.dart';
import 'package:media_pembelajaran/models/materi_model.dart';
import 'package:media_pembelajaran/models/submateri_model.dart';

class MateriController extends GetxController {
  final UserController userController = Get.put(UserController());
  Dio.Dio _dio = Dio.Dio();
  String apiUrl = '${Api.baseUrl}/getMateri';
  RxList<Materi> materiList = RxList<Materi>([]); // Make the list observable
  final submateri = Submateri(id: 0, name: '', description: '', imgPath: '', materialId: 0, isDone: 0, caption: '').obs;

  var isBottom = false.obs;
  final ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    fetchMateri(userController.user.value!.id!); // Fetch data when the controller is initialized
    scrollController.addListener(_scrollListener);
    super.onInit();
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }

  void _scrollListener() {
    if (scrollController.position.atEdge) {
      bool isBottomPosition = scrollController.position.pixels != 0;
      isBottom.value = isBottomPosition;
    }
  }

  Future<void> fetchMateri(int userId) async {
    try {
      Dio.Response response = await _dio.post(
          apiUrl,
          data: {
            'user_id': userId
          }
      );
      if (response.statusCode == 200) {
        // Parse the response data directly as a map
        Map<String, dynamic> responseData = response.data;
        // Extract the 'data' field from the parsed map
        List<dynamic> data = responseData['data'];
        materiList.value = data.map((json) => Materi.fromJson(json)).toList(); // Update observable list
        // materiList = data.map((json) => Materi.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }

  Future<void> getDetailSubmateri(int idSubmateri) async{
    String url = '${Api.baseUrl}/getDetailSubmateri/$idSubmateri';
    try{
      Dio.Response response = await _dio.get(url);
      if(response.statusCode == 200) {
        final Map<String, dynamic> data = response.data['data'];
        submateri(Submateri.fromJson(data));
      } else {
        throw Exception('Failed to load data');
      }
    }catch (e){
      throw Exception('Failed to fetch data: $e');
    }
  }
}