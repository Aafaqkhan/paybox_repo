import 'package:flutter/material.dart';
import 'package:paybox/app/services/colors/custom_colors.dart';

class MyCustomerSupport extends StatefulWidget {
  const MyCustomerSupport({
    super.key,
  });
  @override
  State<MyCustomerSupport> createState() => _MyCustomerSupportState();
}

class _MyCustomerSupportState extends State<MyCustomerSupport> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 491,
      width: 326,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 36,left:25 ),
            child: TextWidget(
                text: 'Customer Support',
                textStyle: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff1025E4),
                    fontFamily: "Montserrat")),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12,left: 9),
            child: TextWidget(
                text:
                    'We will reply to your message within 24hrs',
                textStyle: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff191D23),
                  fontFamily: "Montserrat",
                )),
          ),
           Padding(
            padding: const EdgeInsets.only(left: 20),
            child: TextWidget(
                text:
                    ' to the email address on your account ',
                textStyle: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff191D23),
                  fontFamily: "Montserrat",
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 24,right: 119),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Icons.phone_android,
                  color: Color(0xff1025E4),
                ),
                TextWidget(
                    text: ' 08000096645 ',
                    textStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff1C1B1F),
                      fontFamily: "Montserrat",
                    )),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20,right: 75),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Icons.email_rounded,
                  color: Color(0xff1025E4),
                ),
                TextWidget(
                    text: ' info@payboxuk.com',
                    textStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff1C1B1F),
                      fontFamily: "Montserrat",
                    )),
              ],
            ),
            ),
          
          Padding(
            padding: const EdgeInsets.only(top: 24,left: 4),
            child: TextWidget(
                text: ' Message',
                textStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff000000),
                  fontFamily: "Montserrat",
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 7),
            child: Container(
              height: 130,
              width: 252,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(width: 1, color: Color(0xff000000)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 38,left: 7,),
            child: Container(
              height: 44,
              width: 252,
              child: ElevatedButton(
                onPressed: () {},
                child: TextWidget(
                    text: 'Continue',
                    textStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Montserrat",
                        color: Color(0xffFFFFFF))),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff1025E4)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
