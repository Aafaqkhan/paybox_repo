// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paybox/app/models/category_model.dart';
import 'package:paybox/app/modules/deals/controller/deals_controller.dart';
import 'package:paybox/app/modules/deals/view/deals_details.dart';
import 'package:paybox/app/providers/laravel_provider.dart';
import 'package:paybox/app/services/deal_by_category_card.dart';
import 'package:paybox/app/services/global_deals_details.dart';
import 'package:paybox/app/services/global_deals_offer.dart';
import 'package:paybox/app/services/global_deals_titles.dart';
import 'package:paybox/app/services/global_filter.dart';
import 'package:paybox/app/services/global_shimmer_card.dart';
import 'package:paybox/app/services/global_trending.dart';

class DealsView extends GetView<DealsController> {
  const DealsView({super.key});

  @override
  Widget build(BuildContext context) {
    print('get categories in deals view ');
    controller.getCategories();
    controller.getAllDeals();
    // controller.dealsByCategory('5');

    return Scaffold(
      appBar: AppBar(
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
                hintStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff49454F),
                  fontFamily: "Montserrat",
                ),
                suffixIcon: Icon(
                  Icons.search,
                  color: Color(0xff49454F),
                ),
                prefixIcon: InkWell(
                  onTap: () {
                    Get.log('Location Icon Tapped');
                    // controller.setFilterAppliedSelected();
                    Get.log(controller.filterApplied.value.toString());
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return MyFilterDialog(
                            // onPressedApply: () async {
                            //   await controller.filterDeals('', '');
                            //   await controller.setFilterAppliedSelectedTrue();
                            //   Get.log(controller.filterApplied.value.toString());
                            //   Navigator.pop(context);
                            // },
                            // onPressedReset: () async {
                            //   await controller.setFilterAppliedSelectedFalse();
                            //   Get.log(controller.filterApplied.value.toString());
                            //   Navigator.pop(context);
                            // },
                            );
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
        automaticallyImplyLeading: false,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          Get.find<LaravelApiClient>().forceRefresh();
          controller.refreshDeals(showMessage: true);
          // Get.find<LaravelApiClient>().unForceRefresh();
        },
        child: GetBuilder<DealsController>(builder: (cont) {
          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: controller.filterApplied.value == true
                ? Obx(() {
                    return controller.dealsByFilter.isEmpty
                        ? Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: ShimmerList(),
                            // const Text('No Deals in this Category'),
                          )
                        : Column(
                            children: controller.dealsByFilter
                                .map((e) => Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: InkWell(
                                        onTap: () {
                                          print('nav');
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      DealsDetails(
                                                        image: e.dealImage,
                                                        buisnessName:
                                                            e.businessName,
                                                        address: e.address,
                                                        saleValue: e.dealPrice,
                                                        subHeading:
                                                            e.subHeading,
                                                        endDate: e.endDate,
                                                        startPrice:
                                                            e.startPrice,
                                                        dealPrice: e.dealPrice,
                                                        description:
                                                            e.description,
                                                        about: e.about,
                                                      )));
                                        },
                                        child: DealByCategory(
                                          avatarpath: e.businessLogo,
                                          title: e.businessName,
                                          subtitle: e.endDate,
                                          newprice: e.dealPrice,
                                          oldprice: e.startPrice,
                                          salevalue: "25% OFF",
                                        ),
                                      ),
                                    ))
                                .toList(),
                          );
                  })
                : Column(children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 16, left: 15),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: SizedBox(
                          height: 100,
                          child: Obx(() {
                            return controller.categories.isEmpty
                                ? Row(
                                    children: const [
                                      ShimmerList(),
                                    ],
                                  )
                                : GetBuilder<DealsController>(builder: (cont) {
                                    return SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        children: [
                                          // MyStaticDealOffer(
                                          //   color: Colors.white,
                                          //   avatarpath: 'assets/images/abc (1).png',
                                          //   // avatarpath: 'category.image',
                                          //   title: 'Near Me',
                                          // ),
                                          Container(
                                            height: 200,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            child: ListView.builder(
                                              scrollDirection: Axis.horizontal,
                                              itemCount:
                                                  controller.categories.length,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                final category = controller
                                                    .categories[index];

                                                if (index == 0) {
                                                  return Obx(() {
                                                    return InkWell(
                                                      onTap: () async {
                                                        // cont.nearMeSelected.value =
                                                        //     !cont.nearMeSelected.value;
                                                        controller
                                                            .setNearMeSelected();

                                                        if (cont.nearMeSelected ==
                                                            true) {
                                                          controller
                                                                  .selectCategory =
                                                              null;
                                                          await controller
                                                              .nearestDeals(
                                                                  '33.6957',
                                                                  '72.969');
                                                        }

                                                        Get.log(
                                                            '${cont.nearMeSelected.value}');
                                                      },
                                                      child: MyStaticDealOffer(
                                                        color:
                                                            cont.nearMeSelected
                                                                        .value ==
                                                                    true
                                                                ? Colors.grey
                                                                : Colors.white,
                                                        avatarpath:
                                                            'assets/images/abc (1).png',
                                                        // avatarpath: 'category.image',
                                                        title: 'Near Me',
                                                      ),
                                                    );
                                                  });
                                                }

                                                return Row(
                                                  children: [
                                                    InkWell(
                                                      onTap: () {
                                                        if (controller
                                                                    .categorySelected !=
                                                                null &&
                                                            controller
                                                                    .categorySelected!
                                                                    .id ==
                                                                category.id) {
                                                          // It's a double tap on the same category, clear the selection
                                                          controller
                                                                  .selectCategory =
                                                              null;
                                                          Get.log('All deals');
                                                        } else {
                                                          // It's a single tap, select the category
                                                          controller
                                                                  .selectCategory =
                                                              category;
                                                          controller
                                                              .nearMeSelected
                                                              .value = false;
                                                          controller
                                                              .dealsByCategory(
                                                                  category.id
                                                                      .toString());
                                                        }

                                                        // Working Code
                                                        // controller.selectCategory = category;
                                                        // controller.dealsByCategory(
                                                        //     category.id.toString());
                                                      },
                                                      child:
                                                          //  Obx(() {  return
                                                          MyDealsOffer(
                                                        color: category.id ==
                                                                (cont.categorySelected
                                                                        ?.id ??
                                                                    '')
                                                            ? Colors.grey
                                                            : Colors.white,
                                                        avatarpath:
                                                            category.image,
                                                        title: category.name,
                                                      ),
                                                      // }),
                                                    ),
                                                  ],
                                                );
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  });
                          }),
                        ),
                      ),
                    ),
                    GetBuilder<DealsController>(builder: (cont) {
                      return cont.categorySelected == null &&
                              cont.nearMeSelected.value == false
                          ? Obx(() {
                              return controller.allDeals.isEmpty
                                  ? const ShimmerList()
                                  : Column(
                                      children: controller.allDeals
                                          .map((businessWithDeals) {
                                        return Column(
                                          children: [
                                            MyGlobalDealTitles(
                                              avatarpath:
                                                  businessWithDeals.logo,
                                              title: businessWithDeals
                                                  .businessTitle,
                                              subtitle:
                                                  businessWithDeals.address,
                                            ),
                                            SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Row(
                                                children: businessWithDeals
                                                    .deals!
                                                    .map((deal) {
                                                  return InkWell(
                                                    onTap: () async {
                                                      await Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder:
                                                                  (context) =>
                                                                      DealsDetails(
                                                                        image: deal
                                                                            .businessLogo,
                                                                        buisnessName:
                                                                            deal.businessName,
                                                                        address:
                                                                            deal.address,
                                                                        saleValue:
                                                                            '10%',
                                                                        subHeading:
                                                                            deal.address,
                                                                        endDate:
                                                                            deal.endDate,
                                                                        startPrice:
                                                                            deal.startPrice,
                                                                        dealPrice:
                                                                            deal.dealPrice,
                                                                        description:
                                                                            deal.description,
                                                                        about: deal
                                                                            .about,
                                                                      )));
                                                    },
                                                    child: MyGlobalDealsDetails(
                                                      avatarpath:
                                                          deal.businessLogo,
                                                      title: deal.businessName,
                                                      subtitle: deal.endDate,
                                                      newprice: deal.dealPrice,
                                                      oldprice: deal.startPrice,
                                                      salevalue: "25% OFF",
                                                    ),
                                                  );
                                                }).toList(),
                                              ),
                                            ),
                                          ],
                                        );
                                      }).toList(),
                                    );
                            })
                          : cont.categorySelected != null &&
                                  cont.nearMeSelected.value == false
                              ? Obx(() {
                                  return controller.dealByCategory.isEmpty
                                      ? Padding(
                                          padding:
                                              const EdgeInsets.only(top: 15),
                                          child: ShimmerList(),
                                          // const Text('No Deals in this Category'),
                                        )
                                      : Column(
                                          children: controller.dealByCategory
                                              .map((e) => Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            12.0),
                                                    child: InkWell(
                                                      onTap: () {
                                                        print('nav');
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        DealsDetails(
                                                                          image:
                                                                              e.dealImage,
                                                                          buisnessName:
                                                                              e.businessName,
                                                                          address:
                                                                              e.address,
                                                                          saleValue:
                                                                              e.dealPrice,
                                                                          subHeading:
                                                                              e.subHeading,
                                                                          endDate:
                                                                              e.endDate,
                                                                          startPrice:
                                                                              e.startPrice,
                                                                          dealPrice:
                                                                              e.dealPrice,
                                                                          description:
                                                                              e.description,
                                                                          about:
                                                                              e.about,
                                                                        )));
                                                      },
                                                      child: DealByCategory(
                                                        avatarpath:
                                                            e.businessLogo,
                                                        title: e.businessName,
                                                        subtitle: e.endDate,
                                                        newprice: e.dealPrice,
                                                        oldprice: e.startPrice,
                                                        salevalue: "25% OFF",
                                                      ),
                                                    ),
                                                  ))
                                              .toList(),
                                        );
                                })
                              : cont.nearMeSelected.value == true
                                  // &&
                                  //         cont.categorySelected == null
                                  ? Obx(() {
                                      return controller.nearestDealsList.isEmpty
                                          ? Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 15),
                                              child: ShimmerList(),
                                              // const Text('No Deals in this Category'),
                                            )
                                          : Column(
                                              children: controller
                                                  .nearestDealsList
                                                  .map((e) => Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(12.0),
                                                        child: InkWell(
                                                          onTap: () {
                                                            print('nav');
                                                            Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                    builder:
                                                                        (context) =>
                                                                            DealsDetails(
                                                                              image: e.dealImage,
                                                                              buisnessName: e.businessName,
                                                                              address: e.address,
                                                                              saleValue: e.dealPrice,
                                                                              subHeading: e.subHeading,
                                                                              endDate: e.endDate,
                                                                              startPrice: e.startPrice,
                                                                              dealPrice: e.dealPrice,
                                                                              description: e.description,
                                                                              about: e.about,
                                                                            )));
                                                          },
                                                          child: DealByCategory(
                                                            avatarpath:
                                                                e.businessLogo,
                                                            title:
                                                                e.businessName,
                                                            subtitle: e.endDate,
                                                            newprice:
                                                                e.dealPrice,
                                                            oldprice:
                                                                e.startPrice,
                                                            salevalue:
                                                                "25% OFF",
                                                          ),
                                                        ),
                                                      ))
                                                  .toList(),
                                            );
                                    })
                                  : Container(
                                      child: Text('No Deals'),
                                    );
                    }),

                    // }),
                  ]),
          );
        }),
      ),
    );
  }
}
