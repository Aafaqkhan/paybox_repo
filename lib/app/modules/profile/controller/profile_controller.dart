import 'package:get/get.dart';
import 'package:paybox/app/repositories/home_repositories.dart';
import 'package:paybox/app/repositories/profile_repositories.dart';
import 'package:paybox/commonWidget/ui.dart';

class ProfileController extends GetxController {
  ProfileRepository? _profileRepository;

  ProfileController() {
    _profileRepository = ProfileRepository();
  }

  void getUserProfile() async {
    print('$_profileRepository');
    // Get.focusScope!.unfocus();
    // if (registerFormKey!.currentState!.validate()) {
    //   registerFormKey!.currentState!.save();
    //   loading.value = true;
    // print("register here please");
    print('ready to fetch getUserProfile apis');
    try {
      if (_profileRepository == null) print('nulleee');
      await _profileRepository!.getUserProfile();
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

  void deleteUser() async {
    print('$_profileRepository');
    // Get.focusScope!.unfocus();
    // if (registerFormKey!.currentState!.validate()) {
    //   registerFormKey!.currentState!.save();
    //   loading.value = true;
    // print("register here please");
    print('ready to fetch deleteUser api');
    try {
      if (_profileRepository == null) print('_profileRepository is null');
      await _profileRepository!.deleteUser();
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
      // loginFormKey!.currentState!.save();
      // loading.value = true;
      // print("login here please");
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

  void updateProfile() async {
    Get.focusScope!.unfocus();
    if (1 == 1
        // loading.value == false
        // loginFormKey!.currentState!.validate()
        ) {
      // loginFormKey!.currentState!.save();
      // loading.value = true;
      // print("login here please");
      print('ready to call updateProfile API');
      try {
        // final token = await _userRepository!.login(currentUser!.value);
        // saveToken(token); // Save the token
        await _profileRepository!.updateProfile();
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

  void updateUser() async {
    Get.focusScope!.unfocus();
    if (1 == 1
        // loading.value == false
        // loginFormKey!.currentState!.validate()
        ) {
      // loginFormKey!.currentState!.save();
      // loading.value = true;
      // print("login here please");
      print('ready to call updateUser API');
      try {
        // final token = await _userRepository!.login(currentUser!.value);
        // saveToken(token); // Save the token
        await _profileRepository!.updateUser();
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

  Future refreshMessages() async {
    // messages.clear();
    // lastDocument = new Rx<DocumentSnapshot>(null);
    // await listenForMessages();
  }
}
