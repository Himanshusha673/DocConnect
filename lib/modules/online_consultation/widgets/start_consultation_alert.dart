import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:doc_connect/common_components/widgets/app_alert_dialog.dart';

class StartConsulationAlertDialog extends StatelessWidget {
  const StartConsulationAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AppAlertDialog(
        iconColor: Colors.orange.shade800,
        icon: const Icon(
          Icons.warning_rounded, color: Colors.white,
          // size: 55,
        ),
        height: MediaQuery.of(context).size.height * 0.3,
        child: Column(
          children: [
            const Text(
              'You are trying to connect with one of our doctor online. You will be charged for this consultation and the same will reflect in your Jatya Wallet. Do you wish to continue?',
              style: TextStyle(color: Colors.black),
            ),
            const SizedBox(height: 24),
            SizedBox(
                width: MediaQuery.of(context).size.width * .65,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('OK,Proceed'),
                )),
            const SizedBox(height: 8),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Text(
                'cancel',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                ),
              ),
            )
          ],
        ));
  }
}

showAlertDialog(BuildContext context) {}

// display the child widget, as alert popup
// with glass blur background
showPopup({required BuildContext context, required Widget child}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Container(
            width: 200.0,
            height: 200.0,
            decoration:
                BoxDecoration(color: Colors.grey.shade100.withOpacity(0.1)),
            child: Stack(
              children: [
                Center(child: child),
              ],
            ),
          ),
        ),
      );
    },
  );
}
