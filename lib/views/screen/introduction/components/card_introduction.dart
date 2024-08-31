import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:media_pembelajaran/views/const/color.dart';

class CardIntroduction extends StatelessWidget {
  const CardIntroduction({super.key, required this.textTitle});
  final String textTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 1,
      padding: EdgeInsets.all(16.h),
      margin: EdgeInsets.only(bottom: 10.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.h),
          boxShadow: const [
            BoxShadow(
                color: kGrey,
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3)
            )
          ],
          color: kLight
      ),
      child: Text(textTitle),
    );
  }
}
