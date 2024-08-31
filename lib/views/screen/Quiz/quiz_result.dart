import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:media_pembelajaran/views/const/color.dart';
import 'package:media_pembelajaran/views/const/components/rounded_button.dart';
import 'package:media_pembelajaran/views/screen/Quiz/getting_start.dart';

class QuizResultScreen extends StatelessWidget {
  const QuizResultScreen({super.key, required this.score, required this.userId});
  final int score;
  final int userId;

  @override
  Widget build(BuildContext context) {
    String imgPath = './assets/success.png';
    String textMessage = 'Selamat';

    if(score < 3) {
      imgPath = './assets/failed.png';
      textMessage = 'Semangat dan tingkatkan lagi';
    }

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
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height: 200.h,
                          width: 200.w,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(imgPath),
                                  fit: BoxFit.fill
                              )
                          ),
                        ),
                        Text(
                          textMessage,
                          style: TextStyle(
                              fontSize: 28.h,
                              color: kLight
                          ),
                        ),
                        Text(
                          'Hasil',
                          style: TextStyle(
                              fontSize: 30.h,
                              color: kLight,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        Text(
                          '$score',
                          style: TextStyle(
                              fontSize: 60.h,
                              color: kLight,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        score > 2 ? Container() : RoundedButton(
                            text: "COBA LAGI",
                            color: kLight,
                            textColor: kDark,
                            press: () {
                              Get.off(() => GettingStartScreen(userId: userId,));
                            }
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
