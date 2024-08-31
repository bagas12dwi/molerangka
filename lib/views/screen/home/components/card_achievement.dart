import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:media_pembelajaran/views/const/color.dart';

class CardAchievement extends StatelessWidget {
  CardAchievement({super.key, required this.cardColor, required this.title, required this.score});
  final Color cardColor;
  final String title;
  final int score;
  int maxScore = 5;
  int failedScore = 0;

  @override
  Widget build(BuildContext context) {
    failedScore = maxScore - score;
    return Container(
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(10.h),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 3,
            blurRadius: 3,
            offset: const Offset(1, 1), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(10.h),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                width: 70.h,
                height: 70.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(100.h),
                  border: Border(
                      top: BorderSide(color: kOrange, width: 3.h),
                      bottom: BorderSide(color: kOrange, width: 3.h),
                      left: BorderSide(color: kOrange, width: 3.h),
                      right: BorderSide(color: kOrange, width: 3.h)
                  ),
                ),
                child: Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("./assets/achievement.png"),
                          fit: BoxFit.fill
                      )
                  ),
                ),
              ),
            ),
            SizedBox(width: 10.h,),
            Expanded(
                flex: 7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 5,
                          child: Text(
                            title,
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: kLight,
                                fontSize: 16.h
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 5,
                          child: Row(
                            children: List.generate(
                              maxScore, // Gunakan maxScore sebagai panjang daftar ikon
                                  (index) {
                                if (index < score) {
                                  return const Icon(
                                    Icons.star_rounded,
                                    color: kOrange,
                                  );
                                } else if (index < score + failedScore) {
                                  return const Icon(
                                    Icons.star_border_rounded,
                                    color: kLight,
                                  );
                                } else {
                                  return const SizedBox(); // Kosongkan jika melebihi score + failedScore
                                }
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h,),
                    Text(
                      "Anda telah menyelesaikan pembelajaran ini",
                      style: TextStyle(
                          fontSize: 12.h,
                          color: kLight,
                          fontWeight: FontWeight.w500
                      ),
                    )
                  ],
                )
            )
          ],
        ),
      ),
    );
  }
}
