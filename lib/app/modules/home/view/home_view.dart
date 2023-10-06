// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:paybox/app/modules/auth/controllers/auth_controller.dart';
import 'package:paybox/app/modules/deals/controller/deals_controller.dart';
import 'package:paybox/app/modules/deals/view/deals_details.dart';
import 'package:paybox/app/modules/deals/view/deals_view.dart';
import 'package:paybox/app/modules/home/controller/home_controller.dart';
import 'package:paybox/app/modules/loyalty/controller/loyalty_controller.dart';
import 'package:paybox/app/modules/loyalty/view/loyalty_view.dart';
import 'package:paybox/app/modules/profile/controller/profile_controller.dart';
import 'package:paybox/app/modules/purchases/controller/purchase_controller.dart';
import 'package:paybox/app/modules/purchases/view/purchase_view.dart';
import 'package:paybox/app/modules/root/controller/root_controller.dart';
import 'package:paybox/app/providers/laravel_provider.dart';
import 'package:paybox/app/routes/app_routes.dart';
import 'package:paybox/app/services/global_card.dart';
import 'package:paybox/app/services/global_feature%20card_images.dart';
import 'package:paybox/app/services/global_loyality_card.dart';
import 'package:paybox/app/services/global_shimmer_card.dart';
import 'package:shimmer/shimmer.dart';

import '../../../services/colors/custom_colors.dart';
import '../../../services/global_trending.dart';

class HomeView extends GetView<HomeController> {
  //  final AuthController authController =
  //     Get.put(AuthController());

  final LoyaltyController loyaltyController = Get.put(LoyaltyController());
  final PurchasesController purchasesController =
      Get.put(PurchasesController());
  final ProfileController profileController = Get.put(ProfileController());
  final DealsController dealsController = Get.put(DealsController());

  // final RootController rootController = Get.put(RootController());

  final ScrollController scrollController = ScrollController();
  final int initialScrollOffset = 7 * 100; // 19 items (loyalties) * item height

  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    // final LoyaltyController loyaltyController = LoyaltyController();
    // final PurchasesController purchasesController = PurchasesController();
    GetStorage? _box = GetStorage();

    var token = _box!.read('token');

    Get.log('TOOOKEN in homeView :: $token');

    // loyaltyController.getLoyalties();
    // purchasesController.getPurchases();
    // profileController.getUserProfile();

