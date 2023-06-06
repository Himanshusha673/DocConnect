import 'package:flutter/cupertino.dart';
import 'package:doc_connect/modules/Reports/widgets/neurowell_list_item.dart';

class NeurowellModel {
  String? title;
  String? date;
  NeurowellModel({
    this.title,
    this.date,
  });
}

class NeuroWellTab extends StatelessWidget {
  final List<NeurowellModel> clinicList1;
  const NeuroWellTab({
    super.key,
    required this.clinicList1,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return ClinicListItem(
          clinicModel: clinicList1[index],
          imageUrls: const [],
        );
      },
      itemCount: clinicList1.length,
    );
  }
}
