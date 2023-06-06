// To parse this JSON data, do
//
//     final appointmentRequest = appointmentRequestFromJson(jsonString);

import 'dart:convert';

AppointmentRequest appointmentRequestFromJson(String str) => AppointmentRequest.fromJson(json.decode(str));

String appointmentRequestToJson(AppointmentRequest data) => json.encode(data.toJson());

class AppointmentRequest {
  String clinicId;
  String patientId;
  String doctorId;
  String doctorWorkingHoursId;
  DateTime appointmentDate;
  DateTime startTime;
  String speciality;
  bool isEmergency;
  String priorityType;
  String title;
  String status;
  String paymentStatus;
  DateTime endTime;
  String appointmentType;

  AppointmentRequest({
    required this.clinicId,
    required this.patientId,
    required this.doctorId,
    required this.doctorWorkingHoursId,
    required this.appointmentDate,
    required this.startTime,
    required this.speciality,
    required this.isEmergency,
    required this.priorityType,
    required this.title,
    required this.status,
    required this.paymentStatus,
    required this.endTime,
    required this.appointmentType,
  });

  factory AppointmentRequest.fromJson(Map<String, dynamic> json) => AppointmentRequest(
        clinicId: json["clinicId"],
        patientId: json["patientId"],
        doctorId: json["doctorId"],
        doctorWorkingHoursId: json["doctorWorkingHoursId"],
        appointmentDate: DateTime.parse(json["appointmentDate"]),
        startTime: DateTime.parse(json["startTime"]),
        speciality: json["speciality"],
        isEmergency: json["isEmergency"],
        priorityType: json["priorityType"],
        title: json["title"],
        status: json["status"],
        paymentStatus: json["paymentStatus"],
        endTime: DateTime.parse(json["endTime"]),
        appointmentType: json["appointmentType"],
      );

  Map<String, dynamic> toJson() => {
        "clinicId": clinicId,
        "patientId": patientId,
        "doctorId": doctorId,
        "doctorWorkingHoursId": doctorWorkingHoursId,
        "appointmentDate": appointmentDate.toIso8601String(),
        "startTime": startTime.toIso8601String(),
        "speciality": speciality,
        "isEmergency": isEmergency,
        "priorityType": priorityType,
        "title": title,
        "status": status,
        "paymentStatus": paymentStatus,
        "endTime": endTime.toIso8601String(),
        "appointmentType": appointmentType,
      };
}
