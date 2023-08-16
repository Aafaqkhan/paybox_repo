import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    Key? key,
    this.onSaved,
    this.onChanged,
    this.validator,
    this.keyboardType,
    this.initialValue,
    this.hintText,
    this.errorText,
    this.iconData,
    this.labelText,
    this.obscureText,
    this.suffixIcon,
    this.isFirst,
    this.isLast,
    this.style,
    this.textAlign,
    this.suffix,
    this.maxlength,
    this.readonly,
  }) : super(key: key);

  final FormFieldSetter<String>? onSaved;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final TextInputType? keyboardType;
  final String? initialValue;
  final String? hintText;
  final String? errorText;
  final TextAlign? textAlign;
  final String? labelText;
  final TextStyle? style;
  final IconData? iconData;
  final bool? obscureText;
  final bool? isFirst;
  final bool? isLast;
  final Widget? suffixIcon;
  final Widget? suffix;
  final int? maxlength;
  final bool? readonly;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      // mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          labelText ?? "",
          style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontFamily: "Montserrat",
              color: Color(0xff191D23)),
          textAlign: textAlign ?? TextAlign.start,
        ),
        //rgba(25, 29, 35, 1)
        const SizedBox(
          height: 5,
        ),
        TextFormField(
          readOnly: readonly ?? false,
          maxLength: maxlength,
          maxLines: keyboardType == TextInputType.multiline ? null : 1,
          key: key,
          keyboardType: keyboardType ?? TextInputType.text,
          onSaved: onSaved,
          onChanged: onChanged,
          validator: validator,
          initialValue: initialValue ?? '',
          style: style ?? Get.textTheme.bodyMedium,
          obscureText: obscureText ?? false,
          textAlign: textAlign ?? TextAlign.start,
          decoration: InputDecoration(
              hintText: hintText ?? '',
              suffix: suffix,
              errorText: errorText,
              //   iconData: iconData,
              contentPadding: const EdgeInsets.only(left: 20, top: 10),
              hintStyle: const TextStyle(
                  fontSize: 14,
                  fontFamily: 'Montserrat',
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff191D23)),
              suffixIcon: suffixIcon,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
              )),
        ),
      ],
    );
  }

  BorderRadius get buildBorderRadius {
    if (isFirst != null && isFirst!) {
      return const BorderRadius.vertical(top: Radius.circular(10));
    }
    if (isLast != null && isLast!) {
      return const BorderRadius.vertical(bottom: Radius.circular(10));
    }
    if (isFirst != null && !isFirst! && isLast != null && !isLast!) {
      return const BorderRadius.all(Radius.circular(0));
    }
    return const BorderRadius.all(Radius.circular(10));
  }

  double get topMargin {
    if ((isFirst != null && isFirst!)) {
      return 20;
    } else if (isFirst == null) {
      return 20;
    } else {
      return 0;
    }
  }

  double get bottomMargin {
    if ((isLast != null && isLast!)) {
      return 10;
    } else if (isLast == null) {
      return 10;
    } else {
      return 0;
    }
  }
}
