import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:paybox/app/modules/deals/controller/deals_controller.dart';
import 'package:paybox/app/services/global_deals_details.dart';
import 'package:paybox/app/services/global_deals_offer.dart';
import 'package:paybox/app/services/global_deals_titles.dart';

class DealsView extends GetView<DealsController> {
  const DealsView({super.key});

  @override
  Widget build(BuildContext context) {
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
                  hintText: 'Search text',
                  hintStyle: TextStyle(
                    fontSize: 16,
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
      body: const SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(children: [
          Padding(
            padding: EdgeInsets.only(top: 16, left: 15),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SizedBox(
                child: Row(
                  children: [
                    MyDealsOffer(
                        avatarpath: "assets/images/abc (1).png",
                        title: "Near Me"),
                    MyDealsOffer(
                        avatarpath: "assets/images/Activities.png",
                        title: "Activities"),
                    MyDealsOffer(
                        avatarpath: "assets/images/coffee.png",
                        title: "Coffee"),
                    MyDealsOffer(
                        avatarpath: "assets/images/Take away.png",
                        title: "Take away"),
                    MyDealsOffer(
                        avatarpath: "assets/images/beauty.png",
                        title: "Beauty"),
                    MyDealsOffer(
                        avatarpath: "assets/images/abc.png", title: "Barbers"),
                    MyDealsOffer(
                        avatarpath: "assets/images/abc (5).png", title: "Hair"),
                    MyDealsOffer(
                        avatarpath: "assets/images/abc (3).png",
                        title: "Asthetics"),
                    MyDealsOffer(
                        avatarpath: "assets/images/abc (2).png",
                        title: "Children"),
                    MyDealsOffer(
                        avatarpath: "assets/images/abc (6).png",
                        title: "Health/Fitness"),
                    MyDealsOffer(
                        avatarpath: "assets/images/abc (7).png",
                        title: "Food/Drinks"),
                    MyDealsOffer(
                        avatarpath: "assets/images/beauty (7).png",
                        title: "Desserts"),
                    MyDealsOffer(
                        avatarpath: "assets/images/beauty (8).png",
                        title: "Retail"),
                    MyDealsOffer(
                        avatarpath: "assets/images/abc (8).png", title: "Spas"),
                  ],
                ),
              ),
            ),
          ),
          MyGlobalDealTitles(
            title: "Range Desserts",
            subtitle: "66c Beech Rd, Chorlton-cum-Hardy, Manchester M21 EG",
            avatarpath: "assets/images/Range Dessert.png",
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: EdgeInsets.only(
                top: 16,
                left: 16,
              ),
              child: Row(
                children: [
                  MyGlobalDealsDetails(
                    avatarpath: "assets/images/deals view.png",
                    title: "After Noon Tea for 2",
                    subtitle: "Ends on 13-Jun-2023 11:00",
                    newprice: "£ 39",
                    oldprice: "£ 52",
                    salevalue: "25% OFF",
                  ),
                  MyGlobalDealsDetails(
                    avatarpath: "assets/images/deals view (6).png",
                    title: "Chocolate cake",
                    subtitle: "Ends on 13-Jun-2023 11:00",
                    newprice: "£ 39",
                    oldprice: "£ 52",
                    salevalue: "25% OFF",
                  ),
                  MyGlobalDealsDetails(
                    avatarpath: "assets/images/deals view (7).png",
                    title: "Round cake with cheese",
                    subtitle: "Ends on 14-Jun-2023 12:00",
                    newprice: "£ 50",
                    oldprice: "£ 100",
                    salevalue: "50% OFF",
                  ),
                  MyGlobalDealsDetails(
                    avatarpath: "assets/images/deals view (9).png",
                    title: "Round cake with cheese",
                    subtitle: "Ends on 14-Jun-2023 12:00",
                    newprice: "£ 20",
                    oldprice: "£ 30",
                    salevalue: "10% OFF",
                  ),
                ],
              ),
            ),
          ),
          MyGlobalDealTitles(
            title: "SCOOP ANCOATS",
            subtitle: "58 Oldham Rd, Ancats, Manchester M4 5EE",
            avatarpath: "assets/images/Scoop.png",
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: EdgeInsets.only(
                top: 16,
                left: 16,
              ),
              child: Row(
                children: [
                  MyGlobalDealsDetails(
                    avatarpath: "assets/images/deals view (10).png",
                    title: "Scoop Ice Cream",
                    subtitle: "Ends on 13-Jun-2023 11:00",
                    newprice: "£ 10",
                    oldprice: "£ 20",
                    salevalue: "50% OFF",
                  ),
                  MyGlobalDealsDetails(
                    avatarpath: "assets/images/deals view (11).png",
                    title: "Ice Cream Sandwich",
                    subtitle: "Ends on 13-Jun-2023 11:00",
                    newprice: "£ 30",
                    oldprice: "£ 45",
                    salevalue: "25% OFF",
                  ),
                  MyGlobalDealsDetails(
                    avatarpath: "assets/images/deals view (12).png",
                    title: "Milky Bar Milkshake",
                    subtitle: "Ends on 13-Jun-2023 11:00",
                    newprice: "£ 40",
                    oldprice: "£ 52",
                    salevalue: "30% OFF",
                  ),
                  MyGlobalDealsDetails(
                    avatarpath: "assets/images/deals view (1).png",
                    title: "Eton Yes Bubble Waffel",
                    subtitle: "Ends on 13-Jun-2023 11:00",
                    newprice: "£ 39",
                    oldprice: "£ 52",
                    salevalue: "25% OFF",
                  ),
                ],
              ),
            ),
          ),
          MyGlobalDealTitles(
            title: "YAFFA KNAFEH",
            subtitle: "442 Coventry Rd, Small Heath, Birmingham B10 OUG, UK",
            avatarpath: "assets/images/Vector (8).png",
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: EdgeInsets.only(top: 16, left: 16, bottom: 26),
              child: Row(
                children: [
                  MyGlobalDealsDetails(
                    avatarpath: "assets/images/deals view (2).png",
                    title: "Yaffa Knafeh Table",
                    subtitle: "Ends on 18-Jun-2023 11:00",
                    newprice: "£ 100",
                    oldprice: "£ 200",
                    salevalue: "50% OFF",
                  ),
                  MyGlobalDealsDetails(
                    avatarpath: "assets/images/deals view (3).png",
                    title: "Baklava six with ice cream",
                    subtitle: "Ends on 13-Jun-2023 11:00",
                    newprice: "£ 30",
                    oldprice: "£ 45",
                    salevalue: "25% OFF",
                  ),
                  MyGlobalDealsDetails(
                    avatarpath: "assets/images/deals view (4).png",
                    title: "Turkish Baklava",
                    subtitle: "Ends on 13-Jun-2023 11:00",
                    newprice: "£ 40",
                    oldprice: "£ 52",
                    salevalue: "30% OFF",
                  ),
                  MyGlobalDealsDetails(
                    avatarpath: "assets/images/deals view (5).png",
                    title: "Trletasha Cake",
                    subtitle: "Ends on 13-Jun-2023 11:00",
                    newprice: "£ 39",
                    oldprice: "£ 52",
                    salevalue: "25% OFF",
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
