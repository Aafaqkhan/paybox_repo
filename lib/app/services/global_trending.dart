import 'package:flutter/material.dart';
import 'package:paybox/app/services/colors/custom_colors.dart';

class MyTrendingDeals extends StatefulWidget {
  final String? avatarpath;
  final String? title;
  final String? subtitle;
  final String? salevalue;

  const MyTrendingDeals(
      {super.key, this.avatarpath, this.title, this.subtitle, this.salevalue});

  @override
  State<MyTrendingDeals> createState() => _MyTrendingDealsState();
}

class _MyTrendingDealsState extends State<MyTrendingDeals> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
      child: SizedBox(
        // height: 165,
        // width: 180,
        child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Column(children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: SizedBox(
                height: 112,
                width: 112,
                child: Image.network(
                  "https://paybox.jzmaxx.com/${widget.avatarpath!}",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 17,
            ),
            TextWidget(
                text: widget.title!,
                textStyle: const TextStyle(
                    fontSize: 12,
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.bold,
                    color: Color(0xff000000))),
            TextWidget(
                text: widget.subtitle!,
                textStyle: const TextStyle(
                    fontSize: 12,
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w400,
                    color: Color(0xff000000))),
            TextWidget(
                text: widget.salevalue!,
                textStyle: const TextStyle(
                    fontSize: 12,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff1025E4))),
          ]),
        ]),
      ),
    );
  }
}
