import 'package:flutter/material.dart';
import 'package:doc_connect/modules/Profile/models/get_specific_patient_by_id/get_sprecific_patient_by_id.dart';
import 'package:doc_connect/utils/constants/color_konstants.dart';

class ExpansionList extends StatefulWidget {
  final String question;
  final GetSpecificPatientAllergydata answer;

  const ExpansionList({
    super.key,
    required this.answer,
    required this.question,
  });

  @override
  State<ExpansionList> createState() => _ExpansionListState();
}

class _ExpansionListState extends State<ExpansionList> {
  bool isExapanded = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: () {
            setState(() {
              isExapanded = !isExapanded;
            });
          },
          dense: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                isExapanded ? Icons.arrow_drop_down_rounded : Icons.arrow_right,
                size: 25,
                color: ColorKonstants.primarySwatch,
              ),
              Text(
                widget.question,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ],
          ),
          subtitle: isExapanded
              ? Container(
                  padding: const EdgeInsets.only(left: 5, right: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 1.0, right: 1.0),
                        child: Divider(thickness: 2),
                      ),
                      const Align(
                        alignment: Alignment.topLeft,
                        child: Text('MEDICINES',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: ColorKonstants.textgrey)),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Wrap(
                        spacing: 5.0,
                        runSpacing: 4.0,
                        children: <Widget>[
                          ...(widget.answer.medicineAllergies!).map((option) {
                            return (option !=
                                    widget.answer.medicineAllergies![widget
                                            .answer.medicineAllergies!.length -
                                        1])
                                ? Text("$option,",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black45.withOpacity(0.8)))
                                : Text(option,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color:
                                            Colors.black45.withOpacity(0.8)));
                          }).toList(),
                        ],
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      const Text('FOOD & DAIRY PRODUCTS',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: ColorKonstants.textgrey)),
                      Wrap(
                        spacing: 5.0,
                        runSpacing: 4.0,
                        children: <Widget>[
                          ...(widget.answer.foodAllergies!).map((option) {
                            return (option !=
                                    widget.answer.foodAllergies![
                                        widget.answer.foodAllergies!.length -
                                            1])
                                ? Text("$option,",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black45.withOpacity(0.8)))
                                : Text(option,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color:
                                            Colors.black45.withOpacity(0.8)));
                          }).toList(),
                        ],
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      const Text('PET & FURRY ANIMALS',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: ColorKonstants.textgrey)),
                      Wrap(
                        spacing: 5.0,
                        runSpacing: 4.0,
                        children: <Widget>[
                          ...(widget.answer.petAllergies!).map((option) {
                            return (option !=
                                    widget.answer.petAllergies![
                                        widget.answer.petAllergies!.length - 1])
                                ? Text("$option,",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black45.withOpacity(0.8)))
                                : Text(option,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color:
                                            Colors.black45.withOpacity(0.8)));
                          }).toList(),
                        ],
                      ),
                    ],
                  ),
                )
              : Container(),
        ),
      ],
    );
  }
}
