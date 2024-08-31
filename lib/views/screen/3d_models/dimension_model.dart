import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:media_pembelajaran/views/const/color.dart';
import 'package:media_pembelajaran/views/screen/3d_models/components/card_dimension.dart';
import 'package:media_pembelajaran/views/screen/3d_models/gapura.dart';
import 'package:media_pembelajaran/views/screen/3d_models/monumen_kdp.dart';
import 'package:media_pembelajaran/views/screen/3d_models/soewoko.dart';

class DimensionModels extends StatelessWidget {
  const DimensionModels({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 1,
            width: MediaQuery.of(context).size.width * 1,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.1, 0.7],
                    colors: [kPrimaryColor, kFourthColor])),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical:30.h, horizontal: 20.h),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 5,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "3D Modeling",
                              style: TextStyle(
                                  color: kLight,
                                  fontSize: 20.h,
                                  fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10.h,),
                            Text(
                              "3D modeling ini mampu menampilkan objek digital yang nyata atau hidup sehingga objek bisa digerakkan secara leluasa",
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
                          height: 100.h,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("./assets/3dModel.png"),
                                  fit: BoxFit.cover
                              )
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.27,
            child: Container(
              width: MediaQuery.of(context).size.width * 1,
              height: MediaQuery.of(context).size.width * 1.6,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.h),
                      topRight: Radius.circular(30.h)),
                  color: Colors.white),
              child: Padding(
                padding: EdgeInsets.all(16.h),
                child: Column(
                  children: [
                    CardDimension(
                        onTap: () => Get.to(() => const SoewokoScreen()),
                        title: "PATUNG KADET SOEWOKO"
                    ),
                    SizedBox(height: 16.h,),
                    CardDimension(
                        onTap: () => Get.to(() => const Gapura()),
                        title: "MONUMEN GUMANTUK"
                    ),
                    SizedBox(height: 16.h,),
                    CardDimension(
                        onTap: () => Get.to(() => const MonumenKdp()),
                        title: "MONUMEN KEDUNGPRING"
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
