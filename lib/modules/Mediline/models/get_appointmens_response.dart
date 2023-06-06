// To parse this JSON data, do
//
//     final getAppointmentResponse = getAppointmentResponseFromJson(jsonString);

import 'dart:convert';

GetAppointmentResponse getAppointmentResponseFromJson(String str) => GetAppointmentResponse.fromJson(json.decode(str));

String getAppointmentResponseToJson(GetAppointmentResponse data) => json.encode(data.toJson());

class GetAppointmentResponse {
  int status;
  String message;
  List<AppointmentDetail> data;

  GetAppointmentResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory GetAppointmentResponse.fromJson(Map<String, dynamic> json) => GetAppointmentResponse(
        status: json["status"],
        message: json["message"],
        data: List<AppointmentDetail>.from(json["data"].map((x) => AppointmentDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class AppointmentDetail {
  Appointment appointment;
  dynamic patient;
  dynamic doctor;

  AppointmentDetail({
    required this.appointment,
    this.patient,
    this.doctor,
  });

  factory AppointmentDetail.fromJson(Map<String, dynamic> json) => AppointmentDetail(
        appointment: Appointment.fromJson(json["appointment"]),
        patient: json["patient"],
        doctor: json["doctor"],
      );

  Map<String, dynamic> toJson() => {
        "appointment": appointment.toJson(),
        "patient": patient,
        "doctor": doctor,
      };
}

class Appointment {
  String id;
  String chiefComplaint;
  String investigation;
  String examination;
  String provisionalDiagnosis;
  String clinicId;
  String patientId;
  String doctorId;
  dynamic preclinicalId;
  String title;
  String consultationDetailsId;
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
  dynamic doctorWorkingHoursId;

  Appointment({
    required this.id,
    required this.chiefComplaint,
    required this.investigation,
    required this.examination,
    required this.provisionalDiagnosis,
    required this.clinicId,
    required this.patientId,
    required this.doctorId,
    this.preclinicalId,
    required this.title,
    required this.consultationDetailsId,
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
    this.doctorWorkingHoursId,
  });

  factory Appointment.fromJson(Map<String, dynamic> json) => Appointment(
        id: json["id"],
        chiefComplaint: json["chiefComplaint"] ?? "",
        investigation: json["investigation"] ?? "",
        examination: json["examination"] ?? "",
        provisionalDiagnosis: json["provisionalDiagnosis"] ?? "",
        clinicId: json["clinicId"] ?? "",
        patientId: json["patientId"] ?? "",
        doctorId: json["doctorId"] ?? "",
        preclinicalId: json["preclinicalId"] ?? "",
        title: json["title"] ?? "",
        consultationDetailsId: json["consultationDetailsId"] ?? "",
        startTime: DateTime.parse(json["startTime"]),
        speciality: json["speciality"] ?? "",
        isEmergency: json["isEmergency"] ?? "",
        priorityType: json["priorityType"] ?? "",
        status: json["status"] ?? "",
        paymentStatus: json["paymentStatus"] ?? "",
        endTime: DateTime.parse(json["endTime"]),
        createdAt: DateTime.parse(json["createdAt"]),
        appointmentType: json["appointmentType"] ?? "",
        appointmentDate: DateTime.parse(json["appointmentDate"]),
        doctorWorkingHoursId: json["doctorWorkingHoursId"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "chiefComplaint": chiefComplaint,
        "investigation": investigation,
        "examination": examination,
        "provisionalDiagnosis": provisionalDiagnosis,
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
