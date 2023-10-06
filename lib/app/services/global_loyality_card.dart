import 'package:flutter/material.dart';
import 'package:paybox/app/services/colors/custom_colors.dart';

class MyLoyalityCard extends StatefulWidget {
  final String? avatarpath;
  final String? title;
  final String? subtitle;
  final String? location;
  final String? mainpctrpath;

  const MyLoyalityCard({
    super.key,
    this.avatarpath,
    this.title,
    this.subtitle,
    this.location,
    this.mainpctrpath,
  });

  @override
  State<MyLoyalityCard> createState() => _MyLoyalityCardState();
}

class _MyLoyalityCardState extends State<MyLoyalityCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        height: 150,
        width: 120,
        child: Stack(
          children: [
            Row(
              children: [
                SizedBox(
                  height: 150,
                  width: 120,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 8,
                    ),
                    child: Column(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12.0),
                            child: SizedBox(
                              height: 47,
                              width: 120,
                              // 'https://paybox.jzmaxx.com/${widget.avatarpath!}'
                              child: Image.network(
                                'https://paybox.jzmaxx.com/${widget.avatarpath!}',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            // height: 35,
                            //  width: 49,
                            child: TextWidget(
                                text: widget.title!,
                                textStyle: const TextStyle(
                                    fontFamily: "Montserrat",
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xff000000))),
                          ),
                          SizedBox(
                            // height: 31,
                            // width: 49,
                            child: TextWidget(
                                text: widget.subtitle!,
                                textStyle: const TextStyle(
                                    fontFamily: "Mukta",
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff000000))),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.location_on,
                                size: 12,
                              ),
                              TextWidget(
                                  text: widget.location!,
                                  textStyle: const TextStyle(
                                      fontFamily: "Montserrat",
                                      fontWeight: FontWeight.w500,
                                      fontSize: 10,
                                      color: Color(0xff000000))),
                            ],
                          )
                        ]),
                  ),
                ),
              ],
            ),
            Positioned(
              right: 70,
              bottom: 110,
              child: CircleAvatar(
                // height: 56,
                // width: 56,
                radius: 17.5,
                backgroundImage: NetworkImage(
                    'https://paybox.jzmaxx.com/${widget.mainpctrpath!}'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
