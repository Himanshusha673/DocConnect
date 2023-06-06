// To parse this JSON data, do
//
//     final postReportRequest = postReportRequestFromJson(jsonString);

import 'dart:convert';

PostReportRequest postReportRequestFromJson(String str) => PostReportRequest.fromJson(json.decode(str));

String postReportRequestToJson(PostReportRequest data) => json.encode(data.toJson());

class PostReportRequest {
  String patientId;
  String? doctorId;
  String reportName;
  DateTime reportDate;
  String url;

  PostReportRequest({
    required this.patientId,
    this.doctorId,
    required this.reportName,
    required this.reportDate,
    required this.url,
  });

  factory PostReportRequest.fromJson(Map<String, dynamic> json) => PostReportRequest(
        patientId: json["patientId"],
        // doctorId: json["doctorId"],
        reportName: json["reportName"],
        reportDate: DateTime.parse(json["reportDate"]),
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "patientId": patientId,
        // "doctorId": doctorId,
        "reportName": reportName,
        "reportDate": "${reportDate.toIso8601String()}Z",
        "url": url,
      };
}
