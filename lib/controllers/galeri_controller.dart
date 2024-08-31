import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:media_pembelajaran/helpers/api.dart';
import 'package:media_pembelajaran/models/galeri_model.dart';

class GaleriController extends GetxController {
  Dio dio = Dio();
  final galeri = Galeri(id: 0, caption: '', imgPath: '', link: '').obs;
  final RxList<Galeri> galeriList = RxList<Galeri>([]);


  @override
  void onInit() async{
    await getGaleri();
    super.onInit();
  }

  Future<void> getGaleri() async {
    try{
      var response = await dio.get(
        '${Api.baseUrl}/getGaleri'
      );

      if(response.statusCode == 200) {
        Map<String, dynamic> responseData = response.data;
        List<dynamic> data = responseData['data'];
        galeriList.value = data.map((json) => Galeri.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }

  }
}