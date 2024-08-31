import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:media_pembelajaran/controllers/user_controller.dart';
import 'package:media_pembelajaran/helpers/Helper.dart';
import 'package:media_pembelajaran/views/const/color.dart';
import 'package:media_pembelajaran/views/screen/3d_models/dimension_model.dart';
import 'package:media_pembelajaran/views/screen/Galeri/galeri.dart';
import 'package:media_pembelajaran/views/screen/Quiz/getting_start.dart';
import 'package:media_pembelajaran/views/screen/home/components/card_home_screen.dart';
import 'package:media_pembelajaran/views/screen/introduction/introduction.dart';
import 'package:media_pembelajaran/views/screen/materi/materi.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key, required this.id});
  final int id;
  final UserController userController = Get.put(UserController());


  @override
  Widget build(BuildContext context) {
    var user = userController.user.value;
    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(
            color: kPrimaryColor,
          ),
          child: Padding(
            padding: EdgeInsets.all(16.h),
            child: Row(
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          "Hi, ${Helper.getFirstText(user?.name ?? '')}!",
                          style: TextStyle(
                            color: kLight,
                            fontSize: 20.h,
                            fontWeight: FontWeight.bold
                          ),
                      ),
                      Text(
                        "apakah anda siap mempelajari sejarah lokal perang kemerdekaan di lamongan??",
                        style: TextStyle(
                            color: kLight,
                            fontSize: 14.h,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                    flex: 5,
                    child: Container(
                      height: 150.h,
                      width: 100.w,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("./assets/homescreen.png"),
                              fit: BoxFit.fill
                          )
                      ),
                    ),
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(16.h),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Get.to(() => const IntroductionScreen());
                },
                child: const CardHomeScreen(
                    color: kGreen,
                    icon: Icons.handshake_rounded,
                    title: "Pengantar"
                ),
              ),
              SizedBox(height: 10.h,),
              GestureDetector(
                onTap: () {
                  Get.to(() => MateriScreen(userId: id,));
                },
                child: const CardHomeScreen(
                    color: kYellow,
                    icon: Icons.book,
                    title: "Materi"
                ),
              ),
              SizedBox(height: 10.h,),
              GestureDetector(
                onTap: () {
                  Get.to(() => GettingStartScreen(userId: id,));
                },
                child: const CardHomeScreen(
                    color: kBlue,
                    icon: Icons.quiz,
                    title: "Kuis"
                ),
              ),
              SizedBox(height: 10.h,),
              GestureDetector(
                onTap: (){
                  Get.to(() => const DimensionModels());
                },
                child: const CardHomeScreen(
                    color: kPrimaryColor,
                    icon: Icons.threed_rotation,
                    title: "3D Monumen"
                ),
              ),
              SizedBox(height: 10.h,),
              GestureDetector(
                onTap: () => Get.to(() => GaleriScreen()),
                child: const CardHomeScreen(
                    color: kPink,
                    icon: Icons.image,
                    title: "Galeri"
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
