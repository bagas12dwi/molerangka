import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:media_pembelajaran/controllers/user_controller.dart';
import 'package:media_pembelajaran/views/const/color.dart';
import 'package:media_pembelajaran/views/screen/home/achievement_screen.dart';
import 'package:media_pembelajaran/views/screen/home/home_screen.dart';
import 'package:media_pembelajaran/views/screen/home/profile_screen.dart';

class Home extends StatelessWidget {
  Home({super.key, required this.userId});
  final int userId;
  final UserController userController = Get.put(UserController());

  Future<void> _loadData() async{
    await userController.getDetail(userId);
  }

  @override
  Widget build(BuildContext context) {
    final MyController myController = Get.put(MyController(userController: userController, userId: userId));
    return FutureBuilder(
        future: _loadData(),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if(snapshot.hasError){
            return const Center(child: Text('Error Loading Data'),);
          } else {
            return Obx(() => SafeArea(
                child: Scaffold(
                    backgroundColor: kLight,
                    body: CustomScrollView(
                      slivers: [
                        SliverToBoxAdapter(
                          child: myController.screens[myController.selectedIndex.value],
                        ),
                      ],
                    ),
                    bottomNavigationBar: BottomNavigationBar(
                      items: const <BottomNavigationBarItem>[
                        BottomNavigationBarItem(
                            icon: Icon(Icons.stars_rounded),
                            label: "Pencapaian"
                        ),
                        BottomNavigationBarItem(
                            icon: Icon(Icons.home),
                            label: "Home"
                        ),
                        BottomNavigationBarItem(
                            icon: Icon(Icons.person),
                            label: "Profil"
                        )
                      ],
                      selectedItemColor: kPrimaryColor,
                      backgroundColor: kLight,
                      currentIndex: myController.selectedIndex.value,
                      onTap: (index) => myController.onTapped(index),
                    )
                )
            ),
            );
          }
        }
    );
  }
}

class MyController extends GetxController {

  late UserController userController;
  late int userId;
  var screens = <Widget>[].obs;
  var selectedIndex = 1.obs;

  MyController({required this.userController, required this.userId});

  @override
  void onInit() {
    super.onInit();
    screens.addAll([
      AchievementScreen(userId: userId,),
      HomeScreen(id: userId,),
      ProfileScreen(id: userId,)
    ]);
    onTapped(selectedIndex.value);
  }

  void onTapped(int index) {
    selectedIndex.value = index;
  }
}

