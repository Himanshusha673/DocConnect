import 'package:flutter/material.dart';

import 'custom_text_button.dart';

List<Widget> buildTermsAndCopyrightWidget(
    {required Function() termsOnPressed, required Function() privacyOnPressed, required Function() cookieOnPressed}) {
  return [
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomTextButton(
          onPressed: termsOnPressed,
          text: 'Terms & Conditions',
          fontSize: 12,
          color: Colors.black,
        ),
        Container(
          height: 5.0,
          width: 5.0,
          decoration: const BoxDecoration(
            color: Colors.grey,
            shape: BoxShape.circle,
          ),
        ),
        CustomTextButton(
          onPressed: privacyOnPressed,
          text: 'Privacy Policy',
          fontSize: 12,
          color: Colors.black,
        ),
        Container(
          height: 5.0,
          width: 5.0,
          decoration: const BoxDecoration(
            color: Colors.grey,
            shape: BoxShape.circle,
          ),
        ),
        CustomTextButton(
          onPressed: cookieOnPressed,
          text: 'Cookie Policy',
          fontSize: 12,
          color: Colors.black,
        ),
      ],
    ),
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Icon(
          Icons.copyright,
          size: 16,
          color: Colors.black,
        ),
        SizedBox(
          width: 2,
        ),
        Text(
          'Copyright 2023-2024 Jatya Inc.',
          style: TextStyle(
            color: Colors.black,
            fontSize: 12,
          ),
        ),
      ],
    )
  ];
}
