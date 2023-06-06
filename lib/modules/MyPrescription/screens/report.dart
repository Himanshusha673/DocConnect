import 'package:flutter/material.dart';

// REMARK:- NEED TO ADD COMMON TOP TABBAR.
class Report extends StatelessWidget {
  const Report({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: const [
            Text("REPORT PDF WILL BE DISPLAYED HERE"),
          ],
        ),
      ),
    );
  }
}
