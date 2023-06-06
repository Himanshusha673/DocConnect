import 'package:flutter/material.dart';
import 'package:doc_connect/utils/constants/color_konstants.dart';

class Label extends StatelessWidget {
  final Widget label;
  final BuildContext context;
  final Color? color;
  const Label(
      {super.key, this.color, required this.context, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 4),
          decoration: BoxDecoration(
            color: color ?? ColorKonstants.verifiedBG,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
                width: 0.5,
                color: ColorKonstants.verifiedBorder.withOpacity(0.7)),
          ),
          child: label),
    );
  }
}
