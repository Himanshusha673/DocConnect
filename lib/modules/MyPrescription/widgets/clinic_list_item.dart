// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:doc_connect/modules/MyPrescription/models/latest_prescription.dart';
import 'package:doc_connect/utils/constants/image_konstants.dart';

class ClinicListItem extends StatelessWidget {
  final GetAllPrescriptionData clinicModel;
  const ClinicListItem({
    Key? key,
    required this.clinicModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SizedBox(
        width: 80,
        height: 40,
        child: Stack(children: const [
          Positioned(
            left: 30.0,
            child: CircleAvatar(
              radius: 20.0,
              backgroundImage: AssetImage(ImagesConstants.clinicPlaceholder),
            ),
          ),
          Positioned(
            left: 5.0,
            child: CircleAvatar(
              radius: 20.0,
              backgroundImage: AssetImage(ImagesConstants.circleavatar2),
            ),
          ),
        ]),
      ),
      title: Text(clinicModel.chiefComplaint!),
      subtitle: Text(clinicModel.createdDate!),
    );
  }
}
