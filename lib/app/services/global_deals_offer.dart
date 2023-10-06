import 'package:flutter/material.dart';
import 'package:paybox/app/services/colors/custom_colors.dart';

class MyDealsOffer extends StatefulWidget {
  final String? avatarpath;
  final String? title;
  final Color? color;

  const MyDealsOffer({
    super.key,
    this.avatarpath,
    this.title,
    this.color,
  });
  @override
  State<MyDealsOffer> createState() => _MyDealsOfferState();
}

class _MyDealsOfferState extends State<MyDealsOffer> {
  @override
  Widget build(BuildContext context) {
    return Card(
        color: widget.color,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
            bottomLeft: Radius.circular(12),
            bottomRight: Radius.circular(12),
          ),
        ),
        child: SizedBox(
          height: 90,
          width: 83,
          child: Column(children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: SizedBox(
                  width: 83,
                  height: 57,
                  child: Image.network(
                    "https://paybox.jzmaxx.com/${widget.avatarpath!}",
                    fit: BoxFit.cover,
                  )),
            ),
<<<<<<< HEAD
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: SizedBox(
                width: 83,
                height: 30,
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
            ),
          ]),
        ));
  }
}

class MyStaticDealOffer extends StatefulWidget {
  final String? avatarpath;
  final String? title;
  final Color? color;

  const MyStaticDealOffer({
    super.key,
    this.avatarpath,
    this.title,
    this.color,
  });
  @override
  State<MyStaticDealOffer> createState() => _MyStaticDealOfferState();
}

class _MyStaticDealOfferState extends State<MyStaticDealOffer> {
  @override
  Widget build(BuildContext context) {
    return Card(
        color: widget.color,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
            bottomLeft: Radius.circular(12),
            bottomRight: Radius.circular(12),
          ),
        ),
        child: SizedBox(
          height: 90,
          width: 83,
          child: Column(children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: SizedBox(
                  width: 83,
                  height: 57,
                  child: Image.asset(
                    "${widget.avatarpath}",
                    fit: BoxFit.cover,
                  )),
            ),
=======
>>>>>>> c931483518b3abff07e356e13cda4a3dea0c28e8
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: SizedBox(
                width: 83,
                height: 30,
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
            ),
          ]),
        ));
  }
}
