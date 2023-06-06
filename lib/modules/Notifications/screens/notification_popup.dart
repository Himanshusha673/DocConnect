import 'package:flutter/material.dart';
import 'package:doc_connect/modules/Notifications/widgets/custompopup.dart';

import '../../../utils/constants/color_konstants.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Text("Notifications"),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(6),
                color: Colors.white,
              ),
              child: const Text(
                '02',
                style: TextStyle(
                  color: ColorKonstants.primaryColor,
                  fontSize: 14,
                ),
              ),
            )
          ],
        ),
        actions: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Mark all as read"),
              ),
            ],
          )
        ],
      ),
      body: Column(children: [
        TextButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const CustomPopupContent();
                },
              );
            },
            child: const Text("hey")),
      ]),
    );
  }
}
