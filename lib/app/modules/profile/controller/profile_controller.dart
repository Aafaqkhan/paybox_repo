import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:paybox/app/models/user_model.dart';
import 'package:paybox/app/modules/auth/controllers/auth_controller.dart';
import 'package:paybox/app/repositories/profile_repositories.dart';
import 'package:paybox/app/services/auth_service.dart';
import 'package:paybox/commonWidget/ui.dart';
import 'package:dio/dio.dart' as dio;
import 'package:get_storage/get_storage.dart';

class ProfileController extends GetxController {
  final Rx<User>? currentUser = Get.find<AuthService>().user;

  var editProfileLoading = false.obs;

  ProfileRepository? _profileRepository;
  // var userProfile = Rx<User?>;
  // final userProfile = <User>[].obs;
  var userProfile = User().obs;
  GlobalKey<FormState>? profileFormKey;
  AuthController authController = AuthController();

  Rx<File?> pickedImage = Rx<File?>(null); // Observable to store picked image

  void pickImage() async {
    final pickedImageFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedImageFile != null) {
      pickedImage.value = File(pickedImageFile.path);
    }
  }

  ProfileController() {
    _profileRepository = ProfileRepository();
    profileFormKey = GlobalKey<FormState>();
  }

  @override
  void onInit() {
    super.onInit();
    profileFormKey = GlobalKey<FormState>();
    // fetchUserProfile();
    // getDeleteUser();
    getUserProfile();
  }

  // Future<void> fetchUserProfile() async {
  //   try {
  //     final user = await getUserProfile();
  //     userProfile.value = user;
  //   } catch (error) {
  //     print('Error fetching user profile: $error');
  //   }
  // }

  Future getUserProfile() async {
    print('$_profileRepository');
    // Get.focusScope!.unfocus();
    // if (registerFormKey!.currentState!.validate()) {
    //   registerFormKey!.currentState!.save();
    //   loading.value = true;
    // print("register here please");
    print('ready to fetch getUserProfile apis');
    try {
      if (_profileRepository == null) print('nulleee');
      // await _profileRepository!.getUserProfile();
      userProfile.value = await _profileRepository!.getUserProfile();

      // userProfile.assign(await _profileRepository!.getUserProfile());
      // loading.value = false;
      // print('before going to home page');
      // Get.toNamed(Routes.LOGIN);
      // print('After went to home page');
    } catch (e) {
      print(e.toString());
      Get.showSnackbar(Ui.ErrorSnackBar(message: e.toString()));
      print('snaaaaaaaaak bar');
    } finally {
      // loading.value = false;
    }
    // }
  }

  Future getDeleteUser() async {
    if (_profileRepository == null) Get.log('_profileRepository is null');
    try {
      print('2');
      await _profileRepository!.getDeleteUser();
      // print(deals[0].name);
    } catch (e) {
      Get.showSnackbar(Ui.ErrorSnackBar(message: e.toString()));
    }
  }

  void restoreUpdate() async {
    print('$_profileRepository');
    // Get.focusScope!.unfocus();
    // if (registerFormKey!.currentState!.validate()) {
    //   registerFormKey!.currentState!.save();
    //   loading.value = true;
    // print("register here please");
    print('ready to fetch restoreUpdate api');
    try {
      if (_profileRepository == null) print('_profileRepository is null');
      await _profileRepository!.restoreUpdate();
      // loading.value = false;
      // print('before going to home page');
      // Get.toNamed(Routes.LOGIN);
      // print('After went to home page');
    } catch (e) {
      print(e.toString());
      Get.showSnackbar(Ui.ErrorSnackBar(message: e.toString()));
      print('snaaaaaaaaak bar');
    } finally {
      // loading.value = false;
    }
    // }
  }

  void getAllUsers() async {
    print('$_profileRepository');
    // Get.focusScope!.unfocus();
    // if (registerFormKey!.currentState!.validate()) {
    //   registerFormKey!.currentState!.save();
    //   loading.value = true;
    // print("register here please");
    print('ready to fetch getAllUsers apis');
    try {
      if (_profileRepository == null) print('nulleee');
      await _profileRepository!.getAllUsers();
      // loading.value = false;
      // print('before going to home page');
      // Get.toNamed(Routes.LOGIN);
      // print('After went to home page');
    } catch (e) {
      print(e.toString());
      Get.showSnackbar(Ui.ErrorSnackBar(message: e.toString()));
      print('snaaaaaaaaak bar');
    } finally {
      // loading.value = false;
    }
    // }
  }

  void storeToken() async {
    Get.focusScope!.unfocus();
    if (1 == 1
        // loading.value == false
        // loginFormKey!.currentState!.validate()
        ) {
      print('ready to call storeTOken API');
      try {
        // final token = await _userRepository!.login(currentUser!.value);
        // saveToken(token); // Save the token
        await _profileRepository!.storeToken();
        // loading.value = false;
        // print('before going to home page');
        // Get.toNamed(Routes.HOMEPAGE);
        // print('After went to home page');
      } catch (e) {
        print(e.toString());
        Get.showSnackbar(Ui.ErrorSnackBar(message: e.toString()));
        print('snaaaaaaaaak bar');
      } finally {
        // loading.value = false;
      }
    }
  }

  Future updateProfilePicture(File? profileImage) async {
    Get.focusScope!.unfocus();
    if (1 == 1
        // loading.value == false
        // loginFormKey!.currentState!.validate()
        ) {
      // loginFormKey!.currentState!.save();
      editProfileLoading.value = true;
      // print("login here please");
      print('ready to call updateProfile API');
      try {
        // final token = await _userRepository!.login(currentUser!.value);
        // saveToken(token); // Save the token
        await _profileRepository!.updateProfilePicture(profileImage);
        editProfileLoading.value = false;
        // print('before going to home page');
        // Get.toNamed(Routes.HOMEPAGE);
        // print('After went to home page');
      } catch (e) {
        print(e.toString());
        Get.showSnackbar(Ui.ErrorSnackBar(message: e.toString()));
        print('snaaaaaaaaak bar');
      } finally {
        editProfileLoading.value = false;
      }
    }
  }

  // Future<void> updateProfileImage() async {
  //   var id = userProfile.value.id;
  //   Get.log(id.toString());
  //   Get.log('ID :: $id');

  //   try {
  //     if (pickedImage.value == null) {
  //       return; // No image to update
  //     }

  //     var data = dio.FormData.fromMap({
  //       'profile': [
  //         await dio.MultipartFile.fromFile(
  //           pickedImage.value!.path,
  //           filename: 'picture.jpeg',
  //         ),
  //       ],
  //     });

  //     var dioClient = dio.Dio();
  //     var response = await dioClient.request(
  //       'https://paybox.jzmaxx.com/api/v2/update/profile/image/$id',
  //       options: dio.Options(
  //         method: 'POST',
  //       ),
  //       data: data,
  //     );

  //     if (response.statusCode == 200) {
  //       print(json.encode(response.data));
  //       // Handle success, maybe update user profile data
  //     } else {
  //       print(response.statusMessage);
  //       // Handle error
  //     }
  //   } catch (error) {
  //     print('Error updating profile image: $error');
  //     // Handle error
  //   }
  // }

  Future updateUser() async {
    // final User user = authController.currentUser!.value;
    // Get.log('222 .. $user');
    Get.focusScope!.unfocus();
    if (
        // 1 == 1
        // loading.value == false
        profileFormKey!.currentState!.validate()) {
      // Get.log('333 .. $user');

      profileFormKey!.currentState!.save();
      editProfileLoading.value = true;

      // loginFormKey!.currentState!.save();
      // loading.value = true;
      // print("login here please");
      Get.log('ready to call updateUser API');
      try {
        // final token = await _userRepository!.login(currentUser!.value);
        // saveToken(token); // Save the token
        if (_profileRepository == null) Get.log('_profileRepository is null');
        await _profileRepository!.updateUser(currentUser!.value);
        editProfileLoading.value = false;
        // print('before going to home page');
        // Get.toNamed(Routes.HOMEPAGE);
        // print('After went to home page');
      } catch (e) {
        print(e.toString());
        Get.showSnackbar(Ui.ErrorSnackBar(message: e.toString()));
        print('snaaaaaaaaak bar');
      } finally {
        editProfileLoading.value = false;
      }
    }
  }

  Future refreshProfileScreen({bool showMessage = false}) async {
    // await getSlider();
    await getUserProfile();
    // await getuse();
    // await getFeatured();
    // await getRecommendedSalons();
    // Get.find<RootController>().getNotificationsCount();
    if (showMessage) {
      Get.showSnackbar(
          Ui.SuccessSnackBar(message: "Home page refreshed successfully"));
    }
  }

  Future refreshMessages() async {
    // messages.clear();
    // lastDocument = new Rx<DocumentSnapshot>(null);
    // await listenForMessages();
  }
}
