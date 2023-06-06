import 'package:flutter/cupertino.dart';

import '../widgets/Orthocare_list_item.dart';


class OrthocareModel {
  String? title;
  String? date;
  OrthocareModel({
    this.title,
    this.date,
  });
}


class OrthocareTab extends StatelessWidget {
  final List<OrthocareModel> clinicList2;
  const OrthocareTab({
  super.key,
  required this.clinicList2,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return ClinicListItem(
          clinicModel: clinicList2[index], imageUrls: const [],
        );
      },
      itemCount: clinicList2.length,
    );
  }
}