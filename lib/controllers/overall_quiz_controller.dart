import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:media_pembelajaran/helpers/api.dart';
import 'package:media_pembelajaran/models/overall_quiz_model.dart';
import 'package:media_pembelajaran/models/overall_user_answer_model.dart';
import 'package:media_pembelajaran/models/overall_user_score_model.dart';

class OverallQuizController extends GetxController {
  var questions = <OverallQuiz>[].obs;
  var isLoading = true.obs;
  var score = 0.obs;
  var pageController = PageController();
  final userAnswer = OverallUserAnswer(message: '', optionId: 0, answer: '', isCorrect: false).obs;
  final userScore = OverallUserScore(userId: 0, score: 0).obs;


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

  void fetchQuizQuestions() async {
    try {
      isLoading(true);

      var response = await Dio().get('${Api.baseUrl}/getQuiz');
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['data'];
        questions.assignAll(data.map((json) => OverallQuiz.fromJson(json)).toList());
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
          '${Api.baseUrl}/submitUserAnswerQuiz',
          data: {
            'user_id': userId,
            'question_id': questionId,
            'option_id': optionId
          }
      );

      if(response.statusCode == 200){
        final Map<String, dynamic> data = response.data['data'];
        userAnswer(OverallUserAnswer.fromJson(data));
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Failed to store data: $e');
    }
  }

  Future<void> submitScore(int userId, int score) async {
    try {
      var response = await Dio().post(
          '${Api.baseUrl}/submitQuizScore',
          data: {
            'user_id': userId,
            'score': score
          }
      );

      if(response.statusCode == 200) {
        final Map<String, dynamic> data = response.data['data'];
        userScore(OverallUserScore.fromJson(data));
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Failed to store data: $e');
    }
  }
}