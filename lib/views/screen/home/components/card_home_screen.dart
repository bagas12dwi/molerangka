import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:media_pembelajaran/views/const/color.dart';

class CardHomeScreen extends StatelessWidget {
  const CardHomeScreen({super.key, required this.color, required this.icon, required this.title});
  final Color color;
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.h),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(1, 1), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(10.h),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(10.h),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: const Offset(1, 1), // changes position of shadow
                  ),
                ],
              ),
              height: 60.h,
              width: 60.w,
              child: Icon(
                icon,
                color: kLight,
                size: 35.h,
              ),
            ),
            SizedBox(width: 10.w),
            Text(
              title,
              style: TextStyle(
                  fontSize: 16.h,
                  fontWeight: FontWeight.w500
              ),
            )
          ],
        ),
      ),
    );
  }
}
