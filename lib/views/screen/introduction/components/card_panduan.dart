import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardPanduan extends StatelessWidget {
  const CardPanduan({super.key, required this.card, required this.titleUtama, required this.titleMateri});
  final Widget card;
  final String titleUtama;
  final String titleMateri;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          titleUtama,
          style: TextStyle(
              fontSize: 18.h,
              fontWeight: FontWeight.bold
          ),
        ),
        SizedBox(height: 10.h,),
        Padding(
          padding: EdgeInsets.only(left: 20.h),
          child: Text(
            titleMateri,
            style: TextStyle(
                fontSize: 16.h,
                fontWeight: FontWeight.bold
            ),
          ),
        ),
        SizedBox(height: 5.h,),
        Container(
          child: card,
        )
      ],
    );
  }
}
