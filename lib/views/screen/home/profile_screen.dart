import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:media_pembelajaran/controllers/user_controller.dart';
import 'package:media_pembelajaran/helpers/api.dart';
import 'package:media_pembelajaran/views/const/color.dart';
import 'package:media_pembelajaran/views/const/components/rounded_button.dart';
import 'package:media_pembelajaran/views/const/components/rounded_input_field.dart';
import 'package:media_pembelajaran/views/screen/change_password/change_password.dart';
import 'package:media_pembelajaran/views/screen/home/home.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key, required this.id});
  final int id;
  final UserController userController = Get.put(UserController());
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController classController = TextEditingController();

  Future<void> _logout() async{
    await userController.logout();
    userController.isLoading.value = false;
  }

  Future<void> _saveImage() async{
    try{
      await userController.changeProfilePicture(id, userController.profileImage);
      RxBool isSuccess = userController.isSuccess;
      userController.isLoading.value = false;

      if(isSuccess == true.obs) {
        Get.snackbar('Ganti Foto Profil Berhasil!', 'Foto profil anda berhasil diubah!', backgroundColor: kSuccess, colorText: kLight);
        userController.profileImage = Rx<File?>(null);
        Get.off(() => Home(userId: id));
      } else {
        Get.snackbar('Ganti Foto Profil Gagal!', 'Foto Profil tidak sesuai', backgroundColor: kYellow, colorText: kLight);
      }
    } catch(e){
      if (kDebugMode) {
        print('Error during login: $e');
      }
      Get.snackbar('Error', 'Ada kesalahan ketika mengganti foto profile', backgroundColor: kPrimaryColor, colorText: kLight);
    }
  }

  @override
  Widget build(BuildContext context) {
    var user = userController.user.value;
    fullNameController.text = user?.name ?? '';
    emailController.text = user?.email ?? '';
    classController.text = user?.userClass ?? '';
    userController.profileImage = Rx<File?>(null);
    return Stack(
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
            padding: EdgeInsets.all(16.h),
            child: Obx(() {
              return Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      userController.pickImageFromGallery();
                    },
                    child: Container(
                      height: 150.h,
                      width: 150.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(80.h),
                        image: DecorationImage(
                          image: userController.profileImage.value != null
                              ? FileImage(userController.profileImage.value!) as ImageProvider<Object> // Cast to ImageProvider<Object>
                              : user?.imgPath != '' ? NetworkImage('${Api.imgUrl}/${user?.imgPath}') : const AssetImage("./assets/profile.png") as ImageProvider<Object>, // Cast to ImageProvider<Object>
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  userController.profileImage.value != null
                      ? RoundedButtonSmall(
                      text: userController.isLoading.value ? "Loading ..." : "Simpan",
                      color: userController.isLoading.value  ? kMuted : kYellow,
                      press: userController.isLoading.value  ? () {} : () async{
                        userController.isLoading.value = true;
                        await _saveImage();
                        userController.isLoading.value = false;
                      }
                  ) : Container(),
                  SizedBox(height: 10.h),
                  Text(
                    user?.name ?? '',
                    style: TextStyle(
                      fontSize: 16.h,
                      fontWeight: FontWeight.bold,
                      color: kLight,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    user?.userClass ?? '',
                    style: TextStyle(
                      fontSize: 14.h,
                      fontWeight: FontWeight.w500,
                      color: kLight,
                    ),
                  )
                ],
              );
            }),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.35,
          child: Container(
            width: MediaQuery.of(context).size.width * 1,
            height: MediaQuery.of(context).size.width * 1.6,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60.h),
                    topRight: Radius.circular(60.h)),
                color: kMuted),
            child: Padding(
              padding: EdgeInsets.all(16.h),
              child: Column(
                children: [
                  Text(
                    "Profile Saya",
                    style: TextStyle(
                        fontSize: 16.h,
                        fontWeight: FontWeight.bold,
                        color: kLight),
                  ),
                  RoundedInputFieldAuth(
                    hintText: "Nama Lengkap",
                    keyboardType: TextInputType.text,
                    isEnable: false,
                    controller: fullNameController,
                  ),
                  RoundedInputFieldAuth(
                    hintText: "Email",
                    keyboardType: TextInputType.emailAddress,
                    icon: Icons.email,
                    isEnable: false,
                    controller: emailController,
                  ),
                  RoundedInputFieldAuth(
                    hintText: "Kelas",
                    icon: Icons.book,
                    isEnable: false,
                    controller: classController,
                  ),
                  RoundedButton(
                      text: "Ganti Password",
                      color: kYellow,
                      press: () => Get.to(() => ChangePassword(id: user?.id ?? 0,))),
                  RoundedButton(
                      text: "Keluar",
                      press: () {
                        Get.defaultDialog(
                          title: "Konfirmasi",
                          middleText: 'Apakah anda yakin untuk Keluar?',
                          actions: [
                            RoundedButtonDialog(
                                onPressed: () {
                                  Get.back();
                                },
                                title: "Tidak",
                            ),
                            RoundedButtonDialog(
                                onPressed: () async{
                                  await _logout();
                                },
                                title: "Ya",
                                backgroundColor: kLight,
                                textColor: kDark,
                            )
                          ]
                        );
                      }),
                  SizedBox(height: 10.h)
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
