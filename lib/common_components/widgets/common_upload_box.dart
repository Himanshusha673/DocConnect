import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import 'package:doc_connect/utils/constants/color_konstants.dart';

class CommonUploadReport extends StatelessWidget {
  final bool isDisabled;
  const CommonUploadReport({super.key, required this.isDisabled});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: DottedBorder(
        padding: const EdgeInsets.all(2),
        color: isDisabled ? Colors.grey : ColorKonstants.primarySwatch,
        borderType: BorderType.Rect,
        dashPattern: const <double>[8, 3],
        child: Container(
          height: 50,
          decoration: const BoxDecoration(),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Icon(
              Icons.camera_alt_outlined,
              color: isDisabled ? Colors.grey : ColorKonstants.primarySwatch,
              size: 25,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              "Upload Doc",
              style: TextStyle(
                  fontSize: 16,
                  color:
                      isDisabled ? Colors.grey : ColorKonstants.primarySwatch,
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.w500),
            ),
          ]),
        ),
      ),
    );
  }
}
