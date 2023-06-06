import 'package:flutter/material.dart';
import 'package:jatya_patient_mobile/common_components/widgets/app_alert_dialog.dart';

class SuccessAlertDialog extends StatelessWidget {
  final String message;
  final Function()? onPressed;
  final double? height;
  const SuccessAlertDialog(
      {super.key, this.height, required this.message, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return AppAlertDialog(
      iconColor: Colors.green,
      icon: const Icon(
        Icons.check_circle,
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
                    message,
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
                  side: const BorderSide(width: 1, color: Colors.blue)),
              onPressed: () {
                onPressed == null ? Navigator.pop(context) : onPressed!();
              },
              child: const Text(
                "OK",
                style: TextStyle(
                  color: Colors.blue,
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
