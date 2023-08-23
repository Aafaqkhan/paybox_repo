// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:paybox/app/modules/deals/controller/deals_controller.dart';
import 'package:paybox/app/modules/deals/view/deals_details.dart';
import 'package:paybox/app/services/global_deals_details.dart';
import 'package:paybox/app/services/global_deals_offer.dart';
import 'package:paybox/app/services/global_deals_titles.dart';
import 'package:paybox/app/services/global_shimmer_card.dart';

class DealsView extends GetView<DealsController> {
  const DealsView({super.key});

  @override
  Widget build(BuildContext context) {
    print('get categories in deals view ');
    // controller.getCategories();
    controller.getAllDeals();
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
                          children: [
                            const ShimmerList(),
                          ],
                        )
                      : Row(
                          children: controller.categories
                              .map((e) => MyDealsOffer(
                                  avatarpath: e.image, title: e.name))
                              .toList(),
                        );
                }),
              ),
            ),
          ),
          Obx(() {
            return controller.allDeals.isEmpty
                ? const ShimmerList()
                : Column(
                    children: controller.allDeals.map((businessWithDeals) {
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
                              children: businessWithDeals.deals!.map((deal) {
                                return InkWell(
                                  onTap: () async {
                                    await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => DealsDetails(
                                                  image: deal.businessLogo,
                                                  buisnessName:
                                                      deal.businessName,
                                                  address: deal.address,
                                                  saleValue: '10%',
                                                  subHeading: deal.address,
                                                  endDate: deal.endDate,
                                                  startPrice: deal.startPrice,
                                                  dealPrice: deal.dealPrice,
                                                  description: deal.description,
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
            // Column(
            //     children: [
            //       ...controller.allDeals
            //           .map((e) => Column(
            //                 children: [
            //                   MyGlobalDealTitles(
            //                     avatarpath: e.logo,
            //                     title: e.businessTitle,
            //                     subtitle: e.address,
            //                   ),
            //                   SingleChildScrollView(
            //                     scrollDirection: Axis.horizontal,
            //                     child: Row(
            //                       children: [
            //                         ...controller.allDeals
            //                             .map((e) => InkWell(
            //                                   onTap: () {
            //                                     Navigator.push(
            //                                         context,
            //                                         MaterialPageRoute(
            //                                             builder: (context) =>
            //                                                 DealsDetails(
            //                                                   image: e.logo,
            //                                                   buisnessName:
            //                                                       e.businessTitle,
            //                                                   address:
            //                                                       e.address,
            //                                                   saleValue:
            //                                                       '10%',
            //                                                   subHeading:
            //                                                       e.address,
            //                                                   endDate:
            //                                                       '12-12-2024',
            //                                                   startPrice:
            //                                                       '123',
            //                                                   dealPrice:
            //                                                       '120',
            //                                                   description:
            //                                                       'description',
            //                                                   about:
            //                                                       'about',
            //                                                 )));
            //                                   },
            //                                   child: MyGlobalDealsDetails(
            //                                     avatarpath: e.logo,
            //                                     title: e.businessTitle,
            //                                     subtitle:
            //                                         "Ends on 13-Jun-2023 11:00",
            //                                     newprice: "£ 39",
            //                                     oldprice: "£ 52",
            //                                     salevalue: "25% OFF",
            //                                   ),
            //                                 ))
            //                             .toList(),
            //                       ],
            //                     ),
            //                   )
            //                 ],
            //               ))
            //           .toList(),
            //       // ...controller.allDeals
            //       //     .map((e) => Row(
            //       //           children: [
            //       //             MyGlobalDealTitles(
            //       //               avatarpath: e.logo,
            //       //               title: e.businessTitle,
            //       //               subtitle: e.address,
            //       //             ),
            //       //           ],
            //       //         ))
            //       //     .toList(),
            //       MyGlobalDealTitles(
            //         title: "Range Desserts",
            //         subtitle:
            //             "66c Beech Rd, Chorlton-cum-Hardy, Manchester M21 EG",
            //         avatarpath: "assets/images/Range Dessert.png",
            //       ),
            //       SingleChildScrollView(
            //         scrollDirection: Axis.horizontal,
            //         child: Padding(
            //           padding: EdgeInsets.only(
            //             top: 16,
            //             left: 16,
            //           ),
            //           child: Row(
            //             children: [
            //               MyGlobalDealsDetails(
            //                 avatarpath: "assets/images/deals view.png",
            //                 title: "After Noon Tea for 2",
            //                 subtitle: "Ends on 13-Jun-2023 11:00",
            //                 newprice: "£ 39",
            //                 oldprice: "£ 52",
            //                 salevalue: "25% OFF",
            //               ),
            //               // MyGlobalDealsDetails(
            //               //   avatarpath: "assets/images/deals view (6).png",
            //               //   title: "Chocolate cake",
            //               //   subtitle: "Ends on 13-Jun-2023 11:00",
            //               //   newprice: "£ 39",
            //               //   oldprice: "£ 52",
            //               //   salevalue: "25% OFF",
            //               // ),
            //               // MyGlobalDealsDetails(
            //               //   avatarpath: "assets/images/deals view (7).png",
            //               //   title: "Round cake with cheese",
            //               //   subtitle: "Ends on 14-Jun-2023 12:00",
            //               //   newprice: "£ 50",
            //               //   oldprice: "£ 100",
            //               //   salevalue: "50% OFF",
            //               // ),
            //               // MyGlobalDealsDetails(
            //               //   avatarpath: "assets/images/deals view (9).png",
            //               //   title: "Round cake with cheese",
            //               //   subtitle: "Ends on 14-Jun-2023 12:00",
            //               //   newprice: "£ 20",
            //               //   oldprice: "£ 30",
            //               //   salevalue: "10% OFF",
            //               // ),
            //             ],
            //           ),
            //         ),
            //       ),
            //     ],
            //   );
          }),
          // const MyGlobalDealTitles(
          //   title: "SCOOP ANCOATS",
          //   subtitle: "58 Oldham Rd, Ancats, Manchester M4 5EE",
          //   avatarpath: "assets/images/Scoop.png",
          // ),
          // const SingleChildScrollView(
          //   scrollDirection: Axis.horizontal,
          //   child: Padding(
          //     padding: EdgeInsets.only(
          //       top: 16,
          //       left: 16,
          //     ),
          //     child: Row(
          //       children: [
          //         MyGlobalDealsDetails(
          //           avatarpath: "assets/images/deals view (10).png",
          //           title: "Scoop Ice Cream",
          //           subtitle: "Ends on 13-Jun-2023 11:00",
          //           newprice: "£ 10",
          //           oldprice: "£ 20",
          //           salevalue: "50% OFF",
          //         ),
          //         MyGlobalDealsDetails(
          //           avatarpath: "assets/images/deals view (11).png",
          //           title: "Ice Cream Sandwich",
          //           subtitle: "Ends on 13-Jun-2023 11:00",
          //           newprice: "£ 30",
          //           oldprice: "£ 45",
          //           salevalue: "25% OFF",
          //         ),
          //         MyGlobalDealsDetails(
          //           avatarpath: "assets/images/deals view (12).png",
          //           title: "Milky Bar Milkshake",
          //           subtitle: "Ends on 13-Jun-2023 11:00",
          //           newprice: "£ 40",
          //           oldprice: "£ 52",
          //           salevalue: "30% OFF",
          //         ),
          //         MyGlobalDealsDetails(
          //           avatarpath: "assets/images/deals view (1).png",
          //           title: "Eton Yes Bubble Waffel",
          //           subtitle: "Ends on 13-Jun-2023 11:00",
          //           newprice: "£ 39",
          //           oldprice: "£ 52",
          //           salevalue: "25% OFF",
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          // const MyGlobalDealTitles(
          //   title: "YAFFA KNAFEH",
          //   subtitle: "442 Coventry Rd, Small Heath, Birmingham B10 OUG, UK",
          //   avatarpath: "assets/images/Vector (8).png",
          // ),
          // const SingleChildScrollView(
          //   scrollDirection: Axis.horizontal,
          //   child: Padding(
          //     padding: EdgeInsets.only(top: 16, left: 16, bottom: 26),
          //     child: Row(
          //       children: [
          //         MyGlobalDealsDetails(
          //           avatarpath: "assets/images/deals view (2).png",
          //           title: "Yaffa Knafeh Table",
          //           subtitle: "Ends on 18-Jun-2023 11:00",
          //           newprice: "£ 100",
          //           oldprice: "£ 200",
          //           salevalue: "50% OFF",
          //         ),
          //         MyGlobalDealsDetails(
          //           avatarpath: "assets/images/deals view (3).png",
          //           title: "Baklava six with ice cream",
          //           subtitle: "Ends on 13-Jun-2023 11:00",
          //           newprice: "£ 30",
          //           oldprice: "£ 45",
          //           salevalue: "25% OFF",
          //         ),
          //         MyGlobalDealsDetails(
          //           avatarpath: "assets/images/deals view (4).png",
          //           title: "Turkish Baklava",
          //           subtitle: "Ends on 13-Jun-2023 11:00",
          //           newprice: "£ 40",
          //           oldprice: "£ 52",
          //           salevalue: "30% OFF",
          //         ),
          //         MyGlobalDealsDetails(
          //           avatarpath: "assets/images/deals view (5).png",
          //           title: "Trletasha Cake",
          //           subtitle: "Ends on 13-Jun-2023 11:00",
          //           newprice: "£ 39",
          //           oldprice: "£ 52",
          //           salevalue: "25% OFF",
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
        ]),
      ),
    );
  }
}
