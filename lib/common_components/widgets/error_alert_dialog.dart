import 'package:flutter/material.dart';
import 'package:doc_connect/common_components/widgets/app_alert_dialog.dart';

class ErrorAlertDialog extends StatelessWidget {
  final String error;
  final Function()? onPressed;
  final double? height;
  const ErrorAlertDialog(
      {super.key, this.height, required this.error, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return AppAlertDialog(
      iconColor: Colors.red,
      icon: const Icon(
        Icons.error,
        color: Colors.white,
      ),
      height: height ?? MediaQuery.of(context).size.height * 0.22,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Text(
                    error,
                    textAlign: TextAlign.center,
                  )),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.6,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                  side: const BorderSide(width: 1, color: Colors.red)),
              onPressed: () {
                onPressed == null ? Navigator.pop(context) : onPressed!();
              },
              child: const Text(
                "OK",
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            ),
          ),
          // LinkText(
          //     onPressed: () {
          //       Navigator.pop(context);
          //     },
          //     text: "cancel")
        ],
      ),
    );
  }
}
