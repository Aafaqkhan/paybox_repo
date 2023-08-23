import 'package:flutter/material.dart';
import 'package:paybox/app/services/colors/custom_colors.dart';

class MyGlobalDealTitles extends StatefulWidget {
  final String? avatarpath;
  final String? title;
  final String? subtitle;

  const MyGlobalDealTitles({
    super.key,
    this.avatarpath,
    this.title,
    this.subtitle,
  });

  @override
  State<MyGlobalDealTitles> createState() => _MyGlobalDealTitlesState();
}

class _MyGlobalDealTitlesState extends State<MyGlobalDealTitles> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.only(top: 27, left: 16),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 7),
              child: CircleAvatar(
                radius: 30,
                backgroundColor:
                    Colors.transparent, // Set a transparent background color
                child: ClipOval(
                  child: Image.network(
                    "https://paybox.jzmaxx.com/" + widget.avatarpath!,
                    fit: BoxFit.cover, // Make sure the image covers the circle
                    width:
                        60, // Double the radius to ensure the image covers the circle
                    height:
                        60, // Double the radius to ensure the image covers the circle
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 27),
              child: SizedBox(
                height: 75,
                width: 203,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                        text: widget.title!,
                        textStyle: const TextStyle(
                            color: Color(0xff211919),
                            fontSize: 18,
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w700)),
                    TextWidget(
                        text: widget.subtitle!,
                        textStyle: const TextStyle(
                            color: Color(0xff211919),
                            fontSize: 12,
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w400)),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
