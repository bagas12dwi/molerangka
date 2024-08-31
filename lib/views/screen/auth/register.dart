import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:media_pembelajaran/controllers/user_controller.dart';
import 'package:media_pembelajaran/models/user_model.dart';
import 'package:media_pembelajaran/views/const/color.dart';
import 'package:media_pembelajaran/views/const/components/rounded_button.dart';
import 'package:media_pembelajaran/views/const/components/rounded_input_field.dart';
import 'package:media_pembelajaran/views/screen/auth/login.dart';
import 'package:media_pembelajaran/views/screen/home/home.dart';

class Register extends StatelessWidget {
  Register({super.key});
  final UserController loginController = Get.put(UserController());
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController classController = TextEditingController();

  Future<void> _register() async{
    try{
      await loginController.register(
          emailController.text,
          passwordController.text,
          fullNameController.text,
          classController.text
      );

      User? loggedInUser = loginController.user.value;

      if(loggedInUser != null){
        Get.off(() => Home(userId: loggedInUser.id!,));
      }else {
        Get.snackbar('Login Failed', 'Invalid credentials');
      }
    } catch (e){
      if (kDebugMode) {
        print('Error during login: $e');
      }
      Get.snackbar('Error', 'An error occurred while logging in');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 50.h),
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
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
              child: SafeArea(
                child: Center(
                  child: Obx(() {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 170.h,
                              width: 250.w,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage("./assets/register.png"),
                                      fit: BoxFit.fill
                                  )
                              ),
                            ),
                          ],
                        ),
                        RoundedInputFieldAuth(
                          hintText: "Email",
                          icon: Icons.mail,
                          keyboardType: TextInputType.emailAddress,
                          controller: emailController,
                        ),
                        RoundedInputFieldAuth(
                          icon: Icons.person,
                          hintText: "Nama Akun",
                          keyboardType: TextInputType.text,
                          controller: fullNameController,
                        ),
                        RoundedInputFieldAuth(
                          icon: Icons.book,
                          hintText: "Kelas",
                          keyboardType: TextInputType.text,
                          controller: classController,
                        ),
                        RoundedInputPassword(controller: passwordController,),
                        SizedBox(height: 10.h,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RoundedButtonSmall(
                                color: kGrey,
                                textColor: kDark,
                                text: "Back",
                                press: () => Get.off(() => Login())
                            ),
                            RoundedButtonSmall(
                                color: kGrey,
                                textColor: kDark,
                                text: loginController.isLoading.value ? "Loading ... " : "Next",
                                press: loginController.isLoading.value ? (){} : () async {
                                  if(fullNameController.text != "" && emailController.text != "" && passwordController.text != "" && classController.text != ""){
                                    loginController.isLoading.value = true;
                                    await _register();
                                    loginController.isLoading.value = false;
                                  } else {
                                    loginController.isLoading.value = false;
                                    Get.snackbar("Warning", "Nama atau Email atau Password harus diisi !",margin: EdgeInsets.all(10.h), backgroundColor: Colors.amber);
                                  }
                                }
                            ),
                          ],
                        ),
                        SizedBox(height: 10.h,),
                      ],
                    );
                  })
                ),
              ),
            ),
          ),
        )
    );
  }
}
