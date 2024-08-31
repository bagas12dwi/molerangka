import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:media_pembelajaran/controllers/materi_controller.dart';
import 'package:media_pembelajaran/views/const/color.dart';
import 'package:media_pembelajaran/views/screen/daftar_pustaka/daftar_pustaka.dart';
import 'package:media_pembelajaran/views/screen/materi/content.dart';

class MateriScreen extends StatelessWidget {
  MateriScreen({super.key, required this.userId});
  final MateriController materiController = Get.put(MateriController());
  final int userId;
  final List<Color> cardColors = [kOrange, kDarkOrange, kPink, kDarkPink, kMuted, kDarkMuted, kRed, kDarkRed];
  final Random random = Random();

  Color getRandomColor(Color firstColor) {
    // Get index of firstColor in cardColors list
    int index = cardColors.indexOf(firstColor);

    // Check if index is even (light color), then return the next darker color
    if (index.isEven) {
      return cardColors[index + 1];
    } else { // If index is odd (dark color), then return the previous lighter color
      return cardColors[index - 1];
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Materi'),
        backgroundColor: kPrimaryColor,
        foregroundColor: kLight,
      ),
      body: Obx(() {
        final materiList = materiController.materiList;
        if(materiList.isEmpty){
          return Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 150.h,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('./assets/notfound.png')
                      )
                    ),
                  ),
                  Text(
                      "Belum ada materi!",
                      style: TextStyle(
                        fontSize: 20.h
                      ),
                  ),
                ],
              )
          );
        }else{
          return RefreshIndicator(
            onRefresh: () async {
              await materiController.fetchMateri(userId);
            },
            child: Padding(
              padding: EdgeInsets.all(16.h),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      controller: materiController.scrollController,
                      itemCount: materiList.length,
                      itemBuilder: (context, index) {
                        final materi = materiList[index];
                        final firstContainerColor = cardColors[random.nextInt(cardColors.length)];
                        final secondContainerColor = getRandomColor(firstContainerColor);
                        String materiImg = './assets/materi_default.png';

                        if (materi.name == 'Latar Belakang') {
                          materiImg = './assets/latar_belakang.png';
                        } else if (materi.name == 'Pendudukan Kembali Oleh Belanda') {
                          materiImg = './assets/pendudukan.png';
                        } else if (materi.name == 'Upaya Perlawanan Mempertahankan Kemerdekaan di Kabupaten Lamongan') {
                          materiImg = './assets/perlawanan.png';
                        } else if (materi.name == 'Akhir Perjuangan Mempertahankan Kemerdekaan di Kabupaten Lamongan') {
                          materiImg = './assets/akhir.png';
                        }

                        return Container(
                          margin: EdgeInsets.only(bottom: 10.h),
                          decoration: BoxDecoration(
                            color: firstContainerColor,
                            borderRadius: BorderRadius.circular(20.h),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(top: 10.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.all(10.h),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Container(
                                          height: 30.h,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(image: AssetImage(materiImg)),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 8,
                                        child: Text(
                                          materi.name,
                                          style: TextStyle(
                                            color: kLight,
                                            fontSize: 16.h,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                ...List.generate(materi.submateri.length, (i) {
                                  return GestureDetector(
                                    onTap: () {
                                      if (index != 0) {
                                        if (materi.submateri[i].name == 'Pertempuran di Desa Kentong') {
                                          materi.submateri[i - 1].isDone = 1;
                                          Get.to(() => ContentScreen(idSubmateri: materi.submateri[i].id, userId: userId));
                                        }
                                        if (materiList[index - 1].submateri.last.isDone != 1) {
                                          Get.snackbar(
                                            'Warning',
                                            'Silahkan selesaikan materi sebelumnya terlebih dahulu !',
                                            backgroundColor: kYellow,
                                            colorText: kLight,
                                          );
                                        } else {
                                          if (i != 0 && materiList[index].submateri[i - 1].isDone != 1) {
                                            Get.snackbar(
                                              'Warning',
                                              'Silahkan selesaikan materi sebelumnya terlebih dahulu !',
                                              backgroundColor: kYellow,
                                              colorText: kLight,
                                            );
                                          } else {
                                            Get.to(() => ContentScreen(idSubmateri: materi.submateri[i].id, userId: userId));
                                          }
                                        }
                                      } else {
                                        Get.to(() => ContentScreen(idSubmateri: materi.submateri[i].id, userId: userId));
                                      }
                                    },
                                    child: Container(
                                      width: MediaQuery.of(context).size.width * 1,
                                      padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 20.h),
                                      decoration: BoxDecoration(
                                        color: secondContainerColor,
                                        borderRadius: i == materi.submateri.length - 1
                                            ? BorderRadius.only(
                                          bottomLeft: Radius.circular(20.h),
                                          bottomRight: Radius.circular(20.h),
                                        )
                                            : null,
                                      ),
                                      alignment: Alignment.topLeft,
                                      child: Row(
                                        children: [
                                          const Icon(
                                            Icons.featured_play_list_rounded,
                                            color: kLight,
                                          ),
                                          SizedBox(width: 10.h),
                                          Expanded(
                                            flex: 8,
                                            child: Text(
                                              materi.submateri[i].name,
                                              style: TextStyle(
                                                fontSize: 14.h,
                                                color: kLight,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                          const Spacer(),
                                          materi.submateri[i].isDone == 1
                                              ? const Icon(
                                            Icons.check_circle,
                                            color: kGreenQuizBtn,
                                          )
                                              : Container(),
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Obx(() {
                    return materiController.isBottom.value
                        ? Column(
                      children: [
                        SizedBox(height: 10.h),
                        GestureDetector(
                          onTap: () => Get.to(() => const DaftarPustakaScreen()),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 1,
                            padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 20.h),
                            decoration: BoxDecoration(
                              color: kGrey,
                              borderRadius: BorderRadius.circular(20.h),
                            ),
                            child: Text(
                              'Daftar Pustaka',
                              style: TextStyle(
                                fontSize: 14.h,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                        : Container();
                  }),
                ],
              ),
            ),
          );
        }
      }),
    );
  }
}
