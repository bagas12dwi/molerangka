import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:media_pembelajaran/controllers/user_controller.dart';
import 'package:media_pembelajaran/helpers/api.dart';
import 'package:media_pembelajaran/models/achievement_quiz_model.dart';
import 'package:media_pembelajaran/models/achievement_submateri_model.dart';
import 'package:media_pembelajaran/models/progress_model.dart';

class AchievementController extends GetxController{
  Dio dio = Dio();
  RxList<AchievementSubmateri> achievementSubmateriList = RxList<AchievementSubmateri>([]);
  final achievementQuiz = AchievementQuiz(id: 0, userId: 0, score: 0).obs;
  final UserController userController = Get.put(UserController());
  final progressUser = ProgressModel(allTask: 0, taskDone: 0, persentase: 0, msg: '').obs;

  Future<void> getAchievementSubmateri(int userId) async {
    try {
      var response = await dio.post(
        '${Api.baseUrl}/getAchievementSubmateri',
        data: {
          'user_id': userId
        }
      );

      if(response.statusCode == 200) {
        Map<String, dynamic> responseData = response.data;
        List<dynamic> data = responseData['data'];
        achievementSubmateriList.value = data.map((json) => AchievementSubmateri.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Failed to load data: $e');
    }
  }

  Future<void> getAchievementQuiz(int userId) async {
    try {
      var response = await dio.post(
        '${Api.baseUrl}/getAchievement',
        data: {
          'user_id': userId
        }
      );

      if(response.statusCode == 200) {
        final Map<String, dynamic> data = response.data['data'];
        achievementQuiz(AchievementQuiz.fromJson(data));
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Failed to load data: $e');
    }
  }

  Future<void> calculateProgress(int userId) async {
    try {
      var response = await dio.post(
        '${Api.baseUrl}/calculateProgres',
        data: {
          'user_id': userId
        }
      );

      if(response.statusCode == 200) {
        final Map<String, dynamic> data = response.data['data'];
        progressUser(ProgressModel.fromJson(data));
      } else {
        throw Exception('Failed to load data');
      }

    } catch(e) {
      throw Exception('Failed to load data: $e');
    }
  }


}