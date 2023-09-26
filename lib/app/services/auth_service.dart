import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:paybox/app/services/setting_service.dart';

import '../models/user_model.dart';
import '../repositories/user_repositories.dart';

class AuthService extends GetxService {
  final user = User().obs;
  GetStorage? _box;

  UserRepository? _usersRepo;

  AuthService() {
    _usersRepo = UserRepository();
    _box = GetStorage();
  }

  Future<AuthService> init() async {
    user.listen((User user) {
      if (Get.isRegistered<SettingsService>()) {
        Get.find<SettingsService>().address.value.userId = user.id!;
      }
      _box!.write('current_user', user.toJson());
    });
    await getCurrentUser();
    return this;
  }

  Future getCurrentUser() async {
    if (user.value.auth == null && _box!.hasData('current_user')) {
      user.value = User.fromJson(await _box!.read('current_user'));
      user.value.auth = true;
    } else {
      user.value.auth = false;
    }
  }

  // Future removeCurrentUser() async {
  //   user.value = new User();
  //   await _usersRepo!.signOut();
  //   await _box!.remove('current_user');
  // }
  String get token => user.value.apiToken.toString();
  bool get isAuth => user.value.auth;

  // String get apiToken => (user.value.auth) ? user.value.apiToken : '';
}
