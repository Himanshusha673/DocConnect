// ignore_for_file: prefer_const_constructors, unused_import, implementation_imports, unnecessary_import, prefer_const_literals_to_create_immutables, file_names, unused_local_variable, duplicate_ignore, sort_child_properties_last
// REMARK:- NEED TO ADD COMMON TOP TABBAR.
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:doc_connect/modules/MyPrescription/bloc/get_prescription_bloc_bloc.dart';
import 'package:doc_connect/modules/MyPrescription/models/latest_prescription.dart';
import '../../../common_components/widgets/common_drawer.dart';
import '../../../utils/constants/color_konstants.dart';
import '../../../utils/constants/image_konstants.dart';

class Prescription extends StatelessWidget {
  Prescription({super.key, required this.getAllPrescriptionData});
  late GetAllPrescriptionData getAllPrescriptionData;

  String originalText =
      "OD - ONE TIME A DAY, BD - TWO TIMES A DAY, TDS - THREE TIMES A DAY, QID - FOUR TIMES A DAY, HS - NIGHT ONE TIME A DAY, A/D - ONE TIME ALTERNATE DAY, ODA/C - MORNING ONE TIME A DAY EMPTY STOMACH, SOS - EMERGENCY AS AND WHEN NEEDED";

  List<String> boldWords = [
    "OD",
    "BD",
    "TDS",
    "QID",
    "HS",
    "A/D",
    "ODA/C",
    "SOS"
  ];

  RichText buildRichText(String text) {
    List<TextSpan> textSpans = [];
    List<String> words = text.split(' ');

    for (var word in words) {
      var isBold = boldWords.contains(word);
      var textStyle = TextStyle(
        fontSize: 12,
        color: Colors.grey,
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      );

      textSpans.add(TextSpan(text: '$word ', style: textStyle));
    }

    return RichText(text: TextSpan(children: textSpans));
  }

  @override
  Widget build(BuildContext context) {
    var devicesize = MediaQuery.of(context).size;
    return body(context, getAllPrescriptionData);
  }

  Widget body(
      BuildContext context, GetAllPrescriptionData? getAllPrescriptionData) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const CommonDrawer(),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(25.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Text(
                  "PRECLINICAL DETAILS AS OF 01 OCT 2020 10:20 AM",
                  style: TextStyle(fontSize: 14, color: Colors.black45),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                width: 366,
                height: 89,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ColorKonstants.bloodpressureBG,
                    border: Border.all(color: Colors.black, width: 0.2)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 2, horizontal: 4),

                            // REMARK:- NEED TO ADD IMAGE HERE INSTEAD OF TEXT.
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              "BLOOD PRESSURE",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            width: 75,
                          ),
                          Text(
                            "120/89",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              "  mm/Hg",
                              style: TextStyle(
                                  color: Colors.grey.shade800, fontSize: 12),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text(
                              "In the Norm",
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 366,
                height: 89,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ColorKonstants.bloodpressureBG2,
                    border: Border.all(color: Colors.black, width: 0.2)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 2, horizontal: 4),

                            // REMARK:- NEED TO ADD IMAGE HERE INSTEAD OF TEXT.
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              "GLUCOSE",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            width: 75,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 99),
                            child: Text(
                              "97",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              " mg/dl",
                              style: TextStyle(
                                  color: Colors.grey.shade800, fontSize: 12),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text(
                              "In the Norm",
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 366,
                height: 89,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ColorKonstants.bloodpressureBG3,
                    border: Border.all(color: Colors.black, width: 0.2)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 2, horizontal: 4),

                            // REMARK:- NEED TO ADD IMAGE HERE INSTEAD OF TEXT.
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              "BLOOD PRESSURE",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            width: 75,
                          ),
                          Text(
                            "108",
                            style: TextStyle(
                                color: Colors.red, fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              "Beats per min",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 12),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text(
                              "Above the Norm",
                              style: TextStyle(fontSize: 12, color: Colors.red),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child:
                        SvgPicture.asset(ImagesConstants.prescriptionDrawer)),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                    headingRowColor: MaterialStateColor.resolveWith(
                        (states) => ColorKonstants.bloodpressureBG2),
                    border: TableBorder.all(width: 1, color: Colors.black45),
                    columns: [
                      DataColumn(
                          label: SizedBox(
                              width: 100,
                              child: Text(
                                'MEDICINE NAME',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ))), // First column
                      DataColumn(
                          label: Text(
                        'DOSE',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      )),
                      DataColumn(
                          label: Text('TIMES',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black))),
                      DataColumn(
                          label: Text('DURN.',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black))),
                      DataColumn(
                          label: Text('MEAL',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black))),
                      DataColumn(
                          label: Text('ROUTE',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black))),
                      DataColumn(
                          label: Text('QTY',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black))),
                      DataColumn(
                          label: Text('REMARKS',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black))),
                    ],
                    rows: getAllPrescriptionData!.medicines!
                        .map(
                          (medicine) => DataRow(cells: [
                            DataCell(Text(medicine.medicineName ??
                                "FORACORT 1 REPSULES 2 ML")),
                            DataCell(Text(medicine.dose ?? '1 tab')),
                            DataCell(Text(medicine.time ?? 'IBD')),
                            DataCell(Text(medicine.duration ?? '3 days')),
                            DataCell(Text(medicine.meal ?? 'Before Meal')),
                            DataCell(Text(medicine.route ?? 'Inhalation')),
                            DataCell(Text(medicine.quantity.toString())),
                            DataCell(
                                Text(medicine.comments ?? 'Some Comment Here')),
                          ]),
                        )
                        .toList()),
              ),
              SizedBox(
                height: 25,
              ),
              buildRichText(originalText),
              SizedBox(
                height: 25,
              ),
              Text(
                'This consultation is based on the input provided by the patient via online medium. "no physical examination has been performed and all pati advised to visit a doctor for any complications." this opinion cannot be challenged for any medico-legal requirements as agreed upon in terms a conditions on registration."this is a digital copy and it doesnt require physical signature.',
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    "DOCUMENT DIGITALLY SIGNED BY",
                    textAlign: TextAlign.justify,
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text("DR ADITI SHARMA"),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text("MCI# GOES HERE"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
