import 'package:flutter/material.dart';

class GlobalImageCard extends StatefulWidget {
  final String imagePath;
  final double width;
  final double height;

  const GlobalImageCard({super.key, 
    required this.imagePath,
    required this.width,
    required this.height,
  });

  @override
  State<GlobalImageCard> createState() => _GlobalImageCardState();
}

class _GlobalImageCardState extends State<GlobalImageCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Image.asset(
        widget.imagePath,
        width: widget.width,
        height: widget.height,
        fit: BoxFit.cover,
      ),
    );
  }
}
