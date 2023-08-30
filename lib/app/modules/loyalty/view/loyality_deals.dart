import 'package:flutter/material.dart';
import 'package:paybox/app/services/global_loyalityoints_img.dart';
import 'package:paybox/app/services/global_loyalty_view_card.dart';

import '../../../services/colors/custom_colors.dart';

class LoyaltyDeals extends StatefulWidget {
  const LoyaltyDeals({super.key});

  @override
  State<LoyaltyDeals> createState() => _LoyaltyDealsState();
}

class _LoyaltyDealsState extends State<LoyaltyDeals> {
  @override
  Widget build(BuildContext context) {
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
            child: const TextField(
              decoration: InputDecoration(
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  hintText: 'Search text',
                  hintStyle: TextStyle(
                      fontSize: 16,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w400,
                      color: Color(0xff49454F)),
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
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 12, top: 16),
              child: MyLoyalityView(
                avatarpath: "assets/images/Rectangle 15 (2).png",
                title: "Boxco",
                subtitle: "Healthy Food Restaurant",
                location: "2km away",
                mainpctrpath: "assets/images/boxco.png",
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Container(
                height: 444,
                width: 331,
                decoration: BoxDecoration(
                    color: const Color(0xffFFFFFF),
                    borderRadius: BorderRadius.circular(27),
                    boxShadow: const [
                      BoxShadow(
                        offset: Offset(0, 0),
                      )
                    ]),
                child: Column(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 70, top: 19),
                          child: SizedBox(
                            height: 40,
                            width: 193,
                            child: TextWidget(
                                text:
                                    'Give your paybox pin code to The merchant to collect points or redeem reward',
                                textStyle: TextStyle(
                                    fontSize: 12,
                                    fontFamily: "Mukta",
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff000000))),
                          ),
                        ),
                        Icon(
                          Icons.cancel,
                        )
                      ],
                    ),
                    const TextWidget(
                        text: '600235',
                        textStyle: TextStyle(
                            fontSize: 28,
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w700,
                            color: Color(0xff3242F6))),
                    Padding(
                      padding: const EdgeInsets.only(left: 21, top: 33),
                      child: SizedBox(
                        height: 23,
                        width: 316,
                        child: Row(
                          children: [
                            const TextWidget(
                                text: '25 points',
                                textStyle: TextStyle(
                                    fontSize: 18,
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xff000000))),
                            const Padding(
                              padding:
                                  EdgeInsets.only(left: 4, right: 33, top: 4),
                              child: TextWidget(
                                  text: 'Collected',
                                  textStyle: TextStyle(
                                      fontSize: 10,
                                      fontFamily: "Mukta",
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff000000))),
                            ),
                            Container(
                              width: 138,
                              height: 22,
                              color: const Color(0xff000000),
                              alignment: Alignment.center,
                              child: const TextWidget(
                                  text: 'View my transaction history',
                                  textStyle: TextStyle(
                                      fontSize: 10,
                                      fontFamily: "Mukta",
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xffFFFFFF))),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 18, top: 18),
                      child: Container(
                        child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              LoyalityPointsImages(
                                avatarpath: "assets/images/delievery (1).png",
                              ),
                              LoyalityPointsImages(
                                avatarpath: "assets/images/delievery (3).png",
                              ),
                              LoyalityPointsImages(
                                avatarpath: "assets/images/delievery (4).png",
                              ),
                              LoyalityPointsImages(
                                avatarpath: "assets/images/delievery (5).png",
                              ),
                              LoyalityPointsImages(
                                avatarpath: "assets/images/delievery (2).png",
                              ),
                              SizedBox(
                                height: 15,
                                width: 145,
                                child: TextWidget(
                                    text: 'Collect points on delivery orders ',
                                    textStyle: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "Mukta",
                                        color: Color(0xff000000))),
                              )
                            ]),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 14, left: 20),
                      child: Container(
                        child: const Row(
                          children: [
                            TextWidget(
                                text: '25 points = ',
                                textStyle: TextStyle(
                                    fontSize: 10,
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xff000000))),
                            TextWidget(
                                text: 'Free Coffee  ',
                                textStyle: TextStyle(
                                    fontSize: 10,
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xff000000))),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Container(
                        child: const Row(
                          children: [
                            TextWidget(
                                text: '100 points = ',
                                textStyle: TextStyle(
                                    fontSize: 10,
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xff000000))),
                            TextWidget(
                                text: 'Free Sandwich, Burrito or Smoothie  ',
                                textStyle: TextStyle(
                                    fontSize: 10,
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xff000000))),
                          ],
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 5, right: 24),
                      child: SizedBox(
                        height: 30,
                        width: 265,
                        child: TextWidget(
                            text:
                                'Collect 05 points for every coffee,  burrito or smoothie & grab and go sandwich purchased ',
                            textStyle: TextStyle(
                                fontSize: 10,
                                fontFamily: "Mukta",
                                fontWeight: FontWeight.w400,
                                color: Color(0xff000000))),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Container(
                          height: 159,
                          width: 330,
                          decoration: BoxDecoration(
                              color: const Color(0xffF3F3F3),
                              borderRadius: BorderRadius.circular(17)),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 17, top: 18),
                            child: Row(
                              children: [
                                Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const TextWidget(
                                          text: 'BOXCO',
                                          textStyle: TextStyle(
                                              fontSize: 28,
                                              fontFamily: "Montserrat",
                                              fontWeight: FontWeight.w700,
                                              color: Color(0xff000000))),
                                      const TextWidget(
                                          text: 'SUBSCRIPTION',
                                          textStyle: TextStyle(
                                              fontSize: 24,
                                              fontFamily: "Montserrat",
                                              fontWeight: FontWeight.w700,
                                              color: Color(0xff3242F6))),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 13),
                                        child: Container(
                                            child: const Row(
                                          children: [
                                            Icon(Icons.check_circle),
                                            TextWidget(
                                                text: 'ACTIVE',
                                                textStyle: TextStyle(
                                                    fontSize: 18,
                                                    fontFamily: "Montserrat",
                                                    fontWeight: FontWeight.w700,
                                                    color: Color(0xff000000))),
                                          ],
                                        )),
                                      ),
                                      const TextWidget(
                                          text: '  Renews on 30/04/2023',
                                          textStyle: TextStyle(
                                              fontSize: 10,
                                              fontFamily: "Mukta",
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xff000000))),
                                      const Padding(
                                        padding: EdgeInsets.only(top: 21),
                                        child: TextWidget(
                                            text:
                                                '  Give your paybox pin to the merchant to claim your Subscription goods',
                                            textStyle: TextStyle(
                                                fontSize: 8,
                                                fontFamily: "Mukta",
                                                fontWeight: FontWeight.w700,
                                                color: Color(0xff000000))),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    bottom: 21,
                                  ),
                                  child: SizedBox(
                                    height: 122,
                                    width: 67,
                                    child:
                                        Image.asset('assets/images/drin 1.png'),
                                  ),
                                ),
                              ],
                            ),
                          )),
                    ),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 12, top: 16),
              child: MyLoyalityView(
                avatarpath: "assets/images/Rectangle 60.png",
                title: "Bingo Balls",
                subtitle: "Adult Ball Pit Bar",
                location: "4km away",
                mainpctrpath: "assets/images/Ellipse 1.png",
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 12, top: 16),
              child: MyLoyalityView(
                avatarpath: "assets/images/Rectangle 62.png",
                title: "Dunkin’ Burgers",
                subtitle: "Fast Foodt",
                location: "6km away",
                mainpctrpath: "assets/images/Group (2).png",
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 12, top: 16),
              child: MyLoyalityView(
                avatarpath: "assets/images/Rectangle 70.png",
                title: "The Olympus Project",
                subtitle: "Health & Fitness",
                location: "9km away",
                mainpctrpath: "assets/images/olympus.png",
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 12, top: 16),
              child: MyLoyalityView(
                avatarpath: "assets/images/Rectangle 64.png",
                title: "Burger & Co.",
                subtitle: "Burger & Pizza",
                location: "9km away",
                mainpctrpath: "assets/images/Ellipse 2.png",
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 12, top: 16),
              child: MyLoyalityView(
                avatarpath: "assets/images/Rectangle 66.png",
                title: "South Manny Flavaz",
                subtitle: "Chicken Recipes",
                location: "9km away",
                mainpctrpath: "assets/images/13 (1) 1 1.png",
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 12, top: 16),
              child: MyLoyalityView(
                avatarpath: "assets/images/Rectangle 68.png",
                title: "The Glow Up Studio",
                subtitle: "Lashes | Brows | Facials",
                location: "9km away",
                mainpctrpath: "assets/images/Group 216.png",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
