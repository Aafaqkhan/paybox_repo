import 'package:flutter/material.dart';
import 'package:paybox/app/services/colors/custom_colors.dart';

class MyGlobalProfile extends StatefulWidget {
  final String? title;
  // final String? routeName;
  // final Function(int)? onChange;
  const MyGlobalProfile({
    super.key,
    this.title,
    // this.routeName,
    // this.onChange
  });

  @override
  State<MyGlobalProfile> createState() => _MyGlobalProfileState();
}

class _MyGlobalProfileState extends State<MyGlobalProfile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      width: 335,
      alignment: Alignment.centerLeft,
      decoration: const BoxDecoration(
          border: Border(
        bottom: BorderSide(
          color: Color(0xff000000),
          width: 0.2,
          style: BorderStyle.solid,
          
        ),
      )),
          child: Padding(
            padding: const EdgeInsets.only(left: 16),
            child: TextWidget(
                        text: widget.title!,
                        textStyle: const TextStyle(
                          fontSize: 16,
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w400,
                          color: Color(0xff1C1B1F),
                        )),
          ),
      
      

    );
  }
}
