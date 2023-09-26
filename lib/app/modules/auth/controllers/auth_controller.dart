// ignore_for_file: avoid_print

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:paybox/app/routes/app_routes.dart';

import '../../../../commonWidget/ui.dart';
import '../../../models/user_model.dart';
import '../../../repositories/user_repositories.dart';
import '../../../services/auth_service.dart';
import 'dart:io';

class AuthController extends GetxController {
  final Rx<User>? currentUser = Get.find<AuthService>().user;
  final user = User().obs;
  GlobalKey<FormState>? registerFormKey;
  GlobalKey<FormState>? loginFormKey;
  // GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  GlobalKey<FormState>? emailconfirmFormKey;
  GlobalKey<FormState>? forgetpasswordConfirmFormKey;
  var loginLoading = false.obs;
  var signupLoading = false.obs;
  final hidePassword = true.obs;
  final hideConfirmPassword = true.obs;
  final loginHidePassword = true.obs;
  // bool isIOS = Platform.isIOS;
  String platForm = 'andriod';
  final _box = GetStorage();
  // var platForm;

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  String? fcmToken;

  Future<void> getFcmTokenFirebase() async {
    print('11');
    fcmToken = await _firebaseMessaging.getToken();
    Get.log("FCM Token: $fcmToken");
  }

  // var token = '';

  UserRepository? _userRepository;

  // final _localStorage = GetStorage();

  AuthController() {
    _userRepository = UserRepository();
  }

  @override
  Future onInit() async {
    super.onInit();
    // await getFcmTokenFirebase();

    login();
    register();
    Platform.isAndroid ? platForm = 'andriod' : platForm = 'ios';
  }

  @override
  void dispose() {
    Get.delete<AuthController>();
    super.dispose();
  }

  // void saveToken(String token) {
  //   _localStorage.write('token', token);
  // }

  // String? getToken() {
  //   return _localStorage.read('token');
  // }

  void register() async {
    print('111');
    Get.log('111');
    Get.focusScope!.unfocus();
    if (registerFormKey!.currentState!.validate()) {
      registerFormKey!.currentState!.save();
      signupLoading.value = true;
      Get.log("register here please");
      print('ready to go to home');
      try {
        await _userRepository!.register(currentUser!.value);
        signupLoading.value = false;
        Get.log('before going to home page');

        Get.toNamed(Routes.LOGIN);
        print('After went to home page');
      } catch (e) {
        print(e.toString());
        // Get.showSnackbar(Ui.ErrorSnackBar(message: e.toString()));
        print('snaaaaaaaaak bar');
      } finally {
        signupLoading.value = false;
      }
    }
  }

  Future login() async {
    // Get.focusScope!.unfocus();
    if (
        // loading.value == false
        loginFormKey!.currentState!.validate()) {
      loginFormKey!.currentState!.save();
      loginLoading.value = true;
      print("login here please");
      print('ready to go to home');
      try {
        // final token = await _userRepository!.login(currentUser!.value);
        // saveToken(token); // Save the token
        await _userRepository!.login(currentUser!.value);
        Get.log("LOOOOOOOOOOOOOOGIN DONE");
        loginLoading.value = false;
        user.value.auth = true;
        Get.log('auuuth in Auth con : ${user.value.auth}');
        print('before going to home page');
        // await getFcmTokenFirebase();
        Get.log("FCM Token: $fcmToken");

        // getFcmToken();
        Get.offAllNamed(Routes.HOMEPAGE);
        print('After went to home page');
      } catch (e) {
        print(e.toString());
        Get.showSnackbar(Ui.ErrorSnackBar(message: e.toString()));
        print('snaaaaaaaaak bar');
      } finally {
        loginLoading.value = false;
      }
    }
  }

  void getFcmToken() async {
    var id = _box.read('id') ?? '1';
    Get.focusScope!.unfocus();
    if (1 == 1
        // loading.value == false
        // loginFormKey!.currentState!.validate()
        ) {
      loginFormKey!.currentState!.save();
      // loading.value = true;

      try {
        // final token = await _userRepository!.login(currentUser!.value);
        // saveToken(token); // Save the token
        await _userRepository!
            .getFcmToken(id.toString(), fcmToken ?? '', platForm);
        // loading.value = false;

        // Get.toNamed(Routes.HOMEPAGE);
      } catch (e) {
        print(e.toString());
        Get.showSnackbar(Ui.ErrorSnackBar(message: e.toString()));
        print('snaaaaaaaaak bar');
      } finally {
        // loading.value = false;
      }
    }
  }

  void forgotPassword() async {
    Get.focusScope!.unfocus();
    if (1 == 1
        // loading.value == false
        // loginFormKey!.currentState!.validate()
        ) {
      // loginFormKey!.currentState!.save();
      // loading.value = true;
      // print("login here please");
      // print('ready to go to home');
      try {
        // final token = await _userRepository!.login(currentUser!.value);
        // saveToken(token); // Save the token
        await _userRepository!.forgotPassword();
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
}
