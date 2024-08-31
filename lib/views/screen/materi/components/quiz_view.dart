import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:media_pembelajaran/controllers/quiz_controller.dart';
import 'package:media_pembelajaran/models/question_model.dart';
import 'package:media_pembelajaran/views/const/color.dart';
import 'package:media_pembelajaran/views/const/components/rounded_button.dart';
import 'package:media_pembelajaran/views/screen/materi/components/option_card.dart';
import 'package:media_pembelajaran/views/screen/materi/result.dart';

class QuizView extends StatelessWidget {
  QuizView({super.key, required this.question, required this.isLastQuestion, required this.userId});
  final Question question;
  RxInt optionId = 0.obs;
  RxInt selectedOptionId = 0.obs;
  final bool isLastQuestion;
  RxBool isSubmit = false.obs;
  final QuizController quizController = Get.put(QuizController());
  final int userId;


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
                padding: EdgeInsets.all(10.h),
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
                        return OptionCard(
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
                    },
                  ),
                );
              } else {
                return Container(); // Return an empty container if no option is selected
              }
            }),
            Obx(() {
              if(isSubmit.value == true) {
                return Container(
                  padding: EdgeInsets.all(16.h),
                  decoration: BoxDecoration(
                      color: !quizController.userAnswer.value.isCorrect ? kRedLight : kGreenLight,
                      borderRadius: BorderRadius.circular(16.h)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        quizController.userAnswer.value.message,
                        style: TextStyle(
                            fontSize: 25.h,
                            fontWeight: FontWeight.bold,
                            color: !quizController.userAnswer.value.isCorrect ? kRedQuizBtn : kGreenQuizBtn
                        ),
                      ),
                      SizedBox(height: 10.h,),
                      Row(
                        children: [
                          Text(
                            'Jawaban : ',
                            style: TextStyle(
                                fontSize: 16.h,
                                fontWeight: FontWeight.bold,
                                color: !quizController.userAnswer.value.isCorrect ? kRedQuizBtn : kGreenQuizBtn
                            ),
                          ),
                          Expanded(
                            child: Text(
                              quizController.userAnswer.value.answer,
                              style: TextStyle(
                                  fontSize: 16.h,
                                  color: !quizController.userAnswer.value.isCorrect ? kRedQuizBtn : kGreenQuizBtn
                              ),
                            ),
                          ),
                        ],
                      ),
                      Center(
                        child: RoundedButton(
                          color: !quizController.userAnswer.value.isCorrect
                              ? kRedQuizBtn
                              : kGreenQuizBtn,
                          textColor: kLight,
                          text: isLastQuestion ? "Akhiri Kuis" : "Lanjut",
                          press: () async{
                            if (isLastQuestion) {
                              await quizController.submitScore(
                                  quizController.userAnswer.value.idSubMaterial,
                                  userId,
                                  quizController.score.value
                              );
                              Get.off(() => ResultScreen(score: quizController.userScore.value.score, idSubMateri: quizController.userAnswer.value.idSubMaterial, userId: userId,));
                              quizController.score.value = 0;
                            } else {
                              Get.find<QuizController>().nextQuestion();
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                );
              }else {
                return Container();
              }
            })
          ],
        ),
      ),
    );
  }
}
