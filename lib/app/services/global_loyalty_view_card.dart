import 'package:flutter/material.dart';
import 'package:paybox/app/services/colors/custom_colors.dart';

class MyLoyalityView extends StatefulWidget {
  final String? avatarpath;
  final String? title;
  final String? subtitle;
  final String? location;
  final String? mainpctrpath;

  const MyLoyalityView({
    super.key,
    this.avatarpath,
    this.title,
    this.subtitle,
    this.location,
    this.mainpctrpath,
  });

  @override
  State<MyLoyalityView> createState() => _MyLoyalityViewState();
}

class _MyLoyalityViewState extends State<MyLoyalityView> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        height: 93,
        width: 370,
        child: Stack(
          children: [
            Row(
              children: [
                SizedBox(
                  height: 93,
                  width: 175,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 14, top: 18),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWidget(
                              text: widget.title!,
                              textStyle: const TextStyle(
                                  fontFamily: "Montserrat",
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff000000))),
                          TextWidget(
                              text: widget.subtitle!,
                              textStyle: const TextStyle(
                                  fontFamily: "Mukta",
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff000000))),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 18,
                            ),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.location_on,
                                  size: 16,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 13),
                                  child: TextWidget(
                                      text: widget.location!,
                                      textStyle: const TextStyle(
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w500,
                                          fontSize: 10,
                                          color: Color(0xff000000))),
                                ),
                              ],
                            ),
                          )
                        ]),
                  ),
                ),
                SizedBox(
                  height: 93,
                  width: 185,
                  child: Image.asset(widget.avatarpath!),
                ),
              ],
            ),
            Positioned(
              right: 137,
              bottom: 17.5,
              child: SizedBox(
                height: 64,
                width: 64,
                child: Image.asset(widget.mainpctrpath!),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
