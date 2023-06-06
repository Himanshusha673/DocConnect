import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jatya_patient_mobile/modules/online_consultation/widgets/doctor_card.dart';

import '../model/doctors_via_location_response.dart';

class DoctorsListWidget extends StatelessWidget {
  final List<AvailableDoctor> doctors;
  final DateTime date;
  const DoctorsListWidget({
    super.key,
    required this.doctors,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${doctors.length} doctors available on ${DateFormat.yMMMEd().format(date)}",
                style: const TextStyle(fontWeight: FontWeight.w700, color: Colors.black54),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Column(
            children: doctors
                .map((e) => DoctorDetailCard(
                      availableDoctor: e,
                      detailCardType: DoctorDetailCardType.newAppointment,
                      selectedDate: date,
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}
