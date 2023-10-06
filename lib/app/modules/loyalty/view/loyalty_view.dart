import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:paybox/app/modules/loyalty/view/collect_points_panel.dart';
import 'package:paybox/app/providers/laravel_provider.dart';
import 'package:paybox/app/routes/app_routes.dart';
import 'package:paybox/app/services/global_filter.dart';
import 'package:paybox/app/services/global_loyalityoints_img.dart';
import 'package:paybox/app/services/global_loyalty_view_card.dart';
import 'package:paybox/app/services/global_shimmer_card.dart';

import '../../../services/colors/custom_colors.dart';
import '../controller/loyalty_controller.dart';

class LoyaltyView extends GetView<LoyaltyController> {
  final ScrollController scrollController = ScrollController();
  // final int initialScrollOffset;

  LoyaltyView({
    super.key,
    //  required this.scrollController,
    // this.initialScrollOffset = 8 * 100,
  });

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // controller.getLoyalties();
    // controller.targetIndex.value = 0;

    GetStorage? _box = GetStorage();

    var token = _box!.read('token');
    // controller.filterLoyalties('');
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
              readOnly: true,
              // controller: searchController,
              // onChanged: (value) {
              //   controller.filterLoyalties(value);
              //   // Get.log(controller.filteredLoyalties.toString());
              // },
              decoration: InputDecoration(
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                hintText: 'Search by item, brand or location',
                hintStyle: const TextStyle(
                    fontSize: 14,
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w400,
                    color: Color(0xff49454F)),
                suffixIcon: InkWell(
                  onTap: () async {
                    Get.log('Location Icon Tapped');

                    // Get.log('Latitude ::: ${controller.latitude.value}');
                    // Get.log('Longitude ::: ${controller.longitude.value}');

                    // Get.log(controller.filterApplied.value.toString());
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return MyFilterDialog();
                      },
                    );
                  },
                  child: const Icon(
                    Icons.search,
                    color: Color(0xff49454F),
                  ),
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
      body: RefreshIndicator(
        onRefresh: () async {
          Get.find<LaravelApiClient>().forceRefresh();
          controller.refreshLoyalty(showMessage: true);
          // Get.find<LaravelApiClient>().unForceRefresh();
        },
        child: token == null
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Please ",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontFamily: "Montserrat",
                          fontSize: 12),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.offAllNamed(Routes.LOGIN);
                      },
                      child: Text(
                        "Login here",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: "Montserrat",
                            color: AppColors.greencolr,
                            fontSize: 13),
                      ),
                    ),
                  ],
                ),
              )
            : SingleChildScrollView(
                child: Column(
                  children: [
                    ///   Searched Loayalties

                    // Obx(
                    //   () {
                    //     return controller.filteredLoyalties.isEmpty
                    //         ? Text('No Loyalties Found')
                    //         : SizedBox(
                    //             height: 200,
                    //             child: ListView.builder(
                    //               itemCount: controller.filteredLoyalties.length,
                    //               itemBuilder: (context, index) {
                    //                 final loyalty =
                    //                     controller.filteredLoyalties[index];
                    //                 Get.log(loyalty.name.toString());
                    //                 return ListTile(
                    //                   title: Text(loyalty.name.toString()),
                    //                   // Add other loyalty information as needed
                    //                 );
                    //               },
                    //             ),
                    //           );
                    //   },
                    // ),

                    ///   Searched Loayalties
                    Padding(
                      padding: const EdgeInsets.only(left: 12, top: 16),
                      child: Obx(() {
                        if (controller.isLoyaltyLoading.value == true) {
                          return const Row(
                            children: [
                              ShimmerList(),
                            ],
                          );
                        }
                        if (controller.loyalties.isEmpty) {
                          // Return a loading indicator or any other placeholder
                          return const Center(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text('No Loyalties to show'),
                            ),
                          );
                          // Replace with your loading widget
                        } else {
                          return Container(
                            height: 560,
                            child: ListView.builder(
                              controller: scrollController,
                              itemCount: controller.loyalties.length,
                              itemBuilder: (BuildContext context, int index) {
                                final loyalty = controller.loyalties[index];

                                List<RxBool> isPanelVisibleList = controller
                                    .loyalties
                                    .map((_) => false.obs)
                                    .toList();

                                // Check if the current index matches the target index
                                if (index == controller.targetIndex!.value) {
                                  // Scroll to this index
                                  WidgetsBinding.instance
                                      ?.addPostFrameCallback((_) {
                                    scrollController.animateTo(
                                      index *
                                          90, // Adjust itemHeight according to your item size
                                      duration:
                                          const Duration(milliseconds: 500),
                                      curve: Curves.easeInOut,
                                    );
                                  });
                                }

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
                                        visible:
                                            isPanelVisibleList[index].value,
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
                        }
                      }),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
