import 'package:flutter/material.dart';
import 'package:doc_connect/utils/constants/image_konstants.dart';

List<Widget> buildIconAndTitle(
    {required String titleText, required double height}) {
  return [
    Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Image.asset(
        ImagesConstants.jatyaLogoName,
        height: height,
        fit: BoxFit.cover,
      ),
    ),
    const SizedBox(
      height: 16,
    ),
    Text(
      titleText,
      style: const TextStyle(fontSize: 20),
    ),
  ];
}
