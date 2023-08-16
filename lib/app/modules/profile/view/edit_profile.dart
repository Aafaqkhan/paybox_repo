import 'package:flutter/material.dart';
import 'package:paybox/app/services/colors/custom_colors.dart';

class EditProf extends StatefulWidget {
  const EditProf({super.key});

  @override
  State<EditProf> createState() => _EditProfState();
}

class _EditProfState extends State<EditProf> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 425,
      width: 326,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 7, right: 7, top: 38),
            child: TextWidget(
                text: 'Edit Profile',
                textStyle: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff1025E4),
                  fontFamily: "Montserrat",
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 72, top: 12),
            child: SizedBox(
              height: 90,
              width: 133,
              child: Stack(
                children: [
                  Container(
                    height: 84,
                    width: 84,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            width: 3, color: const Color(0xff1025E4))),
                    child: Image.asset('assets/images/Group 69.png'),
                  ),
                  Positioned(
                    left: 70,
                    top: 10,
                    child: Container(
                      height: 24,
                      width: 24,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                          color: Color(0xffFFFFFF), shape: BoxShape.circle),
                      child: const Icon(Icons.camera_alt,
                          size: 16, color: Color(0xff1025E4)),
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 7, bottom: 4, top: 11),
            child: TextWidget(
                text: 'Name',
                textStyle: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Montserrat",
                    color: Color(0xff000000))),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 7, right: 7),
            child: TextField(
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 7,
              top: 18,
              bottom: 4,
            ),
            child: TextWidget(
                text: 'Mobile Number',
                textStyle: const TextStyle(
                    fontSize: 14,
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w600,
                    color: Color(0xff000000))),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 7, right: 7),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 24, left: 7),
            child: Container(
              width: 252,
              height: 44,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: const Color(0xff1025E4),
                  borderRadius: BorderRadius.circular(4)),
              child: TextWidget(
                  text: 'Save',
                  textStyle: const TextStyle(
                      fontSize: 16,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w600,
                      color: Color(0xffFFFFFF))),
            ),
          )
        ],
      ),
    );
  }
}
