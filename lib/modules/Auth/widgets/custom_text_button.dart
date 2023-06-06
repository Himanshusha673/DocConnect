// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  Function() onPressed;
  TextDecoration? decoration;
  String text;
  double fontSize;
  Color? color;
  FontWeight? fontWeight;
  CustomTextButton({
    this.decoration,
    this.color,
    Key? key,
    required this.onPressed,
    required this.text,
    required this.fontSize,
    this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          decoration: decoration,
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
