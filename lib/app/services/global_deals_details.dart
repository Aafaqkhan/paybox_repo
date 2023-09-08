import 'package:flutter/material.dart';
import 'package:paybox/app/services/colors/custom_colors.dart';

class MyGlobalDealsDetails extends StatefulWidget {
  final String? title;
  final String? subtitle;
  final String? oldprice;
  final String? newprice;
  final String? avatarpath;
  final String? salevalue;

  const MyGlobalDealsDetails({
    super.key,
    this.subtitle,
    this.avatarpath,
    this.newprice,
    this.oldprice,
    this.salevalue,
    this.title,
  });

  @override
  State<MyGlobalDealsDetails> createState() => _MyGlobalDealsDetailsState();
}

class _MyGlobalDealsDetailsState extends State<MyGlobalDealsDetails> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16.0,
      ),
      child: Card(
        child: SizedBox(
          height: 220,
          width: 263,
          child: Column(
            children: [
              Stack(children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: SizedBox(
                      height: 150,
                      width: 263,
                      child: Image.network(
                        "https://paybox.jzmaxx.com/${widget.avatarpath!}",
                        fit: BoxFit.cover,
                      )),
                ),
                Positioned(
                  top: 14,
                  left: 1,
                  child: Container(
                    height: 31,
                    width: 83,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                        color: Color(0xff3242F6),
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(12),
                            bottomRight: Radius.circular(12))),
                    child: TextWidget(
                        text: widget.salevalue!,
                        textStyle: const TextStyle(
                            fontSize: 12,
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w900,
                            color: Color(0xffFFFFFF))),
                  ),
                ),
              ]),
              SizedBox(
                height: 70,
                width: 263,
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 16, left: 8, right: 27),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextWidget(
                              text: widget.title!,
                              textStyle: const TextStyle(
                                  color: Color(0xff000000),
                                  fontSize: 14,
                                  fontFamily: "Montserrat",
                                  fontWeight: FontWeight.w700)),
                          TextWidget(
                              text: widget.oldprice!,
                              textStyle: const TextStyle(
                                  color: Color(0xff000000),
                                  fontSize: 10,
                                  fontFamily: "Montserrat",
                                  fontWeight: FontWeight.w500,
                                  decoration: TextDecoration.lineThrough)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8, right: 27),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 200,
                            child: TextWidget(
                                text: widget.subtitle!,
                                textStyle: const TextStyle(
                                    color: Color(0xff000000),
                                    fontSize: 12,
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.w400)),
                          ),
                          TextWidget(
                              text: widget.newprice!,
                              textStyle: const TextStyle(
                                color: Color(0xff3242F6),
                                fontSize: 14,
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.w700,
                              )),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
