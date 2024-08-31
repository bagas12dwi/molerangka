import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:media_pembelajaran/controllers/overall_quiz_controller.dart';
import 'package:media_pembelajaran/views/const/color.dart';
import 'package:media_pembelajaran/views/const/components/rounded_button.dart';
import 'package:media_pembelajaran/views/screen/Quiz/overall_quiz_screen.dart';

class GettingStartScreen extends StatelessWidget {
  GettingStartScreen({super.key, required this.userId});
  final OverallQuizController quizController = Get.put(OverallQuizController());
  final int userId;


  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 50.h),
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.1, 0.7],
                colors: [
                  kPrimaryColor,
                  kFourthColor
                ]
            )
        ),
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
              child: SafeArea(
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(16.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Center(
                          child: Container(
                            height: 350.h,
                            width: 350.w,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("./assets/quiz.png"),
                                    fit: BoxFit.fill
                                )
                            ),
                          ),
                        ),
                        Text(
                          "Apakah kamu siap ?",
                          style: TextStyle(
                              fontSize: 30.h,
                              color: kLight,
                              fontWeight: FontWeight.bold
                          ),
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          'mengerjakan Kuis untuk mengukur pemahaman Sejarah lokal kalian',
                          style: TextStyle(
                              fontSize: 18.h,
                              color: kLight,
                          ),
                        ),
                        SizedBox(height: 10.h,),
                        Center(
                          child: RoundedButton(
                              text: "MULAI",
                              color: kLight,
                              textColor: kDark,
                              press: () {
                                Get.off(() => OverallQuizScreen(userId: userId,));
                              }
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        )
    );
  }
}
