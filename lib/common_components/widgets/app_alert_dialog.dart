import 'package:flutter/material.dart';

class AppAlertDialog extends StatelessWidget {
  final Widget icon;
  final Color iconColor;
  final Widget child;
  final double height;

  const AppAlertDialog({
    super.key,
    required this.iconColor,
    required this.icon,
    required this.child,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(25.0),
          child: Material(
            borderRadius: BorderRadius.circular(8),
            elevation: 10,
            shadowColor: Colors.white,
            child: Container(
                padding: const EdgeInsets.only(top: 48, left: 16, right: 16, bottom: 16),
                width: MediaQuery.of(context).size.width * 0.8,
                height: height,
                child: child),
          ),
        ),
        Positioned(
          left: MediaQuery.of(context).size.width / 2.65,
          child: Material(
            shadowColor: Colors.white,
            borderRadius: BorderRadius.circular(100),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: iconColor,
                  borderRadius: BorderRadius.circular(100),
                ),
                padding: const EdgeInsets.all(0),
                child: Center(child: icon),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
