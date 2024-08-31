import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:media_pembelajaran/helpers/api.dart';
import 'package:media_pembelajaran/models/question_model.dart';
import 'package:media_pembelajaran/models/user_answer_model.dart';
import 'package:media_pembelajaran/models/user_score_model.dart';

class QuizController extends GetxController {
  var questions = <Question>[].obs;
  var isLoading = true.obs;
  var score = 0.obs;
  var pageController = PageController();
  final userAnswer = UserAnswer(message: '', optionId: 0, answer: '', idSubMaterial: 0, isCorrect: false).obs;
  final userScore = UserScore(subMaterialId: 0, userId: 0, score: 0).obs;


  @override
  void onInit() {
    pageController = PageController(); // Initialize pageController in onInit
    super.onInit();
  }

  @override
  void onClose() {
    // pageController.dispose();
    super.onClose();
  }

  void fetchQuizQuestions(int subMaterialId) async {
    try {
      isLoading(true);
      var response = await Dio().post(
        '${Api.baseUrl}/getQuizSubmateri',
        data: {'sub_material_id': subMaterialId},
      );
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['data'];
        questions.assignAll(data.map((json) => Question.fromJson(json)).toList());
      }
    } catch (e) {
      throw Exception('Failed to load data');
    } finally {
      isLoading(false);
    }
  }

  void nextQuestion() {
    if (pageController.page! < questions.length - 1) {
      pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.ease);
    }
  }

  Future<void> submitAnswer(int userId, int questionId, int optionId) async{
    try {
      var response = await Dio().post(
          '${Api.baseUrl}/submitUserAnswers',
          data: {
            'user_id': userId,
            'question_id': questionId,
            'option_id': optionId
          }
      );

      if(response.statusCode == 200){
        final Map<String, dynamic> data = response.data['data'];
        userAnswer(UserAnswer.fromJson(data));
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Failed to store data: $e');
    }
  }

  Future<void> submitScore(int subMaterialId, int userId, int score) async {
    try {
      var response = await Dio().post(
        '${Api.baseUrl}/submitScore',
        data: {
          'sub_material_id': subMaterialId,
          'user_id': userId,
          'score': score
        }
      );

      if(response.statusCode == 200) {
        final Map<String, dynamic> data = response.data['data'];
        userScore(UserScore.fromJson(data));
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Failed to store data: $e');
    }
  }
}
