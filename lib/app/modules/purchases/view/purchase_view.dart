import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:paybox/app/modules/deals/view/deals_details.dart';
import 'package:paybox/app/modules/purchases/controller/purchase_controller.dart';
import 'package:paybox/app/providers/laravel_provider.dart';
import 'package:paybox/app/services/global_card.dart';
import 'package:paybox/app/services/global_filter.dart';
import 'package:paybox/app/services/global_shimmer_card.dart';

class PurchasesView extends GetView<PurchasesController> {
  const PurchasesView({super.key});

  @override
  Widget build(BuildContext context) {
    controller.getPurchases();
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
      body: RefreshIndicator(
        onRefresh: () async {
          Get.find<LaravelApiClient>().forceRefresh();
          controller.refreshPurchases(showMessage: true);
          // Get.find<LaravelApiClient>().unForceRefresh();
        },
        child: Padding(
          padding: const EdgeInsets.only(top: 0, left: 0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.only(left: 0, top: 0, right: 0),
              child: Obx(() {
                if (controller.purchases.isEmpty) {
                  // Return a loading indicator or any other placeholder
                  return const Column(
                    children: [
                      ShimmerList(),
                    ],
                  ); // Replace with your loading widget
                } else {
                  return Column(
                    children: controller.purchases
                        .map((e) => InkWell(
                              onTap: () {
                                print('nav');
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DealsDetails(
                                              image:
                                                  "${e.banner!.path}/${e.banner!.name}",
                                              buisnessName: e.name,
                                              address: e.address,
                                              saleValue: '25% ',
                                              subHeading: e.shortInfo,
                                              endDate: '11/11/11',
                                              startPrice: "£ 52",
                                              dealPrice: "£ 42",
                                              description: e.description,
                                              about: e.description,
                                            )));
                              },
                              child: MyPurchases(
                                mainpctrpath:
                                    "${e.banner!.path}/${e.banner!.name}",
                                title: e.name,
                                avatarpath: "${e.logo!.path}/${e.logo!.name}",
                                subtitle: e.address,
                                openingtime: "After Noon Tea for 2",
                                oldprize: "£ 52",
                                newprize: "£ 39",
                                salevalue: "25% off",
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
      // const SingleChildScrollView(
      //   child: Column(
      //     children: [
      //       Padding(
      //         padding: EdgeInsets.only(left: 6),
      //         child: MyPurchases(
      //           avatarpath: "assets/images/Range Dessert.png",
      //           title: "Range Desserts",
      //           subtitle: "66c Beech Rd, Chorlton-cum-Hardy, Manchester M21 EG",
      //           openingtime: "After Noon Tea for 2",
      //           oldprize: "£ 52",
      //           newprize: "£ 39",
      //           mainpctrpath: "assets/images/Rectangle 15 (1).png",
      //           salevalue: "25% off",
      //         ),
      //       ),
      //       Padding(
      //         padding: EdgeInsets.only(left: 6, top: 16),
      //         child: MyPurchases(
      //           avatarpath: "assets/images/purch title.png",
      //           title: "Dolly and Dimples",
      //           subtitle: "2 Copson Street, Manchester M20 3HE",
      //           openingtime: "Hot Stone Massage ",
      //           oldprize: "£ 52",
      //           newprize: "£ 35",
      //           mainpctrpath: "assets/images/purch view (5).png",
      //           salevalue: "25% off",
      //         ),
      //       ),
      //       Padding(
      //         padding: EdgeInsets.only(left: 6, top: 16),
      //         child: MyPurchases(
      //           avatarpath: "assets/images/purch title (1).png",
      //           title: "Withington Barbers Shop ",
      //           subtitle: "468 Wilmslow Road, Withington, Manchester M20 3BG",
      //           openingtime: "Full service ",
      //           oldprize: "£ 35",
      //           newprize: "£ 22",
      //           mainpctrpath: "assets/images/purch view (4).png",
      //           salevalue: "37% off",
      //         ),
      //       ),
      //       Padding(
      //         padding: EdgeInsets.only(left: 6, top: 16),
      //         child: MyPurchases(
      //           avatarpath: "assets/images/purch title (3).png",
      //           title: "The Olympus Projects",
      //           subtitle: "109- 113 Corporation Street, Manchester M4 4DX",
      //           openingtime: "Kettlebell Class ",
      //           oldprize: "£ 15",
      //           newprize: "£ 7",
      //           mainpctrpath: "assets/images/purch view (3).png",
      //           salevalue: "50% off",
      //         ),
      //       ),
      //       Padding(
      //         padding: EdgeInsets.only(left: 6, top: 16),
      //         child: MyPurchases(
      //           avatarpath: "assets/images/purch title (2).png",
      //           title: "Cibo",
      //           subtitle: "109- 113 Corporation Street, Manchester M4 4DX",
      //           openingtime: "2 Course Italian meal for 2 ",
      //           oldprize: "£ 62",
      //           newprize: "£ 33",
      //           mainpctrpath: "assets/images/purch view (2).png",
      //           salevalue: "46% off",
      //         ),
      //       ),
      //       Padding(
      //         padding: EdgeInsets.only(left: 6, top: 16),
      //         child: MyPurchases(
      //           avatarpath: "assets/images/Group 216.png",
      //           title: "The Glow Up Studio ",
      //           subtitle: "34 John Dalton Street, Manchester M2 6LE",
      //           openingtime: "Russian Lashes",
      //           oldprize: "£ 75",
      //           newprize: "£ 50",
      //           mainpctrpath: "assets/images/purch view (1).png",
      //           salevalue: "33% off",
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
