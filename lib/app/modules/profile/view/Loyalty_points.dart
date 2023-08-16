import 'package:flutter/material.dart';
import 'package:paybox/app/services/colors/custom_colors.dart';

class LoyaltyPoints extends StatefulWidget {
  const LoyaltyPoints({super.key});

  @override
  State<LoyaltyPoints> createState() => _LoyaltyPointsState();
}

class _LoyaltyPointsState extends State<LoyaltyPoints> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        SizedBox(
          width: 254,
          height: 240,
        
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 76),
                child: TextWidget(
                    text: 'Loyalty Points ',
                    textStyle: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff191D23),
                        fontFamily: "Montserrat")),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                ),
                child: TextWidget(
                    text: '100 ',
                    textStyle: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.w800,
                        color: Color(0xff3242F6),
                        fontFamily: "Montserrat")),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 23),
                child: SizedBox(
                  height: 40,
                  width: 233,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: TextWidget(
                        text: 'Add Points',
                        textStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Montserrat",
                            color: Color(0xffFFFFFF))),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff1025E4)),
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 200,
          left: 84,
          child: Container(
            width: 86,
            height: 86,
            decoration: BoxDecoration(
                color: Color(0xff1025E4), shape: BoxShape.circle),
            child: Icon(
              Icons.handshake_outlined,
              color: Colors.white,
              size: 40,
            ),
          ),
        ),
      ],
    );
  }
}
