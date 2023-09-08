import 'package:get/get.dart';
import 'package:paybox/app/modules/deals/controller/deals_controller.dart';
import 'package:paybox/app/modules/home/controller/home_controller.dart';
import 'package:paybox/app/modules/loyalty/controller/loyalty_controller.dart';
import 'package:paybox/app/modules/profile/controller/profile_controller.dart';
import 'package:paybox/app/modules/purchases/controller/purchase_controller.dart';
import 'package:paybox/app/modules/root/controller/root_controller.dart';

class RootBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RootController>(
      () => RootController(),
    );

    Get.lazyPut<HomeController>(
      () => HomeController(),
    );

    Get.lazyPut<ProfileController>(
      () => ProfileController(),
    );

    Get.lazyPut<DealsController>(
      () => DealsController(),
    );

    Get.lazyPut<LoyaltyController>(
      () => LoyaltyController(),
    );

    Get.lazyPut<PurchasesController>(
      () => PurchasesController(),
    );
  }
}
