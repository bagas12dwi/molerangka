import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:media_pembelajaran/controllers/overall_quiz_controller.dart';
import 'package:media_pembelajaran/models/overall_quiz_model.dart';
import 'package:media_pembelajaran/views/const/components/rounded_button.dart';
import 'package:media_pembelajaran/views/screen/Quiz/components/quiz_option_card.dart';
import 'package:media_pembelajaran/views/screen/Quiz/quiz_result.dart';

class OverallQuizView extends StatelessWidget {
  OverallQuizView({super.key, required this.question, required this.isLastQuestion, required this.userId, required this.jmlSoal});
  final OverallQuiz question;
  RxInt optionId = 0.obs;
  RxInt selectedOptionId = 0.obs;
  final bool isLastQuestion;
  RxBool isSubmit = false.obs;
  final OverallQuizController quizController = Get.put(OverallQuizController());
  final int userId;
  final int jmlSoal;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              question.questionText,
              style: TextStyle(
                  fontSize: 18.h,
                  fontWeight: FontWeight.bold
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16.h),
            GridView.count(
                childAspectRatio: 4.h,
                crossAxisCount: 1,
                shrinkWrap: true,
                primary: false,
                padding: EdgeInsets.all(16.h),
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                children: question.option.map((option) {
                  return GestureDetector(
                      onTap: () {
                        if(!isSubmit.value) {
                          optionId.value = option.id;
                          selectedOptionId.value = option.id;
                        }
                      },
                      child: Obx(() {
                        bool isTapped = selectedOptionId.value == option.id;
                        return QuizOptionCard(
                          optionText: option.optionText,
                          isTapped: isTapped,
                          isCorrect: quizController.userAnswer.value.isCorrect &&
                              option.id == quizController.userAnswer.value.optionId,
                        );
                      })
                  );
                }).toList()
            ),
            SizedBox(height: 16.h),
            Obx(() {
              if (optionId.value != 0) {
                return Center(
                  child: RoundedButton(
                    text: "Simpan",
                    press: () async {
                      await quizController.submitAnswer(
                        userId,
                        question.id,
                        optionId.value,
                      );
                      isSubmit.value = true; // Update isSubmit value using .value
                      optionId.value = 0;
                      if(quizController.userAnswer.value.isCorrect) {
                        quizController.score.value = quizController.score.value + 1;
                      }
                      int score = ((quizController.score.value / jmlSoal) * 100).round();
                      if (isLastQuestion) {
                        await quizController.submitScore(
                            userId,
                            score
                        );
                        Get.off(() => QuizResultScreen(score: score, userId: userId,));
                        quizController.score.value = 0;
                      } else {
                        Get.find<OverallQuizController>().nextQuestion();
                      }
                    },
                  ),
                );
              } else {
                return Container(); // Return an empty container if no option is selected
              }
            }),
          ],
        ),
      ),
    );
  }
}
