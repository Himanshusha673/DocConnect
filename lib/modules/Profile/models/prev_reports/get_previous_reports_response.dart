// To parse this JSON data, do
//
//     final getPreviousReportsResponse = getPreviousReportsResponseFromJson(jsonString);

import 'dart:convert';

GetPreviousReportsResponse getPreviousReportsResponseFromJson(String str) => GetPreviousReportsResponse.fromJson(json.decode(str));

String getPreviousReportsResponseToJson(GetPreviousReportsResponse data) => json.encode(data.toJson());

class GetPreviousReportsResponse {
  String message;
  bool success;
  List<ReportDatum> data;
  dynamic error;

  GetPreviousReportsResponse({
    required this.message,
    required this.success,
    required this.data,
    this.error,
  });

  factory GetPreviousReportsResponse.fromJson(Map<String, dynamic> json) => GetPreviousReportsResponse(
        message: json["message"],
        success: json["success"],
        data: List<ReportDatum>.from(json["data"].map((x) => ReportDatum.fromJson(x))),
        error: json["error"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "error": error,
      };
}

class ReportDatum {
  String id;
  String patientId;
  dynamic doctorId;
  String reportName;
  DateTime reportDate;
  String url;

  ReportDatum({
    required this.id,
    required this.patientId,
    this.doctorId,
    required this.reportName,
    required this.reportDate,
    required this.url,
  });

  factory ReportDatum.fromJson(Map<String, dynamic> json) => ReportDatum(
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
