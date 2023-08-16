import 'package:get/get.dart';
import 'package:paybox/app/providers/laravel_provider.dart';

class ProfileRepository {
  LaravelApiClient? _laravelApiClient;

  ProfileRepository();

  asd() {
    print('aaaaaaaaaaaaaa');
  }

  Future<void> getUserProfile() {
    _laravelApiClient = Get.find<LaravelApiClient>();
    print('00000');
    return _laravelApiClient!.getUserProfile();
  }

  Future<void> getAllUsers() {
    _laravelApiClient = Get.find<LaravelApiClient>();
    print('00000');
    return _laravelApiClient!.getAllUsers();
  }

  Future<void> deleteUser() {
    _laravelApiClient = Get.find<LaravelApiClient>();
    print('00000');
    return _laravelApiClient!.deleteUser();
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

  Future<void> updateProfile() {
    _laravelApiClient = Get.find<LaravelApiClient>();
    print('00000');
    return _laravelApiClient!.updateProfile();
  }

  Future<void> updateUser() {
    _laravelApiClient = Get.find<LaravelApiClient>();
    print('00000');
    return _laravelApiClient!.updateUser();
  }
}
