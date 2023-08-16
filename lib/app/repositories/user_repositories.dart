import 'package:get/get.dart';
import 'package:paybox/app/providers/laravel_provider.dart';

import '../models/user_model.dart';

class UserRepository {
  LaravelApiClient? _laravelApiClient;

  UserRepository();
  Future<User> register(User user) {
    _laravelApiClient = Get.find<LaravelApiClient>();
    print('00000');
    return _laravelApiClient!.register(user);
  }

  Future<User> login(User user) {
    _laravelApiClient = Get.find<LaravelApiClient>();
    print('00000');
    return _laravelApiClient!.login(user);
  }

  Future<User> forgotPassword() {
    _laravelApiClient = Get.find<LaravelApiClient>();
    print('00000');
    return _laravelApiClient!.forgotPassword();
  }
}
