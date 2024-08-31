import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:media_pembelajaran/controllers/achievement_controller.dart';
import 'package:media_pembelajaran/views/const/color.dart';
import 'package:media_pembelajaran/views/screen/home/components/card_achievement.dart';
import 'package:percent_indicator/percent_indicator.dart';

class AchievementScreen extends StatelessWidget {
  AchievementScreen({super.key, required this.userId});
  final AchievementController achievementController = Get.put(AchievementController());
  final int userId;
  final List<Color> cardColors = [kGreen, kPink, kPeach, kBlue, kSkyBlue, kYellow, kBlueLight];
  final Random random = Random();



  @override
  Widget build(BuildContext context) {
    achievementController.getAchievementSubmateri(userId);
    cardColors.shuffle();
    achievementController.calculateProgress(userId);

    return Padding(
      padding: EdgeInsets.all(16.h),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(),
              Text(
                "Pencapaian",
                style: TextStyle(
                    fontSize: 16.h,
                    fontWeight: FontWeight.bold
                ),
                textAlign: TextAlign.center,
              ),
              GestureDetector(
                onTap: () async{
                  await achievementController.getAchievementSubmateri(userId);
                  await achievementController.calculateProgress(userId);
                },
                child: const Icon(
                  Icons.refresh
                ),
              )
            ],
          ),
          SizedBox(height: 10.h,),
          SizedBox(
            height: 100.h, // Set a fixed height or use another constraint
            child: FutureBuilder(
              future: achievementController.calculateProgress(userId),
              builder: (context, snapshot) {
                if(snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if(snapshot.hasError) {
                  return const Center(
                    child: Text('Failed to fetch data'),
                  );
                } else {
                  final progress = achievementController.progressUser.value;
                  double percent = progress.persentase / 10;
                  return  Container(
                    height: 100.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.h),
                        border: Border(
                            right: BorderSide(
                                color: kGrey,
                                width: 2.h
                            ),
                            left: BorderSide(
                                color: kGrey,
                                width: 2.h

                            ),
                            top: BorderSide(
                                color: kGrey,
                                width: 2.h

                            ),
                            bottom: BorderSide(
                                color: kGrey,
                                width: 2.h
                            )
                        )
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal:  16.h),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 4,
                            child: CircularPercentIndicator(
                              radius: 40.h,
                              lineWidth: 10.h,
                              animation: true,
                              percent: percent,
                              center: Text(
                                '${progress.persentase}%',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.h
                                ),
                              ),
                              circularStrokeCap: CircularStrokeCap.round,
                              progressColor: kSuccess,
                            ),
                          ),
                          Expanded(
                              flex: 6,
                              child: Text(
                                progress.msg,
                                style: TextStyle(
                                    fontSize: 14.h
                                ),
                              )
                          ),
                        ],
                      ),
                    ),
                  );
                }
              }
            ),
          ),
          SizedBox(height: 10.h,),
          const Text(
            'Pencapaian Kuis',
            style: TextStyle(
              fontWeight: FontWeight.bold
            ),
            textAlign: TextAlign.start,
          ),
          SizedBox(height: 5.h,),
          SizedBox(
            height: 100.h,
            child: FutureBuilder(
              future: achievementController.getAchievementQuiz(userId),
              builder: (context, snapshot) {
                if(snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if(snapshot.hasError) {
                  return const Center(
                    child: Text('Belum ada data'),
                  );
                } else {
                  final achievementQuiz = achievementController.achievementQuiz.value;
                  return Container(
                    decoration: BoxDecoration(
                      color: kPeach,
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
                              flex: 6,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        flex: 5,
                                        child: Text(
                                          'Kuis',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              color: kLight,
                                              fontSize: 16.h
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
                          ),
                          Expanded(
                              flex: 2,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '${achievementQuiz.score}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 30.h,
                                        color: kLight
                                    ),
                                  ),
                                ],
                              )
                          )
                        ],
                      ),
                    ),
                  );
                }
              }
            ),
          ),
          SizedBox(height: 10.h,),
          const Text(
            'Pencapaian Kuis Sub Materi',
            style: TextStyle(
                fontWeight: FontWeight.bold
            ),
            textAlign: TextAlign.start,
          ),
          SizedBox(height: 5.h,),
          SizedBox(
            height: MediaQuery.of(context).size.height, // Set a fixed height or use another constraint
            child: Obx(() {
              final achievementSubmateriList = achievementController.achievementSubmateriList;
              return ListView.builder(
                itemCount: achievementSubmateriList.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final achievementSubmateri = achievementSubmateriList[index];
                  final colorIndex = index % cardColors.length;
                  final cardColor = cardColors[colorIndex];
                  return Column(
                    children: [
                      CardAchievement(cardColor: cardColor, title: achievementSubmateri.name, score: achievementSubmateri.score,),
                      SizedBox(height: 10.h,)
                    ],
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
