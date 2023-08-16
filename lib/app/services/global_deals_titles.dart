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
              child: SizedBox(
                  width: 53,
                  height: 60,
                  child: Image.asset(widget.avatarpath!)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 27),
              child: SizedBox(
                height: 60,
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
