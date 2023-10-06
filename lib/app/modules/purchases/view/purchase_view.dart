import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get_storage/get_storage.dart';
import 'package:paybox/app/modules/deals/view/deals_details.dart';
import 'package:paybox/app/modules/home/controller/home_controller.dart';
import 'package:paybox/app/modules/purchases/controller/purchase_controller.dart';
import 'package:paybox/app/providers/laravel_provider.dart';
import 'package:paybox/app/services/colors/custom_colors.dart';
import 'package:paybox/app/services/global_card.dart';
import 'package:paybox/app/services/global_filter.dart';
import 'package:paybox/app/services/global_shimmer_card.dart';
import 'package:paybox/commonWidget/custom_bottom_navbar.dart';

class PurchasesView extends GetView<PurchasesController> {
  PurchasesView({super.key});

  // TextEditingController searchController = TextEditingController();
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    // controller.getPurchases();

    GetStorage? _box = GetStorage();

    var token = _box!.read('token');
    // controller.filterPurchases('');
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
          padding: const EdgeInsets.only(bottom: 59, top: 20),
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
              //   controller.filterPurchases(value);
              //   Get.log(controller.filteredPurchases.toString());
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
          controller.refreshPurchases(showMessage: true);
          // Get.find<LaravelApiClient>().unForceRefresh();
        },
        child: token == null
            ? const Padding(
                padding: EdgeInsets.only(left: 14),
                child: TextWidget(
                    text:
                        'Nothing to see here yet! Start searching deals, once you purchase, they will be here ready to redeem!',
                    textStyle: TextStyle(
                      fontSize: 14,
                      fontFamily: "Mukta",
                      fontWeight: FontWeight.w600,
                      // color: Color(0xff1025E4)
                    )),
              )
            : Padding(
                padding: const EdgeInsets.only(top: 0, left: 0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 0, top: 0, right: 0),
                    child: Obx(() {
                      if (controller.isPurchasesLoading.value == true) {
                        return const Column(
                          children: [
                            ShimmerList(),
                          ],
                        );
                      } else if (controller.purchases.isEmpty) {
                        // Return a loading indicator or any other placeholder
                        return const Center(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                                'Nothing to see here yet! Start searching deals, once you purchase, they will be here ready to redeem!',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "Mukta",
                                  fontWeight: FontWeight.w600,
                                  // color: Color(0xff1025E4)
                                )),
                          ),
                        );
                        // return const Column(
                        //   children: [
                        //     ShimmerList(),
                        //   ],
                        // ); // Replace with your loading widget
                      } else {
                        return Column(
                          children: controller.purchases
                              .map((e) => InkWell(
                                    onTap: () {
                                      print('nav');
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  DealsDetails(
                                                    image: "${e.banner!.name}",
                                                    buisnessName:
                                                        e.businessName,
                                                    address: e.address,
                                                    saleValue:
                                                        '${homeController.calculateSaleValue(e.startPrice!, e.dealPrice!).toString()}',
                                                    subHeading: e.subHeading,
                                                    endDate: e.endDate,
                                                    startPrice: e.startPrice,
                                                    dealPrice: e.dealPrice,
                                                    description: e.description,
                                                    about: e.about,
                                                  )));
                                    },
                                    child: MyPurchases(
                                      mainpctrpath:
                                          "${e.banner!.path}/${e.banner!.name}",
                                      title: e.businessName,
                                      avatarpath:
                                          "${e.logo!.path}/${e.logo!.name}",
                                      subtitle: e.address,
                                      openingtime: e.subHeading,
                                      oldprize: e.startPrice,
                                      newprize: e.dealPrice,
                                      salevalue:
                                          '${homeController.calculateSaleValue(e.startPrice!, e.dealPrice!).toString()}% off',
                                    ),
                                  ))
                              .toList(),
                        );
                      }
                    }),
                  ),
                ),
              ),
      ),
    );
  }
}
