import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:media_pembelajaran/views/const/color.dart';

class CardDimension extends StatelessWidget {
  const CardDimension({super.key, required this.onTap, required this.title});
  final Function() onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: kLight,
            borderRadius: BorderRadius.circular(30.h)
        ),
        child: Padding(
          padding: EdgeInsets.only(top:15.h, bottom: 35.h, right: 25.h, left: 25.h),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 10.h,
                    width: 10.h,
                    decoration: BoxDecoration(
                      color: kDark,
                      borderRadius: BorderRadius.circular(10.h)
                    ),
                  ),
                  Container(
                    height: 10.h,
                    width: 10.h,
                    decoration: BoxDecoration(
                      color: kDark,
                      borderRadius: BorderRadius.circular(10.h)
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h,),
              Center(
                child: Text(
                  title,
                  style: TextStyle(
                      fontSize: 18.h,
                      fontWeight: FontWeight.bold,
                      color: kDark,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
