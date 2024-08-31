import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:media_pembelajaran/views/const/color.dart';

class OptionCard extends StatelessWidget {
  const OptionCard({super.key, required this.optionText, required this.isTapped, required this.isCorrect});
  final String optionText;
  final bool isTapped;
  final bool isCorrect;

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = isTapped ? kSuccess : kPrimaryColor;
    Color textColor = isTapped ? kDark : kLight;

    // Jika jawaban benar, ubah warna latar belakang menjadi hijau
    if (isCorrect) {
      backgroundColor = kGreenQuizBtn;
      textColor = kLight;
    }

    // Jika jawaban salah, ubah warna latar belakang menjadi merah
    if (!isCorrect && isTapped) {
      backgroundColor = kRedQuizBtn;
      textColor = kLight;
    }

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.h),
        color: backgroundColor
      ),
      child: Center(
        child: Text(
          optionText,
          style: TextStyle(
            fontSize: 14.h,
            color: textColor,
            fontWeight: FontWeight.w400
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
