import 'package:get/get.dart';
import 'package:paybox/app/modules/auth/controllers/auth_controller.dart';

import '../controller/profile_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(
      () => ProfileController(),
    );

    Get.lazyPut<AuthController>(
      () => AuthController(),
    );

    Get.put<AuthController>(
      AuthController(),
    );
  }
}
