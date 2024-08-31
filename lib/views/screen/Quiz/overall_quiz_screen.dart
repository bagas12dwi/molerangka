import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:media_pembelajaran/controllers/overall_quiz_controller.dart';
import 'package:media_pembelajaran/views/const/color.dart';
import 'package:media_pembelajaran/views/screen/Quiz/components/overall_quiz_view.dart';

class OverallQuizScreen extends StatelessWidget {
  OverallQuizScreen({super.key, required this.userId});

  final OverallQuizController quizController = Get.put(OverallQuizController());
  final int userId;

  @override
  Widget build(BuildContext context) {
    quizController.fetchQuizQuestions();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        foregroundColor: kLight,
        title: const Text('Kuis'),
      ),
      body: SafeArea(
        child: Obx(() {
          if (quizController.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          } else if(quizController.questions.isEmpty) {
            return Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 150.h,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('./assets/notfound.png')
                          )
                      ),
                    ),
                    Text(
                      "Belum ada Quiz!",
                      style: TextStyle(
                          fontSize: 20.h
                      ),
                    ),
                  ],
                )
            );
          } else {
            return PageView.builder(
              physics: const NeverScrollableScrollPhysics(),
              controller: quizController.pageController,
              itemCount: quizController.questions.length,
              itemBuilder: (context, index) {
                final isLastQuestion = index == quizController.questions.length - 1;
                int jmlSoal = quizController.questions.length;
                return OverallQuizView(question: quizController.questions[index], isLastQuestion: isLastQuestion, userId: userId, jmlSoal: jmlSoal,);
              },
            );
          }
        }),
      ),
    );
  }
}
