import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:media_pembelajaran/views/const/color.dart';
import 'package:media_pembelajaran/views/screen/introduction/capaian.dart';
import 'package:media_pembelajaran/views/screen/introduction/panduan.dart';
import 'package:media_pembelajaran/views/screen/introduction/tujuan.dart';

class IntroductionScreen extends StatelessWidget {
  const IntroductionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pengantar'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
        child: Padding(
          padding: EdgeInsets.all(16.h),
          child: Column(
            children: [
              GestureDetector(
                onTap: () => Get.to(() => const PanduanScreen()),
                child: Container(
                  width: MediaQuery.of(context).size.width * 1,
                  height: MediaQuery.of(context).size.height * .15,
                  decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(30.h)
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(16.h),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Panduan Penggunaan Aplikasi Mobile Learning Sejarah Perang Kemerdekaan di Kabupaten Lamongan',
                          style: TextStyle(
                            fontSize: 16.h,
                            color: kLight,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.h,),
              GestureDetector(
                onTap: () => Get.to(() => const CapaianScreen()),
                child: Container(
                  width: MediaQuery.of(context).size.width * 1,
                  height: MediaQuery.of(context).size.height * .15,
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(30.h)
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(16.h),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Capaian Pembelajaran (Fase F)',
                          style: TextStyle(
                            fontSize: 16.h,
                            color: kLight,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.h,),
              GestureDetector(
                onTap: () => Get.to(() => const TujuanScreen()),
                child: Container(
                  width: MediaQuery.of(context).size.width * 1,
                  height: MediaQuery.of(context).size.height * .15,
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(30.h)
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(16.h),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Tujuan Pembelajaran',
                          style: TextStyle(
                            fontSize: 16.h,
                            color: kLight,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.h,),
              Text(
                  "Kontak",
                  style: TextStyle(
                    fontSize: 20.h,
                    fontWeight: FontWeight.bold
                  ),
              ),
              Text(
                  textAlign: TextAlign.center,
                  "Kami senang membantu anda dengan pertanyaan atau kebutuhan anda. Hubungi kami untuk informasi lebih lanjut tentang produk atau layanan kami.",
                  style: TextStyle(
                    fontSize: 14.h
                  ),
              ),
              SizedBox(height: 5.h,),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(5.h),
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(20.h)
                    ),
                    child: const Icon(
                        Icons.location_on,
                        color: kLight,
                    ),
                  ),
                  SizedBox(width: 10.h,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          "Lokasi",
                          style: TextStyle(
                            fontSize: 16.h,
                            fontWeight: FontWeight.bold
                          ),
                      ),
                      Text(
                          "Jl. Semarang No. 5 Malang",
                          style: TextStyle(
                            fontSize: 14.h,
                          ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 5.h,),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(5.h),
                    decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(20.h)
                    ),
                    child: const Icon(
                      Icons.mail,
                      color: kLight,
                    ),
                  ),
                  SizedBox(width: 10.h,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Email",
                        style: TextStyle(
                            fontSize: 16.h,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(
                        "isahmadi19@gmail.com",
                        style: TextStyle(
                          fontSize: 14.h,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 5.h,),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(5.h),
                    decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(20.h)
                    ),
                    child: const Icon(
                      Icons.phone,
                      color: kLight,
                    ),
                  ),
                  SizedBox(width: 10.h,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "No. Telepon",
                        style: TextStyle(
                            fontSize: 16.h,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(
                        "087752482230",
                        style: TextStyle(
                          fontSize: 14.h,
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
