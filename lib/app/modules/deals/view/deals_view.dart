// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paybox/app/models/category_model.dart';
import 'package:paybox/app/modules/deals/controller/deals_controller.dart';
import 'package:paybox/app/modules/deals/view/deals_details.dart';
import 'package:paybox/app/services/deal_by_category_card.dart';
import 'package:paybox/app/services/global_deals_details.dart';
import 'package:paybox/app/services/global_deals_offer.dart';
import 'package:paybox/app/services/global_deals_titles.dart';
import 'package:paybox/app/services/global_shimmer_card.dart';
import 'package:paybox/app/services/global_trending.dart';

class DealsView extends GetView<DealsController> {
  const DealsView({super.key});

  @override
  Widget build(BuildContext context) {
    print('get categories in deals view ');
    // controller.getCategories();
    // controller.getAllDeals();
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
            child: const TextField(
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
                  prefixIcon: Icon(
                    Icons.location_on,
                    color: Color(0xff000000),
                  )),
            ),
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(children: [
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
                      : Container(
                          height: 200,
                          width: MediaQuery.of(context).size.width,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: controller.categories.length,
                            itemBuilder: (BuildContext context, int index) {
                              final category = controller.categories[index];

                              // Create a list to store the selection state of categories
                              List<bool> categorySelectedList = List.generate(
                                  controller.categories.length, (_) => false);

                              return Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      // Toggle the selected state of the category
                                      categorySelectedList[index] =
                                          !categorySelectedList[index];

                                      // You can access the selected state like this:
                                      // bool isSelected =
                                      //     categorySelectedList[index];

                                      // Check if any category is selected
                                      bool anyCategorySelected =
                                          categorySelectedList
                                              .any((selected) => selected);

                                      // Update controller.categorySelected.value accordingly
                                      controller.categorySelected.value =
                                          anyCategorySelected;

                                      Get.log(
                                          'isSelected :: $anyCategorySelected');
                                      // Get.log('categoryId :: ${category.id}');
                                      // Get.log(
                                      //     'categorySelected :: ${controller.categorySelected}');
                                      controller.dealsByCategory(
                                          category.id.toString());
                                    },
                                    child:
                                        //  Obx(() {  return
                                        MyDealsOffer(
                                      color: categorySelectedList[index] == true
                                          ? Colors.grey
                                          : Colors.white,
                                      avatarpath: category.image,
                                      title: category.name,
                                    ),
                                    // }),
                                  ),
                                ],
                              );
                            },
                          ),
                        );
                }),
              ),
            ),
          ),
          Obx(() {
            return controller.categorySelected.value == false
                ? Obx(() {
                    return controller.allDeals.isEmpty
                        ? const ShimmerList()
                        : Column(
                            children:
                                controller.allDeals.map((businessWithDeals) {
                              return Column(
                                children: [
                                  MyGlobalDealTitles(
                                    avatarpath: businessWithDeals.logo,
                                    title: businessWithDeals.businessTitle,
                                    subtitle: businessWithDeals.address,
                                  ),
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children:
                                          businessWithDeals.deals!.map((deal) {
                                        return InkWell(
                                          onTap: () async {
                                            await Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        DealsDetails(
                                                          image:
                                                              deal.businessLogo,
                                                          buisnessName:
                                                              deal.businessName,
                                                          address: deal.address,
                                                          saleValue: '10%',
                                                          subHeading:
                                                              deal.address,
                                                          endDate: deal.endDate,
                                                          startPrice:
                                                              deal.startPrice,
                                                          dealPrice:
                                                              deal.dealPrice,
                                                          description:
                                                              deal.description,
                                                          about: deal.about,
                                                        )));
                                          },
                                          child: MyGlobalDealsDetails(
                                            avatarpath: deal.businessLogo,
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
                : Obx(() {
                    return controller.dealByCategory.isEmpty
                        ? Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: ShimmerList(),
                            // const Text('No Deals in this Category'),
                          )
                        : Column(
                            children: controller.dealByCategory
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
                  });
          }),
        ]),
      ),
    );
  }
}
