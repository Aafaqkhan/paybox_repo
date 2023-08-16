import 'package:flutter/material.dart';
import 'package:paybox/app/services/colors/custom_colors.dart';

class MyDealsOffer extends StatefulWidget {
  final String? avatarpath;
  final String? title;

  const MyDealsOffer({
    super.key,
    this.avatarpath,
    this.title,
  });
  @override
  State<MyDealsOffer> createState() => _MyDealsOfferState();
}

class _MyDealsOfferState extends State<MyDealsOffer> {
  @override
  Widget build(BuildContext context) {
    return Card(
        child: SizedBox(
      height: 83,
      width: 83,
      child: Column(children: [
        Container(
            width: 83,
            height: 57,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: const Color(0xffE5E8EF)),
            child: Image.asset(
              widget.avatarpath!,
              fit: BoxFit.scaleDown,
            )),
        SizedBox(
          width: 83,
          height: 26,
          child: Center(
            child: TextWidget(
                text: widget.title!,
                textStyle: const TextStyle(
                    color: Color(0xff211919),
                    fontSize: 12,
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w500)),
          ),
        ),
      ]),
    ));
  }
}
