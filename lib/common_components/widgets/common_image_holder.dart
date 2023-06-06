import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:doc_connect/utils/constants/color_konstants.dart';

class ReportHolder extends StatelessWidget {
  String? url = " ";
  String value = " ";
  XFile? reportDoc;

  ReportHolder({super.key, this.url, required this.value, this.reportDoc});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            height: 280,
            width: 358,
            decoration: BoxDecoration(
              color: Colors.white10,
              border: Border.all(color: Colors.grey),
            ),
            padding: const EdgeInsets.only(left: 32, right: 32, bottom: 20),
            child: reportDoc == null
                ? Image.network(url!)
                : Image.file(File(reportDoc!.path)),
          ),
          Positioned(
            top: 218,
            left: 1.5,
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 1,
                    offset: const Offset(0, -1), // changes position of shadow
                  ),
                ],
                borderRadius: BorderRadius.circular(5),
                color: const Color.fromRGBO(248, 248, 248, 1),
              ),
              height: 60,
              width: 343,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        value,
                        textAlign: TextAlign.justify,
                        style: const TextStyle(
                            color: Colors.black87, fontSize: 16),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.delete_rounded,
                            color: ColorKonstants.primarySwatch,
                          )),
                    ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
