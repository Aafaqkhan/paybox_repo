import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../commonWidget/custom_bottom_navbar.dart';
import '../controller/root_controller.dart';

class RootView extends GetView<RootController> {
  const RootView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        body: controller.currentPage,
        bottomNavigationBar: CustomBottomNavigationBar(
          backgroundColor: const Color(0xff3242F6),
          itemColor: Colors.white,
          // itemColor: context.theme.colorScheme.secondary,
          currentIndex: controller.currentIndex.value,
          onChange: (index) {
            controller.changePage(index);
          },
          children: [
            CustomBottomNavigationItem(
              icon: Icons.home,
              color: const Color(0xffFFFFFF),
              label: "Home".tr,
            ),
            CustomBottomNavigationItem(
              icon: Icons.handshake_outlined,
              color: const Color(0xffFFFFFF),
              label: "Loyalty".tr,
            ),
            CustomBottomNavigationItem(
              icon: Icons.percent_outlined,
              color: const Color(0xffFFFFFF),
              label: "Deals".tr,
            ),
            CustomBottomNavigationItem(
              icon: Icons.production_quantity_limits,
              color: const Color(0xffFFFFFF),
              label: "Purchases".tr,
            ),
            CustomBottomNavigationItem(
              icon: Icons.account_circle,
              color: const Color(0xffFFFFFF),
              label: "Profile".tr,
            ),
          ],
        ),
      );
    });
  }
}
