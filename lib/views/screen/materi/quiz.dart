import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:media_pembelajaran/controllers/quiz_controller.dart';
import 'package:media_pembelajaran/views/const/color.dart';
import 'package:media_pembelajaran/views/screen/materi/components/quiz_view.dart';

class QuizSubmateriScreen extends StatelessWidget {
  QuizSubmateriScreen({super.key, required this.subMaterialId, required this.userId});
  final QuizController quizController = Get.put(QuizController());
  final int subMaterialId;
  final int userId;

  @override
  Widget build(BuildContext context) {
    quizController.fetchQuizQuestions(subMaterialId);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        foregroundColor: kLight,
        title: const Text('Quiz'),
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
                      "Belum ada quiz!",
                      style: TextStyle(
                          fontSize: 20.h
                      ),
                    ),
                  ],
                )
            );
          }else {
            return PageView.builder(
              physics: const NeverScrollableScrollPhysics(),
              controller: quizController.pageController,
              itemCount: quizController.questions.length,
              itemBuilder: (context, index) {
                final isLastQuestion = index == quizController.questions.length - 1;
                return QuizView(question: quizController.questions[index], isLastQuestion: isLastQuestion, userId: userId,);
              },
            );
          }
        }),
      ),
    );
  }
}
