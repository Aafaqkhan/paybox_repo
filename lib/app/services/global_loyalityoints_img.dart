import 'package:flutter/material.dart';

class LoyalityPointsImages extends StatefulWidget {
  final String? avatarpath;
  final String? path;

  const LoyalityPointsImages({
    super.key,
    this.avatarpath,
    this.path,
  });

  @override
  State<LoyalityPointsImages> createState() => _LoyalityPointsImagesState();
}

class _LoyalityPointsImagesState extends State<LoyalityPointsImages> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: Image.network(
        'https://paybox.jzmaxx.com/${widget.path}/${widget.avatarpath!}',
        height: 30,
        width: 30,
      ),
    );
  }
}
