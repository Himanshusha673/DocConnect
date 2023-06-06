import 'package:flutter/material.dart';

class LinkText extends StatelessWidget {
  final String text;
  final Function() onPressed;
  const LinkText({
    super.key,
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: const TextStyle(decoration: TextDecoration.underline),
            ),
          ],
        ),
      ),
    );
  }
}
