import 'package:flutter/material.dart';
import 'package:doc_connect/utils/constants/color_konstants.dart';

class NewOnlineConsultationResult extends StatefulWidget {
  const NewOnlineConsultationResult({super.key});

  @override
  State<NewOnlineConsultationResult> createState() =>
      NewOnlineConsultationReStaResultScreen();
}

class NewOnlineConsultationReStaResultScreen
    extends State<NewOnlineConsultationResult> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "4 Urologists are online now",
                style: TextStyle(color: ColorKonstants.textcolor),
              ),
            ],
          ),
          const SizedBox(height: 8),
          // Column(
          //   children: doctors
          //       .map((e) => DoctorDetailCard(
          //             doctor: e,
          //             detailCardType: DoctorDetailCardType.consultation,
          //           ))
          //       .toList(),
          // ),
        ],
      ),
    );
  }
}
