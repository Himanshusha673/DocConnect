// To parse this JSON data, do
//
//     final postReportResponse = postReportResponseFromJson(jsonString);

import 'dart:convert';

PostReportResponse postReportResponseFromJson(String str) => PostReportResponse.fromJson(json.decode(str));

String postReportResponseToJson(PostReportResponse data) => json.encode(data.toJson());

class PostReportResponse {
  String message;
  bool success;
  Data data;
  dynamic error;

  PostReportResponse({
    required this.message,
    required this.success,
    required this.data,
    this.error,
  });

  factory PostReportResponse.fromJson(Map<String, dynamic> json) => PostReportResponse(
        message: json["message"],
        success: json["success"],
        data: Data.fromJson(json["data"]),
        error: json["error"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "success": success,
        "data": data.toJson(),
        "error": error,
      };
}

class Data {
  String id;
  String patientId;
  dynamic doctorId;
  String reportName;
  DateTime reportDate;
  String url;

  Data({
    required this.id,
    required this.patientId,
    this.doctorId,
    required this.reportName,
    required this.reportDate,
    required this.url,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        patientId: json["patientId"],
        doctorId: json["doctorId"],
        reportName: json["reportName"],
        reportDate: DateTime.parse(json["reportDate"]),
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "patientId": patientId,
        "doctorId": doctorId,
        "reportName": reportName,
        "reportDate": reportDate.toIso8601String(),
        "url": url,
      };
}
