import 'package:flutter/material.dart';
import 'package:paybox/app/services/colors/custom_colors.dart';

class DeleteAccount extends StatelessWidget {
    final VoidCallback? onPressed;

  const DeleteAccount({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        SizedBox(
          width: 273,
          height: 230,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 240, bottom: 80),
                child: Icon(
                  Icons.cancel_rounded,
                  color: Color(0xff000000),
                  size: 30,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(),
                child: TextWidget(
                    text: 'Are you sure? ',
                    textStyle: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff191D23),
                        fontFamily: "Montserrat")),
              ),
              const Padding(
                padding: EdgeInsets.only(
                  top: 2,
                ),
                child: TextWidget(
                    text: 'You want to delete your account. ',
                    textStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xffF63232),
                        fontFamily: "Montserrat")),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 27),
                child: SizedBox(
                  height: 40,
                  width: 233,
                  child: ElevatedButton(
                    onPressed: onPressed,
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xffF63232)),
                    child: const TextWidget(
                        text: 'Delete',
                        textStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Montserrat",
                            color: Color(0xffFFFFFF))),
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 190,
          left: 94,
          child: Container(
            width: 86,
            height: 86,
            decoration:
                const BoxDecoration(color: Color(0xffF63232), shape: BoxShape.circle),
            child: const Icon(
              Icons.delete,
              color: Colors.white,
              size: 50,
            ),
          ),
        ),
      ],
    );
  }
}
