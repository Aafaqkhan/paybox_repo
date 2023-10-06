import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:paybox/app/modules/profile/controller/profile_controller.dart';
import 'package:paybox/app/modules/profile/view/profile_view.dart';
import 'package:paybox/app/modules/purchases/controller/purchase_controller.dart';

import '../../../modules/deals/controller/deals_controller.dart';
import '../../../routes/app_routes.dart';
import '../../deals/view/deals_view.dart';
import '../../home/controller/home_controller.dart';
import '../../home/view/home_view.dart';
import '../../loyalty/controller/loyalty_controller.dart';
import '../../loyalty/view/loyalty_view.dart';
import '../../purchases/view/purchase_view.dart';

class RootController extends GetxController {
  final ScrollController scrollController = ScrollController();
  final int initialScrollOffset = 7 * 90;
  final currentIndex = 0.obs;
  List<Widget> pages = [
    HomeView(),
    LoyaltyView(),
    DealsView(),
    PurchasesView(),
    ProfileView()
  ];

  Widget get currentPage => pages[currentIndex.value];

  //Controle all the screen in the home screen

  Future<void> changePageInRoot(int index) async {
    currentIndex.value = index;
    // await refreshPage(index);
  }

  Future<void> changePageOutRoot(int index) async {
    if (index > 0) {
      await Get.toNamed(Routes.LOGIN);
    }
    currentIndex.value = index;
    await refreshPage(index);
    await Get.offNamedUntil(Routes.LOGIN, (Route route) {
      if (route.settings.name == Routes.LOGIN) {
        return true;
      }
      return false;
    }, arguments: index);
  }

  Future<void> changePage(int index) async {
    changePageInRoot(index);

    // if (Get.currentRoute == Routes.ROOT) {
    //   await changePageInRoot(index);
    // } else {
    //   await changePageOutRoot(index);
    // }
  }

  Future<void> refreshPage(int index) async {
    switch (index) {
      case 0:
        {
          await Get.find<HomeController>().refreshHome();
          break;
        }
      case 1:
        {
          await Get.find<LoyaltyController>().refreshBookings();
          break;
        }
      case 2:
        {
          await Get.find<DealsController>().refreshDeals();
          break;
        }
      case 3:
        {
          await Get.find<ProfileController>().refreshMessages();
          break;
        }
      case 4:
        {
          await Get.find<PurchasesController>(); //.refreshMessages();
          break;
        }
    }
  }
}
