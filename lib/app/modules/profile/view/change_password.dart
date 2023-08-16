import 'package:flutter/material.dart';
import 'package:paybox/app/services/colors/custom_colors.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 423,width:326,
     child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 38),
            child: TextWidget(
                text: 'Change Password',
                textStyle: TextStyle(
                    fontSize: 22,
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w700,
                    color: Color(0xff1025E4))),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25, ),
            child: TextWidget(
                text: 'Old Password',
                textStyle: TextStyle(
                    fontSize: 14,
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w600,
                    color: Color(0xff191D23))),
          ),
          
          SizedBox(height: 40,width: 252,
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'loremipsum',
                hintStyle: TextStyle(
                    fontSize: 14,
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w400,
                    color: Color(0xff191D23)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top:21,),
            child: TextWidget(
                text: 'New Password',
                textStyle: TextStyle(
                    fontSize: 14,
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w600,
                    color: Color(0xff191D23))),
          ),
          SizedBox(height: 40,width:252,
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.remove_red_eye_outlined),
                hintText: '●●●●●●●●●●●●●●',
                hintStyle: TextStyle(
                    fontSize: 14,
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w400,
                    color: Color(0xff191D23)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 18,),
            child: TextWidget(
                text: 'Confirm Password',
                textStyle: TextStyle(
                    fontSize: 14,
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w600,
                    color: Color(0xff191D23))),
          ),
          SizedBox(height: 40,width: 252,
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.remove_red_eye_outlined),
                hintText: '●●●●●●●●●●●●●●',
                hintStyle: TextStyle(
                    fontSize: 14,
                    fontFamily: "Montserrat",
                    
                    fontWeight: FontWeight.w400,
                    color: Color(0xff191D23)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 36),
            child: Container(
              height: 44,
              width: 252,
              child: ElevatedButton(
                onPressed: () {},
                child: TextWidget(
                    text: 'Continue',
                    textStyle: TextStyle(
                        fontSize: 16,
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w600,
                        color: Color(0xffFFFFFF))),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff1025E4)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
