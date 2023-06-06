// To parse this JSON data, do
//
//     final shareAppointmentResponse = shareAppointmentResponseFromJson(jsonString);

import 'dart:convert';

ShareAppointmentResponse shareAppointmentResponseFromJson(String str) => ShareAppointmentResponse.fromJson(json.decode(str));

String shareAppointmentResponseToJson(ShareAppointmentResponse data) => json.encode(data.toJson());

class ShareAppointmentResponse {
  int status;
  String message;
  Data data;

  ShareAppointmentResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory ShareAppointmentResponse.fromJson(Map<String, dynamic> json) => ShareAppointmentResponse(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  String appointmentId;
  String clinicId;

  Data({
    required this.appointmentId,
    required this.clinicId,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        appointmentId: json["appointmentId"],
        clinicId: json["clinicId"],
      );

  Map<String, dynamic> toJson() => {
        "appointmentId": appointmentId,
        "clinicId": clinicId,
      };
}
