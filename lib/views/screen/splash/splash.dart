import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:media_pembelajaran/views/const/color.dart';
import 'package:media_pembelajaran/views/const/components/rounded_button.dart';
import 'package:media_pembelajaran/views/screen/auth/login.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.1, 1],
          colors: [
            kPrimaryColor,
            kDark
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 300.h,
                width: 300.h,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("./assets/splash.png"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Text(
                "Selamat datang di Aplikasi MOLERANGKA",
                style: TextStyle(
                  fontSize: 16.h,
                  color: kLight,
                  fontWeight: FontWeight.bold
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16.h),
                child: Text(
                  "Aplikasi MOLERANGKA (Mobile learning perang kemerdekaan di Lamongan) merupakan sebuah aplikasi media pembelajaran tentang perang kemerdekaan di Lamongan pada tahun 1948 - 1949",
                  style: TextStyle(
                      fontSize: 14.h,
                      color: kLight
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              RoundedButton(
                  color: kGrey,
                  textColor: kDark,
                  text: "LOGIN",
                  press: () => Get.to(() => Login())
              )
            ],
          ),
        ),
      ),
    );
  }
}
