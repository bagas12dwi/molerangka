import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:media_pembelajaran/controllers/user_controller.dart';
import 'package:media_pembelajaran/views/screen/splash/splash.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {

  final UserController userController = Get.put(UserController());

  Future<void> checkUser() async {
    await userController.checkUser();
  }


  @override
  void initState() {
    super.initState();
    checkUser();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints) => OrientationBuilder(
            builder: (context, Orientation orientation) {
              return const Splash();
            }
        )
    );
  }
}

