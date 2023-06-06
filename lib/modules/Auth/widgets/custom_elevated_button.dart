// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final Function() onPressed;
  double horizontalWidth;
  double verticalWidth;
  String text;
  CustomElevatedButton({
    Key? key,
    required this.onPressed,
    required this.horizontalWidth,
    required this.verticalWidth,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(0),
        alignment: Alignment.center,
        padding: MaterialStateProperty.all(
          EdgeInsets.only(
            right: horizontalWidth,
            left: horizontalWidth,
            top: verticalWidth,
            bottom: verticalWidth,
          ),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 12),
      ),
    );
  }
}
