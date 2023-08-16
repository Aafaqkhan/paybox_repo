import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paybox/app/modules/home/controller/home_controller.dart';
import 'package:paybox/app/services/global_card.dart';
import 'package:paybox/app/services/global_feature%20card_images.dart';
import 'package:paybox/app/services/global_loyality_card.dart';

import '../../../services/colors/custom_colors.dart';
import '../../../services/global_trending.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    // controller.getCategories();
    // controller.getDeals();
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
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          color: const Color(0xffFFFFFF),
          child: Column(
            children: [
              const Padding(
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
                    TextWidget(
                        text: 'View All',
                        textStyle: TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff1025E4))),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 16, left: 6),
                child: MyPurchases(
                  avatarpath: "assets/images/Range Dessert.png",
                  title: "Range Desserts",
                  subtitle:
                      "66c Beech Rd, Chorlton-cum-Hardy, Manchester M21 EG",
                  openingtime: "After Noon Tea for 2",
                  oldprize: "£ 52",
                  newprize: "£ 39",
                  mainpctrpath: "assets/images/Rectangle 15 (1).png",
                  salevalue: "25% off",
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 16, left: 6),
                child: MyPurchases(
                  avatarpath: "assets/images/Vector (8).png",
                  title: "Yaffa Knafeh",
                  subtitle:
                      "442 Coventry Rd, Small Health Birmingham B10 OUG, UK",
                  openingtime: "Yaffah Knafeh Table",
                  oldprize: "£ 52",
                  newprize: "£ 102",
                  mainpctrpath: "assets/images/Group 211.png",
                  salevalue: "50% off",
                ),
              ),
              const Padding(
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
                      TextWidget(
                          text: 'View All',
                          textStyle: TextStyle(
                              fontSize: 12,
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.w600,
                              color: Color(0xff1025E4))),
                    ],
                  ),
                ),
              ),
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: EdgeInsets.only(left: 16, top: 22, right: 16),
                  child: Row(
                    children: [
                      MyTrendingDeals(
                        avatarpath: "assets/images/Burger & Co (4).png",
                        title: "Ana medical ",
                        subtitle: "Botox 2 areas",
                        salevalue: "47% off",
                      ),
                      MyTrendingDeals(
                        avatarpath: "assets/images/Burger & Co (2).png",
                        title: "Boxco Vegan ",
                        subtitle: "Rice Bowls",
                        salevalue: "20% off",
                      ),
                      MyTrendingDeals(
                        avatarpath: "assets/images/Burger & Co (3).png",
                        title: "Bingo Balls ",
                        subtitle: "Mega Package",
                        salevalue: "65% off",
                      ),
                      MyTrendingDeals(
                        avatarpath: "assets/images/Burger & Co (9).png",
                        title: "Wolf",
                        subtitle: "Coffee & Pizza",
                        salevalue: "25% off",
                      ),
                    ],
                  ),
                ),
              ),
              const Padding(
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
                      TextWidget(
                          text: 'View All',
                          textStyle: TextStyle(
                              fontSize: 12,
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.w600,
                              color: Color(0xff1025E4))),
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
              Padding(
                padding: EdgeInsets.only(top: 19, left: 8),
                child: Row(
                  children: [
                    MyLoyalityCard(
                      avatarpath: "assets/images/Burger & Co (5).png",
                      title: "Bingo Balls",
                      subtitle: "Adult Ball Pit Bar",
                      location: "2km away",
                      mainpctrpath: "assets/images/Ellipse 1.png",
                    ),
                    MyLoyalityCard(
                      avatarpath: "assets/images/Burger & Co (1).png",
                      title: "Burger & Co ",
                      subtitle: "Fast Food",
                      location: "6km away",
                      mainpctrpath: "assets/images/Ellipse 2.png",
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 19, left: 8),
                child: Row(
                  children: [
                    MyLoyalityCard(
                      avatarpath: "assets/images/Burger & Co (6).png",
                      title: "Chicken Shack",
                      subtitle: "Fast Food",
                      location: "7km away",
                      mainpctrpath: "assets/images/Group (1).png",
                    ),
                    MyLoyalityCard(
                      avatarpath: "assets/images/Burger & Co (7).png",
                      title: "Dunkin’ Burgers",
                      subtitle: "Fast Food",
                      location: "8km away",
                      mainpctrpath: "assets/images/Group (2).png",
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 240, top: 19),
                child: Container(
                  color: const Color(0xffFFFFFF),
                  child: const TextWidget(
                      text: 'Featured Brands',
                      textStyle: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Color(0xff000000))),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 19),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GlobalImageCard(
                        imagePath: "assets/images/Range Dessert.png",
                        width: 83,
                        height: 83),
                    GlobalImageCard(
                        imagePath: "assets/images/13 (1) 1.png",
                        width: 83,
                        height: 83),
                    GlobalImageCard(
                        imagePath: "assets/images/Group 157 (1).png",
                        width: 83,
                        height: 83),
                    GlobalImageCard(
                        imagePath: "assets/images/Vector (10).png",
                        width: 90,
                        height: 90),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
