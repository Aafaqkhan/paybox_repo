import 'dart:io';

import 'package:get/get.dart';
import 'package:paybox/app/models/user_model.dart';
import 'package:paybox/app/providers/laravel_provider.dart';

class ProfileRepository {
  LaravelApiClient? _laravelApiClient;

  ProfileRepository() {
    _laravelApiClient = LaravelApiClient();
  }

  Future<User> getUserProfile() {
    _laravelApiClient = Get.find<LaravelApiClient>();
    print('00000');
    return _laravelApiClient!.getUserProfile();
  }

  Future<void> getAllUsers() {
    _laravelApiClient = Get.find<LaravelApiClient>();
    print('00000');
    return _laravelApiClient!.getAllUsers();
  }

  Future getDeleteUser() {
    print('3');
    if (_laravelApiClient == null) print('4');
    return _laravelApiClient!.getDeleteUser();
  }

  Future<void> restoreUpdate() {
    _laravelApiClient = Get.find<LaravelApiClient>();
    print('00000');
    return _laravelApiClient!.restoreUpdate();
  }

  Future<void> storeToken() {
    _laravelApiClient = Get.find<LaravelApiClient>();
    print('00000');
    return _laravelApiClient!.storeToken();
  }

  Future<void> updateProfilePicture(File? profileImage) {
    _laravelApiClient = Get.find<LaravelApiClient>();

    return _laravelApiClient!.updateProfileImage(profileImage);
  }

  Future<void> updateUser(User user) {
    _laravelApiClient = Get.find<LaravelApiClient>();

    return _laravelApiClient!.updateUser(user);
  }
}
