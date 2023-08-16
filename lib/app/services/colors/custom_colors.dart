import 'package:flutter/cupertino.dart';

class AppColors {
  AppColors._();
  static Color maincolor = const Color.fromRGBO(16, 37, 228, 1);
  static Color buttoncolr = const Color.fromRGBO(57, 57, 60, 1);
  static Color extrabutton = const Color.fromRGBO(16, 37, 228, 1);
  static Color greencolr = const Color.fromRGBO(5, 148, 107, 1);
}

//background: rgba(50, 66, 246, 1);
//background: rgba(5, 148, 107, 1);
//maincolor:rgba(16, 37, 228, 1)
//rgba(5, 148, 107, 1)

class CustomContainerWidget extends StatelessWidget {
  final Color color;
  final double width;
  final double height;
  final Widget? child;

  const CustomContainerWidget(
      {super.key,
      required this.color,
      required this.width,
      required this.height,
      this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      width: width,
      height: height,
      child: child,
    );
  }
}

class TextWidget extends StatelessWidget {
  final String text;
  final TextStyle textStyle;

  const TextWidget({
    super.key,
    required this.text,
    required this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: textStyle,
    );
  }
}
