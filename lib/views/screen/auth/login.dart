import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:media_pembelajaran/controllers/user_controller.dart';
import 'package:media_pembelajaran/models/user_model.dart';
import 'package:media_pembelajaran/views/const/color.dart';
import 'package:media_pembelajaran/views/const/components/rounded_button.dart';
import 'package:media_pembelajaran/views/const/components/rounded_input_field.dart';
import 'package:media_pembelajaran/views/screen/auth/register.dart';
import 'package:media_pembelajaran/views/screen/home/home.dart';

class Login extends StatelessWidget {
  Login({super.key});
  final UserController loginController = Get.put(UserController());
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> _login() async {
    try {
      await loginController.login(emailController.text, passwordController.text);
      User? loggedInUser = loginController.user.value;

      if (loggedInUser != null) {
        // Get.off(() => Home(id: loggedInUser.id!)); // Navigate to home screen
        Get.off(() => Home(userId: loggedInUser.id!,)); // Navigate to home screen
      } else {
        // Handle login failure (if needed)
        Get.snackbar('Login Failed', 'Gagal Login');
      }
    } catch (e) {
      // Handle error
      if (kDebugMode) {
        print('Error during login: $e');
      }
      Get.snackbar('Error', 'An error occurred while logging in');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.1, 0.5, 1],
              colors: [
                kThirdColor,
                kPrimaryColor,
                kFourthColor
              ]
          )
        ),
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
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            height: 350.h,
                            width: 230.w,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("./assets/login.png"),
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
                      RoundedInputPassword(controller: passwordController,),
                      SizedBox(height: 10.h,),
                      RoundedButton(
                        color: kGrey,
                        textColor: kDark,
                        text: loginController.isLoading.value ? "LOADING ..." : "SIGN IN",
                        press: loginController.isLoading.value
                            ? () {}
                            : () async {
                          if(emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
                            loginController.isLoading.value = true;
                            await _login();
                            loginController.isLoading.value = false;
                          } else {
                            loginController.isLoading.value = false;
                            Get.snackbar(
                              "Warning",
                              "Email atau Password harus diisi !",
                              margin: EdgeInsets.all(10.h),
                              backgroundColor: Colors.amber,
                            );
                          }
                        },
                      ),
                      SizedBox(height: 10.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Doesn't have account?",
                            style: TextStyle(
                                color: kLight
                            ),
                          ),
                          SizedBox(width: 5.w,),
                          GestureDetector(
                            onTap: () => Get.to(() => Register()),
                            child: const Text(
                              "Register",
                              style: TextStyle(
                                  color: kLight,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  );
                }),
              ),
            ),
          ),
        )
    );
  }
}
