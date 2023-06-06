import 'package:flutter/material.dart';
import 'package:doc_connect/modules/MyPrescription/models/latest_prescription.dart';
import 'package:doc_connect/modules/MyPrescription/screens/prescription_detail_tabview.dart';
import 'package:doc_connect/modules/MyPrescription/widgets/clinic_list_item.dart';

class AllClinicTab extends StatelessWidget {
  List<GetAllPrescriptionData> prescriptionList;
  AllClinicTab({
    super.key,
    required this.prescriptionList,
  });

  @override
  Widget build(BuildContext context) {
    return prescriptionList.isEmpty
        ? const Center(
            child: Text("No Prescriptions"),
          )
        : ListView.builder(
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PrescriptionDetailTabview(
                        getAllPrescriptionData: prescriptionList[index],
                      ),
                    ),
                  );
                },
                child: ClinicListItem(
                  clinicModel: prescriptionList[index],
                ),
              );
            },
            itemCount: prescriptionList.length,
          );
  }
}
