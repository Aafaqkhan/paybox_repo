import 'package:flutter/material.dart';

class LoyalityPointsImages extends StatefulWidget {
  final String? avatarpath;

  const LoyalityPointsImages(
      {super.key,
      this.avatarpath,
      });

  @override
  State<LoyalityPointsImages> createState() => _LoyalityPointsImagesState();
}

class _LoyalityPointsImagesState extends State<LoyalityPointsImages> {
  @override
  Widget build(BuildContext context) {
    return  ClipRRect(
       borderRadius: BorderRadius.circular(100),
       child: Image.asset(widget.avatarpath!,
        height: 30,width: 30,
         ),
    );
  }
}