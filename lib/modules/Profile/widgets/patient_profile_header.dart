import 'package:flutter/material.dart';
import 'package:doc_connect/modules/Profile/widgets/patient_circular_profile_pic.dart';
import 'package:doc_connect/utils/SharePref.dart';

class PatientProfileHeader extends StatelessWidget {
  const PatientProfileHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const PatientCircularProfilePic(),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                sharedPrefs.name ?? "Patient Name",
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Wrap(
                alignment: WrapAlignment.start,
                children: [
                  SizedBox(
                    // width: MediaQuery.of(context).size.width * 0.4,
                    child: Text(
                      'UHID: ${sharedPrefs.id}',
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                        height: 1.5,
                      ),
                    ),
                  ),
                  SizedBox(
                    // width: MediaQuery.of(context).size.width * 0.3,
                    child: Text(
                      'JATYA ID: ${sharedPrefs.patientId}',
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        overflow: TextOverflow.clip,
                        color: Colors.grey,
                        height: 1.5,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
