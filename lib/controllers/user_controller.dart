import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart' as Dio;
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:media_pembelajaran/helpers/api.dart';
import 'package:media_pembelajaran/helpers/shared_prefrence.dart';
import 'package:media_pembelajaran/models/user_model.dart';
import 'package:media_pembelajaran/providers/user_provider.dart';
import 'package:media_pembelajaran/views/screen/home/home.dart';
import 'package:media_pembelajaran/views/screen/splash/splash.dart';

class UserController extends GetxController {
  var user = Rxn<User>();
  var isSuccess = true.obs;
  RxBool isLoading = false.obs;
  Rx<File?> profileImage = Rx<File?>(null);
  RxString imageName = ''.obs;
  final loggedInUser = User(id: 0, name: '', email: '', userClass: '', role: '', imgPath: '', password: '').obs;

  void setUser(User newUser) {
    user.value = newUser;
  }

  checkUser() async{
    var users = await SharedPref().getUser();
    if(users != null){
      // Get.off(() => Home(id: json.decode(users)['id']));
      Get.off(() => Home(userId: json.decode(users)['id']));
    } else {
      Get.off(() => const Splash());
    }
  }

  Future<void> login(String email, String password) async {
    try {
      Dio.Dio dio = Dio.Dio();

      var response = await dio.post(
        '${Api.baseUrl}/login',
        data: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        var userData = response.data['data'];
        User loggedInUser = User.fromJson(userData);
        setUser(loggedInUser);
        await SharedPref().storeUser(json.encode(loggedInUser));
      } else {
        // Handle login failure
        throw Exception('Invalid credentials');
      }
    } catch (e) {
      // Handle error
      rethrow; // Rethrow the exception to let the UI handle it
    }
  }

  Future<void> register(String email, String password, String name, String userClass) async{
    try{
      Dio.Dio dio = Dio.Dio();

      var response = await dio.post(
          '${Api.baseUrl}/register',
          data: {
            'email': email,
            'password': password,
            'name': name,
            'class': userClass
          }
      );

      if (response.statusCode == 200){
        var userData = response.data['data'];
        User registeredUser = User.fromJson(userData);
        setUser(registeredUser);
        await SharedPref().storeUser(json.encode(registeredUser));
      } else {
        throw Exception('Invalid credentials');
      }
    } catch (e){
      rethrow;
    }
  }

  Future<void> getDetail(int id) async {
    try {
      var userData = await UserProvider().getDetailUser(id);
      user.value = userData;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<void> logout() async{
    await SharedPref().removeUser();
    Get.offAll(()=> const Splash());
  }

  Future<void> changePassword(int id, String oldPassword, String newPassword) async{
    try {
      Dio.Dio dio = Dio.Dio();

      var response = await dio.post(
        '${Api.baseUrl}/changePassword',
        data: {
          'id_user': id,
          'old_password': oldPassword,
          'new_password': newPassword
        }
      );

      if(response.statusCode == 200) {
        var status = response.data['message'];
        if(status == 'Success') {
          isSuccess(true);
        } else {
          isSuccess(false);
        }
      } else{
        throw Exception('Invalid credentials');
      }
    } catch(e){
      rethrow;
    }
  }

  Future<void> pickImageFromGallery() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    imageName(pickedFile?.name);

    if (pickedFile != null) {
      profileImage.value = File(pickedFile.path); // Update the profile image
    }
  }

  Future<void> changeProfilePicture(int userId, Rx<File?> profileImg) async {
    try {
      final File? file = profileImg.value;
      final dio = Dio.Dio();

      if (file == null) {
        // Handle the case when the file is null
        return;
      }

      final formData = Dio.FormData.fromMap({
        'id_user': userId,
        'image': await Dio.MultipartFile.fromFile(file.path),
      });

      final response = await dio.post(
        '${Api.baseUrl}/changeProfilePicture',
        data: formData,
      );

      if (response.statusCode == 200) {
        final status = response.data['message'];
        if (status == 'Success') {
          isSuccess(true);
        } else {
          isSuccess(false);
        }
      } else {
        throw Exception('Invalid credentials');
      }
    } catch (e) {
      rethrow;
    }
  }

}