    Get.log('home view ///');
    // controller.getCategories();
    // controller.getTrendingDeals();
    // controller.getCategories();
    // controller.getStores();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/Vector 3 (1).png'),
                fit: BoxFit.fill,
                alignment: Alignment.centerLeft),
          ),
          child: Center(
            child: Image.asset('assets/images/image 3 (1).png',
                height: 41, width: 133),
          ),
        ),
        toolbarHeight: 98,
        backgroundColor: const Color(0xffFFFFFF),
        elevation: 0,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          Get.find<LaravelApiClient>().forceRefresh();
          controller.refreshHome(showMessage: true);
          // Get.find<LaravelApiClient>().unForceRefresh();
        },
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            color: const Color(0xffFFFFFF),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 36, left: 16, right: 14.56),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextWidget(
                          text: 'My Purchases',
                          textStyle: TextStyle(
                              fontFamily: "Montserrat",
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff000000))),
                      InkWell(
                        onTap: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => PurchasesView()));
                          RootController rootController = Get.find<
                              RootController>(); // Get the existing instance
                          rootController.currentIndex.value = 3;

                          // Get.log(rootController.currentIndex.toString());

                          // rootController.currentIndex.value = 3;
                          // Get.to(PurchasesView());

                          // Get.offAllNamed(Routes.ONBORDING);
                        },
                        child: TextWidget(
                            text: 'View All',
                            textStyle: TextStyle(
                                fontFamily: "Montserrat",
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff1025E4))),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(top: 16, left: 6),
                  child: token != null && token.isNotEmpty
                      ? Obx(() {
                          if (purchasesController.isPurchasesLoading.value ==
                              true) {
                            return const Column(
                              children: [
                                ShimmerList(),
                              ],
                            );
                          } else if (purchasesController.purchases.isEmpty) {
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
                            return Container(
                              height: 200,
                              child: ListView.builder(
                                  itemCount: 2,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Column(
                                      children: purchasesController.purchases
                                          .map((e) => InkWell(
                                                onTap: () {
                                                  print('nav');
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              DealsDetails(
                                                                image:
                                                                    "${e.banner!.name}",
                                                                buisnessName: e
                                                                    .businessName,
                                                                address:
                                                                    e.address,
                                                                saleValue:
                                                                    '${controller.calculateSaleValue(e.startPrice!, e.dealPrice!).toString()}',
                                                                subHeading: e
                                                                    .subHeading,
                                                                endDate:
                                                                    e.endDate,
                                                                startPrice: e
                                                                    .startPrice,
                                                                dealPrice:
                                                                    e.dealPrice,
                                                                description: e
                                                                    .description,
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
                                                      '${controller.calculateSaleValue(e.startPrice!, e.dealPrice!).toString()}% off',
                                                ),
                                              ))
                                          .toList(),
                                    );
                                  }),
                            );
                          }
                        })
                      : Padding(
                          padding: const EdgeInsets.only(left: 14),
                          child: TextWidget(
                              text:
                                  'Nothing to see here yet! Start searching deals, once you purchase, they will be here ready to redeem!',
                              textStyle: TextStyle(
                                fontSize: 14,
                                fontFamily: "Mukta",
                                fontWeight: FontWeight.w600,
                                // color: Color(0xff1025E4)
                              )),
                        ),
                  // Text(
                  //     'Nothing to see here yet! Start searching deals, once you purchase, they will be here ready to redeem!'),
                ),

                Padding(
                  padding: EdgeInsets.only(top: 31, left: 14),
                  child: SizedBox(
                    width: 350,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextWidget(
                            text: 'Trending Deals',
                            textStyle: TextStyle(
                                fontSize: 18,
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.w700,
                                color: Color(0xff000000))),
                        InkWell(
                          onTap: () {
                            RootController rootController = Get.find<
                                RootController>(); // Get the existing instance
                            rootController.currentIndex.value = 2;
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => DealsView()));
                          },
                          child: TextWidget(
                              text: 'View All',
                              textStyle: TextStyle(
                                  fontSize: 12,
                                  fontFamily: "Montserrat",
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff1025E4))),
                        ),
                      ],
                    ),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 16, top: 22, right: 16),
                    child: SizedBox(
                      height: 190,
                      child: Obx(() {
                        if (controller.isTrendingDealsLoading.value == true) {
                          return const Row(
                            children: [
                              ShimmerList(),
                            ],
                          );
                        }
                        if (controller.trendingDeals.isEmpty) {
                          // Return a loading indicator or any other placeholder
                          return Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('No Deals to show'),
                            ),
                          );
                          // Replace with your loading widget
                        } else {
                          return Row(
                            children: controller.trendingDeals
                                .map((e) => InkWell(
                                      onTap: () {
                                        print('nav');
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    DealsDetails(
                                                      image: e.banner!.name,
                                                      buisnessName:
                                                          e.businessName,
                                                      address: e.address,
                                                      saleValue:
                                                          '${controller.calculateSaleValue(e.startPrice!, e.dealPrice!).toString()}',
                                                      subHeading: e.subHeading,
                                                      endDate: e.endDate,
                                                      startPrice: e.startPrice,
                                                      dealPrice: e.dealPrice,
                                                      description:
                                                          e.description,
                                                      about: e.about,
                                                    )));
                                      },
                                      child: MyTrendingDeals(
                                        avatarpath: e.logo!.name,
                                        title: e.businessName,
                                        salevalue:
                                            '${controller.calculateSaleValue(e.startPrice!, e.dealPrice!).toString()}% off',
                                      ),
                                    ))
                                .toList(),
                          );
                        }
                      }),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20, left: 15),
                  child: SizedBox(
                    width: 350,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextWidget(
                            text: 'Loyalty',
                            textStyle: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 18,
                                fontFamily: "Montserrat",
                                color: Color(0xff000000))),
                        InkWell(
                          onTap: () {
                            RootController rootController = Get.find<
                                RootController>(); // Get the existing instance
                            rootController.currentIndex.value = 1;
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => LoyaltyView()));
                          },
                          child: TextWidget(
                              text: 'View All',
                              textStyle: TextStyle(
                                  fontSize: 12,
                                  fontFamily: "Montserrat",
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff1025E4))),
                        ),
                      ],
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 16, left: 16, right: 120),
                  child: TextWidget(
                      text: 'Earn loyalty rewards every time you spend',
                      textStyle: TextStyle(
                          fontSize: 14,
                          fontFamily: "Mukta",
                          fontWeight: FontWeight.w400,
                          color: Color(0xff000000))),
                ),
                token == null
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
                    : Obx(() {
                        if (loyaltyController.isLoyaltyLoading.value == true) {
                          return const Row(
                            children: [
                              ShimmerList(),
                            ],
                          );
                        }
                        if (loyaltyController.loyalties.isEmpty) {
                          // Return a loading indicator or any other placeholder
                          return Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('No Loyalties to show'),
                            ),
                          );
                          // Replace with your loading widget
                        } else {
                          return SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: loyaltyController.loyalties
                                  .map((e) => InkWell(
                                        onTap: () async {
                                          Get.log(loyaltyController
                                              .loyalties.length
                                              .toString());
                                          RootController rootController =
                                              Get.find<RootController>();

                                          loyaltyController.targetIndex!.value =
                                              e.id!; // Get the existing instance

                                          rootController.currentIndex.value = 1;

                                          await Future.delayed(
                                              Duration(seconds: 5));

                                          loyaltyController.targetIndex!.value =
                                              0;

                                          // Navigator.push(
                                          //     context,
                                          //     MaterialPageRoute(
                                          //         builder: (context) =>
                                          //             LoyaltyView(
                                          //               scrollController:
                                          //                   scrollController,
                                          //               initialScrollOffset:
                                          //                   initialScrollOffset,
                                          //             )));
                                        },
                                        child: MyLoyalityCard(
                                          avatarpath:
                                              "${e.banner!.path}/${e.banner!.name}",
                                          title: e.name,
                                          subtitle: e.shortInfo,
                                          location: e.distance,
                                          mainpctrpath:
                                              "${e.logo!.path}/${e.logo!.name}",
                                        ),
                                      ))
                                  .toList(),
                            ),
                          );
                        }
                      }),
                // const Padding(
                //   padding: EdgeInsets.only(top: 19, left: 8),
                //   child: Row(
                //     children: [
                //       MyLoyalityCard(
                //         avatarpath: "assets/images/Burger & Co (5).png",
                //         title: "Bingo Balls",
                //         subtitle: "Adult Ball Pit Bar",
                //         location: "2km away",
                //         mainpctrpath: "assets/images/Ellipse 1.png",
                //       ),
                //       MyLoyalityCard(
                //         avatarpath: "assets/images/Burger & Co (1).png",
                //         title: "Burger & Co ",
                //         subtitle: "Fast Food",
                //         location: "6km away",
                //         mainpctrpath: "assets/images/Ellipse 2.png",
                //       ),
                //     ],
                //   ),
                // ),
                // const Padding(
                //   padding: EdgeInsets.only(top: 19, left: 8),
                //   child: Row(
                //     children: [
                //       MyLoyalityCard(
                //         avatarpath: "assets/images/Burger & Co (6).png",
                //         title: "Chicken Shack",
                //         subtitle: "Fast Food",
                //         location: "7km away",
                //         mainpctrpath: "assets/images/Group (1).png",
                //       ),
                //       MyLoyalityCard(
                //         avatarpath: "assets/images/Burger & Co (7).png",
                //         title: "Dunkin’ Burgers",
                //         subtitle: "Fast Food",
                //         location: "8km away",
                //         mainpctrpath: "assets/images/Group (2).png",
                //       ),
                //     ],
                //   ),
                // ),
                // Padding(
                //   padding: const EdgeInsets.only(right: 240, top: 19),
                //   child: Container(
                //     color: const Color(0xffFFFFFF),
                //     child: const TextWidget(
                //         text: 'Featured Brands',
                //         textStyle: TextStyle(
                //             fontSize: 18,
                //             fontWeight: FontWeight.w700,
                //             color: Color(0xff000000))),
                //   ),
                // ),
                // const Padding(
                //   padding: EdgeInsets.only(top: 19),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //     children: [
                //       GlobalImageCard(
                //           imagePath: "assets/images/Range Dessert.png",
                //           width: 83,
                //           height: 83),
                //       GlobalImageCard(
                //           imagePath: "assets/images/13 (1) 1.png",
                //           width: 83,
                //           height: 83),
                //       GlobalImageCard(
                //           imagePath: "assets/images/Group 157 (1).png",
                //           width: 83,
                //           height: 83),
                //       GlobalImageCard(
                //           imagePath: "assets/images/Vector (10).png",
                //           width: 90,
                //           height: 90),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
