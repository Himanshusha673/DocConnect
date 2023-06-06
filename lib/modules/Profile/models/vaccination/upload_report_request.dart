// To parse this JSON data, do
//
//     final uploadreportRequest = uploadreportRequestFromJson(jsonString);

import 'dart:convert';
import 'dart:io';

UploadreportRequest uploadreportRequestFromJson(String str) => UploadreportRequest.fromJson(json.decode(str));

String uploadreportRequestToJson(UploadreportRequest data) => json.encode(data.toJson());

Future<String> convertReportFiletoString({required File file}) async {
  final bytes = await file.readAsBytes();
  final binaryString = bytes.map((byte) => byte.toRadixString(2).padLeft(8, '0')).join();
  return binaryString;
}

class UploadreportRequest {
  String file;

  UploadreportRequest({
    required this.file,
  });

  factory UploadreportRequest.fromJson(Map<String, dynamic> json) => UploadreportRequest(
        file: json["file"],
      );

  Map<String, dynamic> toJson() => {
        "file": file,
      };
}
