import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:paybox/app/services/global_loyalty_view_card.dart';

class LoyaltyScreen extends StatefulWidget {
  const LoyaltyScreen({super.key});

  @override
  State<LoyaltyScreen> createState() => _LoyaltyScreenState();
}

class _LoyaltyScreenState extends State<LoyaltyScreen> {
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
                title: "The Olympus Projects",
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
