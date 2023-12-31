import 'package:flutter/material.dart';
import 'package:paybox/app/services/colors/custom_colors.dart';

class MyPurchases extends StatefulWidget {
  final String? avatarpath;
  final String? title;
  final String? subtitle;
  final String? openingtime;
  final String? oldprize;
  final String? newprize;
  final String? mainpctrpath;
  final String? salevalue;

  const MyPurchases(
      {super.key,
      this.avatarpath,
      this.title,
      this.subtitle,
      this.openingtime,
      this.oldprize,
      this.newprize,
      this.mainpctrpath,
      this.salevalue});

  @override
  State<MyPurchases> createState() => _MyPurchasesState();
}

class _MyPurchasesState extends State<MyPurchases> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: SizedBox(
            width: 370,
            height: 100,
            child: Row(
              children: [
                SizedBox(
                    height: 100,
                    width: 220,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 6),
                              child: CircleAvatar(
                                  // width: 48,
                                  // height: 48,
                                  radius: 25,
                                  backgroundImage: NetworkImage(
                                      'https://paybox.jzmaxx.com/${widget.avatarpath!}')),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  // height: 30,
                                  width: 130,
                                  child: TextWidget(
                                      text: widget.title!,
                                      textStyle: const TextStyle(
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w700,
                                          color: Color(0xff000000))),
                                ),
                                SizedBox(
                                  height: 30,
                                  width: 130,
                                  child: TextWidget(
                                      text: widget.subtitle!,
                                      textStyle: const TextStyle(
                                          fontSize: 09,
                                          fontFamily: "Mukta",
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xff000000))),
                                ),
                              ],
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 8.88,
                            right: 4,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 145,
                                child: TextWidget(
                                    text: widget.openingtime!,
                                    textStyle: const TextStyle(
                                        fontSize: 9,
                                        fontFamily: "Montserrat",
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xff000000))),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 20,
                                ),
                                child: TextWidget(
                                    text: widget.oldprize!,
                                    textStyle: const TextStyle(
                                        fontSize: 8,
                                        fontFamily: "Montserrat",
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff000000),
                                        decoration:
                                            TextDecoration.lineThrough)),
                              ),
                              TextWidget(
                                  text: widget.newprize!,
                                  textStyle: const TextStyle(
                                      fontSize: 12,
                                      fontFamily: "Montserrat",
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xff3242F6))),
                            ],
                          ),
                        )
                      ],
                    )),
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: SizedBox(
                    height: 93,
                    width: 150,
                    child: Stack(
                      children: [
                        Image.network(
                          'https://paybox.jzmaxx.com/${widget.mainpctrpath!}',
                          height: 150,
                          fit: BoxFit.cover,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 70.5, top: 16),
                          child: Container(
                            height: 18,
                            width: 100,
                            decoration: const BoxDecoration(
                                color: Color(0xff3242F6),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(100),
                                    bottomLeft: Radius.circular(100))),
                            child: Center(
                              child: TextWidget(
                                  text: widget.salevalue!,
                                  textStyle: const TextStyle(
                                      fontSize: 12,
                                      fontFamily: "Montserrat",
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xffFFFFFF))),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 56, left: 35),
                          child: Container(
                            height: 19,
                            width: 83,
                            decoration: BoxDecoration(
                                color: const Color(0xffFFFFFF),
                                borderRadius: BorderRadius.circular(100)),
                            child: const Center(
                              child: TextWidget(
                                  text: 'Buy Now',
                                  textStyle: TextStyle(
                                      fontSize: 10,
                                      fontFamily: "Montserrat",
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xff3242F6))),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
