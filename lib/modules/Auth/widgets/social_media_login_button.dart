import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SocialMediaLoginButton extends StatelessWidget {
  final String iconImage;
  final Function() onPressed;

  const SocialMediaLoginButton({
    super.key,
    required this.iconImage,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Platform.isIOS ? 0 : 8),
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          side: const BorderSide(
            width: 1.5,
            color: Colors.blue,
          ),
          padding: const EdgeInsets.all(12),
        ),
        child: SizedBox(
          width: 28,
          height: 28,
          child: SvgPicture.asset(
            iconImage,
            fit: BoxFit.fitHeight,
          ),
        ),
      ),
    );
  }
}
