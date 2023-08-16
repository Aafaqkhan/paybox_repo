import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BlockButtonWidget extends StatelessWidget {
  const BlockButtonWidget(
      {Key? key,
      @required this.color,
      @required this.text,
      @required this.onPressed})
      : super(key: key);

  final Color? color;
  final Widget? text;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      color: color,
      disabledElevation: 0,
      disabledColor: Get.theme.focusColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      elevation: 0,
      child: text,
    );
  }
}
