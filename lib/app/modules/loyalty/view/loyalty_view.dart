import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:paybox/app/modules/loyalty/view/collect_points_panel.dart';
import 'package:paybox/app/providers/laravel_provider.dart';
import 'package:paybox/app/services/global_filter.dart';
import 'package:paybox/app/services/global_loyalityoints_img.dart';
import 'package:paybox/app/services/global_loyalty_view_card.dart';
import 'package:paybox/app/services/global_shimmer_card.dart';

import '../../../services/colors/custom_colors.dart';
import '../controller/loyalty_controller.dart';

class LoyaltyView extends GetView<LoyaltyController> {
  const LoyaltyView({super.key});

  @override
  Widget build(BuildContext context) {
    controller.getLoyalties();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/Vector 3 (1).png'),
              fit: BoxFit.fill,
            ),
          ),
        ),
        toolbarHeight: 124,
        backgroundColor: const Color(0xffFFFFFF),
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(bottom: 59, top: 30),
          child: Container(
            height: 45,
            width: 328,
            decoration: BoxDecoration(
                color: const Color(0xffFFFFFF),
                borderRadius: BorderRadius.circular(24)),
            child: TextField(
              decoration: InputDecoration(
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                hintText: 'Search by item, brand or location',
                hintStyle: const TextStyle(
                    fontSize: 14,
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w400,
                    color: Color(0xff49454F)),
                suffixIcon: const Icon(
                  Icons.search,
                  color: Color(0xff49454F),
                ),
                prefixIcon: InkWell(
                  onTap: () {
                    Get.log('Location Icon Tapped');
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return MyFilterDialog();
                      },
                    );
                  },
                  child: const Icon(
                    Icons.location_on,
                    color: Color(0xff000000),
                  ),
                ),
              ),
            ),
          ),
        ),
        centerTitle: true,
      ),
<<<<<<< HEAD
      body: RefreshIndicator(
        onRefresh: () async {
          Get.find<LaravelApiClient>().forceRefresh();
          controller.refreshLoyalty(showMessage: true);
          // Get.find<LaravelApiClient>().unForceRefresh();
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 12, top: 16),
                child: Obx(() {
                  return controller.loyalties.isEmpty
                      ? const SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              ShimmerList(),
                            ],
                          ),
                        )
                      : Container(
                          height: 560,
                          child: ListView.builder(
                            itemCount: controller.loyalties.length,
                            itemBuilder: (BuildContext context, int index) {
                              final loyalty = controller.loyalties[index];

                              List<RxBool> isPanelVisibleList = controller
                                  .loyalties
                                  .map((_) => false.obs)
                                  .toList();

                              return Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      isPanelVisibleList[index].value =
                                          !isPanelVisibleList[index].value;
                                      Get.log(isPanelVisibleList.toString());
                                    },
                                    child: MyLoyalityView(
                                      avatarpath:
                                          "${loyalty.banner!.path}/${loyalty.banner!.name}",
                                      title: loyalty.name,
                                      subtitle: loyalty.shortInfo,
                                      location: loyalty.distance,
                                      mainpctrpath:
                                          "${loyalty.logo!.path}/${loyalty.logo!.name}",
                                    ),
                                  ),
                                  // The additional container that is visible when isPanelVisible is true
                                  Obx(() {
                                    return Visibility(
                                      visible: isPanelVisibleList[index].value,
                                      child: Container(
                                          // Customize the appearance of the additional container as needed
                                          padding: const EdgeInsets.all(16),
                                          // color: Colors.grey,
                                          child: CollectPointsPanel(
                                            loyalty: loyalty,
                                            // pinCode: loyalty.pinCode,
                                            // userPoints: loyalty.userPoints,
                                            // description: loyalty.description,
                                            // // redeemPoints: loyalty
                                            // //     .loyaltyRedeemRules![subIndex]
                                            // // .points,
                                            // redeemPoints: rule.points ?? '000',
                                            // name: rule.name ?? 'ASD',
                                          )),
                                    );
                                  }),
                                ],
                              );
                            },
                          ),
                        );
                }),
              ),
            ],
          ),
=======
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 12, top: 16),
              child: Obx(() {
                return controller.loyalties.isEmpty
                    ? const SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            ShimmerList(),
                          ],
                        ),
                      )
                    : Container(
                        height: 560,
                        child: ListView.builder(
                          itemCount: controller.loyalties.length,
                          itemBuilder: (BuildContext context, int index) {
                            final loyalty = controller.loyalties[index];

                            List<RxBool> isPanelVisibleList = controller
                                .loyalties
                                .map((_) => false.obs)
                                .toList();

                            return Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    isPanelVisibleList[index].value =
                                        !isPanelVisibleList[index].value;
                                    Get.log(isPanelVisibleList.toString());
                                  },
                                  child: MyLoyalityView(
                                    avatarpath:
                                        "${loyalty.banner!.path}/${loyalty.banner!.name}",
                                    title: loyalty.name,
                                    subtitle: loyalty.shortInfo,
                                    location: loyalty.distance,
                                    mainpctrpath:
                                        "${loyalty.logo!.path}/${loyalty.logo!.name}",
                                  ),
                                ),
                                // The additional container that is visible when isPanelVisible is true
                                Obx(() {
                                  return Visibility(
                                    visible: isPanelVisibleList[index].value,
                                    child: Container(
                                      // Customize the appearance of the additional container as needed
                                      padding: const EdgeInsets.all(16),
                                      color: Colors.grey,
                                      child: ListView.builder(
                                        shrinkWrap: true,
                                        itemCount:
                                            loyalty.loyaltyRedeemRules.length,
                                        // itemCount: loyalty.length,
                                        itemBuilder: (BuildContext context,
                                            int subIndex) {
                                          final rule = loyalty
                                              .loyaltyRedeemRules[subIndex];
                                          return CollectPointsPanel(
                                            pinCode: loyalty.pinCode,
                                            userPoints: loyalty.userPoints,
                                            description: loyalty.description,
                                            // redeemPoints: loyalty
                                            //     .loyaltyRedeemRules![subIndex]
                                            // .points,
                                            redeemPoints: rule.points ?? '000',
                                            name: rule.name ?? 'ASD',
                                          );
                                        },
                                      ),
                                    ),
                                  );
                                }),
                              ],
                            );
                          },
                        ),
                      );
              }),
            ),
          ],
>>>>>>> c931483518b3abff07e356e13cda4a3dea0c28e8
        ),
      ),
    );
  }
}
