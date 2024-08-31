import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:media_pembelajaran/controllers/user_controller.dart';
import 'package:media_pembelajaran/views/const/color.dart';
import 'package:media_pembelajaran/views/const/components/rounded_button.dart';
import 'package:media_pembelajaran/views/const/components/rounded_input_field.dart';
import 'package:media_pembelajaran/views/screen/home/home.dart';

class ChangePassword extends StatelessWidget {
  ChangePassword({super.key, required this.id});
  final int id;
  final UserController userController = Get.put(UserController());
  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();

  Future<void> _changePassword() async {
    try{
      await userController.changePassword(id, oldPasswordController.text, newPasswordController.text);
      RxBool isSuccess = userController.isSuccess;

      if(isSuccess == true.obs) {
        Get.snackbar('Ganti Password Berhasil!', 'Password anda berhasil diubah!', backgroundColor: kSuccess, colorText: kLight);
        Get.off(() => Home(userId: id));
      } else {
        Get.snackbar('Ganti Password Gagal!', 'Old password tidak sesuai', backgroundColor: kPrimaryColor, colorText: kLight);
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error during login: $e');
      }
      Get.snackbar('Error', 'Ada kesalahan ketika ganti password', backgroundColor: kPrimaryColor, colorText: kLight);
    }

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.1, 0.7],
              colors: [
                kPrimaryColor,
                kFourthColor
              ]
          )
      ),
      child: Obx(() {
        return Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: kPrimaryColor,
            foregroundColor: kLight,
            centerTitle: true,
            title: Text("Change Password", style: TextStyle(fontSize: 16.h, fontWeight: FontWeight.bold),),
            actions: [
              GestureDetector(
                onTap: userController.isLoading.value ? () {} : () {
                  if(oldPasswordController.text != '' && newPasswordController.text != '') {
                    Get.defaultDialog(
                        title: 'Konfirmasi',
                        middleText: 'Apakah anda yakin untuk mengganti password?',
                        actions: [
                          RoundedButtonDialog(
                              onPressed: () {
                                Get.back();
                                userController.isLoading.value = false;
                              },
                              title: "Tidak"
                          ),
                          RoundedButtonDialog(
                            onPressed: () async{
                              userController.isLoading.value = true;
                              await _changePassword();
                              userController.isLoading.value = false;
                            },
                            title: "Ya",
                            backgroundColor: kLight,
                            textColor: kDark,
                          )
                        ]
                    );
                  } else {
                    Get.snackbar("Warning", "Old Password atau New Password harus diisi !",margin: EdgeInsets.all(10.h), backgroundColor: Colors.amber);
                    userController.isLoading.value = false;
                  }

                },
                child: Container(
                  margin: EdgeInsets.only(right: 10.h),
                  decoration: BoxDecoration(
                      color: kMuted,
                      borderRadius: BorderRadius.circular(5.h)
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 5.h),
                    child: Text(
                      userController.isLoading.value ? "Loading ..." : 'SAVE',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 40.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Old password",
                  style: TextStyle(
                      fontSize: 16.h,
                      fontWeight: FontWeight.w500,
                      color: kLight
                  ),
                ),
                RoundedInputPassword(controller: oldPasswordController,),
                Text(
                  "New password",
                  style: TextStyle(
                      fontSize: 16.h,
                      fontWeight: FontWeight.w500,
                      color: kLight
                  ),
                ),
                RoundedInputPassword(controller: newPasswordController,),
              ],
            ),
          ),
        );
      })
    );
  }
}
