// To parse this JSON data, do
//
//     final shareAppointmentRequest = shareAppointmentRequestFromJson(jsonString);

import 'dart:convert';

ShareAppointmentRequest shareAppointmentRequestFromJson(String str) => ShareAppointmentRequest.fromJson(json.decode(str));

String shareAppointmentRequestToJson(ShareAppointmentRequest data) => json.encode(data.toJson());

class ShareAppointmentRequest {
  String appointmentId;
  String clinicId;
  String patientId;

  ShareAppointmentRequest({
    required this.appointmentId,
    required this.clinicId,
    required this.patientId,
  });

  factory ShareAppointmentRequest.fromJson(Map<String, dynamic> json) => ShareAppointmentRequest(
        appointmentId: json["appointmentId"],
        clinicId: json["clinicId"],
        patientId: json["patientId"],
      );

  Map<String, dynamic> toJson() => {
        "appointmentId": appointmentId,
        "clinicId": clinicId,
        "patientId": patientId,
      };
}
