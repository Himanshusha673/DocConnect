// To parse this JSON data, do
//
//     final patientFromUserIdResponse = patientFromUserIdResponseFromJson(jsonString);

import 'dart:convert';

PatientFromUserIdResponse patientFromUserIdResponseFromJson(String str) => PatientFromUserIdResponse.fromJson(json.decode(str));

String patientFromUserIdResponseToJson(PatientFromUserIdResponse data) => json.encode(data.toJson());

class PatientFromUserIdResponse {
  String message;
  bool success;
  Data data;
  dynamic error;

  PatientFromUserIdResponse({
    required this.message,
    required this.success,
    required this.data,
    this.error,
  });

  factory PatientFromUserIdResponse.fromJson(Map<String, dynamic> json) => PatientFromUserIdResponse(
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
  Patient patient;
  List<Allergy> allergies;

  Data({
    required this.patient,
    required this.allergies,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        patient: Patient.fromJson(json["patient"]),
        allergies: List<Allergy>.from(json["allergies"].map((x) => Allergy.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "patient": patient.toJson(),
        "allergies": List<dynamic>.from(allergies.map((x) => x.toJson())),
      };
}

class Allergy {
  String id;
  String patientId;
  List<String> medicineAllergies;
  List<String> foodAllergies;
  List<String> petAllergies;
  String other;

  Allergy({
    required this.id,
    required this.patientId,
    required this.medicineAllergies,
    required this.foodAllergies,
    required this.petAllergies,
    required this.other,
  });

  factory Allergy.fromJson(Map<String, dynamic> json) => Allergy(
        id: json["id"],
        patientId: json["patientId"],
        medicineAllergies: List<String>.from(json["medicineAllergies"].map((x) => x)),
        foodAllergies: List<String>.from(json["foodAllergies"].map((x) => x)),
        petAllergies: List<String>.from(json["petAllergies"].map((x) => x)),
        other: json["other"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "patientId": patientId,
        "medicineAllergies": List<dynamic>.from(medicineAllergies.map((x) => x)),
        "foodAllergies": List<dynamic>.from(foodAllergies.map((x) => x)),
        "petAllergies": List<dynamic>.from(petAllergies.map((x) => x)),
        "other": other,
      };
}

class Patient {
  String id;
  String gender;
  String maritalStatus;
  DateTime createdAt;
  bool isArchived;
  DateTime updatedAt;
  String userId;

  Patient({
    required this.id,
    required this.gender,
    required this.maritalStatus,
    required this.createdAt,
    required this.isArchived,
    required this.updatedAt,
    required this.userId,
  });

  factory Patient.fromJson(Map<String, dynamic> json) => Patient(
        id: json["id"],
        gender: json["gender"],
        maritalStatus: json["maritalStatus"],
        createdAt: DateTime.parse(json["createdAt"]),
        isArchived: json["isArchived"],
        updatedAt: DateTime.parse(json["updatedAt"]),
        userId: json["userId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "gender": gender,
        "maritalStatus": maritalStatus,
        "createdAt": createdAt.toIso8601String(),
        "isArchived": isArchived,
        "updatedAt": updatedAt.toIso8601String(),
        "userId": userId,
      };
}
