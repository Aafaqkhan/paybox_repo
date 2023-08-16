import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:paybox/app/routes/app_routes.dart';

import '../../../../commonWidget/ui.dart';
import '../../../models/user_model.dart';
import '../../../repositories/user_repositories.dart';
import '../../../services/auth_service.dart';

class AuthController extends GetxController {
  final Rx<User>? currentUser = Get.find<AuthService>().user;
  GlobalKey<FormState>? registerFormKey;
  GlobalKey<FormState>? loginFormKey;
  // GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  GlobalKey<FormState>? emailconfirmFormKey;
  GlobalKey<FormState>? forgetpasswordConfirmFormKey;
  final loading = false.obs;
  final hidePassword = true.obs;
  final hideConfirmPassword = true.obs;
  final loginHidePassword = true.obs;

  // var token = '';

  UserRepository? _userRepository;

  // final _localStorage = GetStorage();

  AuthController() {
    _userRepository = UserRepository();
  }

  // void saveToken(String token) {
  //   _localStorage.write('token', token);
  // }

  // String? getToken() {
  //   return _localStorage.read('token');
  // }

  void register() async {
    Get.focusScope!.unfocus();
    if (registerFormKey!.currentState!.validate()) {
      registerFormKey!.currentState!.save();
      loading.value = true;
      print("register here please");
      print('ready to go to home');
      try {
        await _userRepository!.register(currentUser!.value);
        loading.value = false;
        print('before going to home page');
        Get.toNamed(Routes.LOGIN);
        print('After went to home page');
      } catch (e) {
        print(e.toString());
        Get.showSnackbar(Ui.ErrorSnackBar(message: e.toString()));
        print('snaaaaaaaaak bar');
      } finally {
        loading.value = false;
      }
    }
  }

  void login() async {
    Get.focusScope!.unfocus();
    if (
        // loading.value == false
        loginFormKey!.currentState!.validate()) {
      loginFormKey!.currentState!.save();
      loading.value = true;
      print("login here please");
      print('ready to go to home');
      try {
        // final token = await _userRepository!.login(currentUser!.value);
        // saveToken(token); // Save the token
        await _userRepository!.login(currentUser!.value);
        loading.value = false;
        print('before going to home page');
        Get.toNamed(Routes.HOMEPAGE);
        print('After went to home page');
      } catch (e) {
        print(e.toString());
        Get.showSnackbar(Ui.ErrorSnackBar(message: e.toString()));
        print('snaaaaaaaaak bar');
      } finally {
        loading.value = false;
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
      loading.value = true;
      // print("login here please");
      // print('ready to go to home');
      try {
        // final token = await _userRepository!.login(currentUser!.value);
        // saveToken(token); // Save the token
        await _userRepository!.forgotPassword();
        loading.value = false;
        // print('before going to home page');
        // Get.toNamed(Routes.HOMEPAGE);
        // print('After went to home page');
      } catch (e) {
        print(e.toString());
        Get.showSnackbar(Ui.ErrorSnackBar(message: e.toString()));
        print('snaaaaaaaaak bar');
      } finally {
        loading.value = false;
      }
    }
  }
}
