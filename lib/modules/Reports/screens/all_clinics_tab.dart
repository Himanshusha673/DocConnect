import 'package:flutter/material.dart';
import 'package:jatya_patient_mobile/modules/Reports/models/clinic_model.dart';
import 'package:jatya_patient_mobile/modules/Reports/widgets/clinic_list_item.dart';


class AllClinicTab extends StatelessWidget {
  final List<AllClinicModel> clinicList;
  const AllClinicTab({
    super.key,
    required this.clinicList,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return ClinicListItem(
          clinicModel: clinicList[index], imageUrls: const [],
        );
      },
      itemCount: clinicList.length,
    );
  }
}
