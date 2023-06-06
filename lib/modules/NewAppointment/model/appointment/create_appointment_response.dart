// To parse this JSON data, do
//
//     final createAppointmentResponse = createAppointmentResponseFromJson(jsonString);

import 'dart:convert';

CreateAppointmentResponse createAppointmentResponseFromJson(String str) => CreateAppointmentResponse.fromJson(json.decode(str));

String createAppointmentResponseToJson(CreateAppointmentResponse data) => json.encode(data.toJson());

class CreateAppointmentResponse {
  String id;
  String clinicId;
  String patientId;
  String doctorId;
  dynamic preclinicalId;
  String title;
  dynamic consultationDetailsId;
  DateTime startTime;
  String speciality;
  bool isEmergency;
  String priorityType;
  String status;
  String paymentStatus;
  DateTime endTime;
  DateTime createdAt;
  String appointmentType;
  DateTime appointmentDate;
  String doctorWorkingHoursId;

  CreateAppointmentResponse({
    required this.id,
    required this.clinicId,
    required this.patientId,
    required this.doctorId,
    this.preclinicalId,
    required this.title,
    this.consultationDetailsId,
    required this.startTime,
    required this.speciality,
    required this.isEmergency,
    required this.priorityType,
    required this.status,
    required this.paymentStatus,
    required this.endTime,
    required this.createdAt,
    required this.appointmentType,
    required this.appointmentDate,
    required this.doctorWorkingHoursId,
  });

  factory CreateAppointmentResponse.fromJson(Map<String, dynamic> json) => CreateAppointmentResponse(
        id: json["id"],
        clinicId: json["clinicId"],
        patientId: json["patientId"],
        doctorId: json["doctorId"],
        preclinicalId: json["preclinicalId"],
        title: json["title"],
        consultationDetailsId: json["consultationDetailsId"],
        startTime: DateTime.parse(json["startTime"]),
        speciality: json["speciality"],
        isEmergency: json["isEmergency"],
        priorityType: json["priorityType"],
        status: json["status"],
        paymentStatus: json["paymentStatus"],
        endTime: DateTime.parse(json["endTime"]),
        createdAt: DateTime.parse(json["createdAt"]),
        appointmentType: json["appointmentType"],
        appointmentDate: DateTime.parse(json["appointmentDate"]),
        doctorWorkingHoursId: json["doctorWorkingHoursId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "clinicId": clinicId,
        "patientId": patientId,
        "doctorId": doctorId,
        "preclinicalId": preclinicalId,
        "title": title,
        "consultationDetailsId": consultationDetailsId,
        "startTime": startTime.toIso8601String(),
        "speciality": speciality,
        "isEmergency": isEmergency,
        "priorityType": priorityType,
        "status": status,
        "paymentStatus": paymentStatus,
        "endTime": endTime.toIso8601String(),
        "createdAt": createdAt.toIso8601String(),
        "appointmentType": appointmentType,
        "appointmentDate": appointmentDate.toIso8601String(),
        "doctorWorkingHoursId": doctorWorkingHoursId,
      };
}
