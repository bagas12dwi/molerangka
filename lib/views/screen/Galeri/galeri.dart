import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:media_pembelajaran/controllers/galeri_controller.dart';
import 'package:media_pembelajaran/helpers/api.dart';
import 'package:media_pembelajaran/views/const/color.dart';
import 'package:media_pembelajaran/views/screen/Galeri/image_preview.dart';
import 'package:url_launcher/url_launcher.dart';

class GaleriScreen extends StatelessWidget {
  GaleriScreen({super.key});
  final GaleriController galeriController = Get.put(GaleriController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Galeri'),
        backgroundColor: kPrimaryColor,
        foregroundColor: kLight,
      ),
      body: Obx(() {
        final galeriList = galeriController.galeriList;
        return ListView.builder(
            itemCount: galeriList.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final galeri = galeriList[index];
              return Padding(
                padding: EdgeInsets.all(16.h),
                child: GestureDetector(
                  onTap: () async{
                    if (galeri.link.isNotEmpty) {
                      final url = galeri.link;
                      if (await canLaunchUrl(Uri.parse(url))) {
                        await launchUrl(Uri.parse(url));
                      } else {
                        Get.snackbar('Error', 'Could not launch $url');
                      }
                    } else {
                      Get.to(() => ImagePreview(imagePath: '${Api.imgUrl}/${galeri.imgPath}'));
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: kLight,
                      borderRadius: BorderRadius.circular(10.h)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 200.h,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage('${Api.imgUrl}/${galeri.imgPath}'),
                                fit: BoxFit.cover
                            ),
                          ),
                        ),
                        SizedBox(height: 10.h,),
                        Padding(
                          padding: EdgeInsets.all(16.h),
                          child: Text(
                              galeri.caption,
                              style: TextStyle(
                                fontSize: 18.h,
                              ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            }
        );
      }),
    );
  }
}
