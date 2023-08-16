import 'package:flutter/material.dart';
import 'package:paybox/app/services/colors/custom_colors.dart';

class TrendingDeals extends StatelessWidget {
  const TrendingDeals({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Card(
              child: SizedBox(
                height: 112,
                width: 112,
                child: Image.asset('assets/images/Burger & Co (4).png'),
              ),
            ),
            Card(
              child: SizedBox(
                height: 112,
                width: 112,
                child: Image.asset('assets/images/Burger & Co (2).png'),
              ),
            ),
            Card(
              child: SizedBox(
                height: 112,
                width: 112,
                child: Image.asset('assets/images/Burger & Co (3).png'),
              ),
            ),
          ],
        ),
        const Row(
          children: [
            SizedBox(
              height: 54,
              width: 93,
              child: Column(
                children: [
                  TextWidget(
                      text: 'Ana medical',
                      textStyle: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff000000))),
                  TextWidget(
                      text: 'Botox 2 areas',
                      textStyle: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff000000))),
                  TextWidget(
                      text: '47% 0ff',
                      textStyle: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff1025E4),
                          fontStyle: FontStyle.italic)),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: SizedBox(
                height: 54,
                width: 93,
                child: Column(
                  children: [
                    TextWidget(
                        text: 'Boxco Vegan',
                        textStyle: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff000000))),
                    TextWidget(
                        text: 'Rice Bowls',
                        textStyle: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff000000))),
                    TextWidget(
                        text: '20% 0ff',
                        textStyle: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff1025E4),
                            fontStyle: FontStyle.italic)),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 60,
              width: 93,
              child: Column(
                children: [
                  TextWidget(
                      text: 'Bingo Balls',
                      textStyle: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff000000))),
                  TextWidget(
                      text: 'Mega Package',
                      textStyle: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff000000))),
                  TextWidget(
                      text: '65% 0ff',
                      textStyle: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff1025E4),
                          fontStyle: FontStyle.italic)),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
