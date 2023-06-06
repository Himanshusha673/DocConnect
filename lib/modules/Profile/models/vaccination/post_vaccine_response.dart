// To parse this JSON data, do
//
//     final postVaccineResponse = postVaccineResponseFromJson(jsonString);
// {
//     "message": "vaccination created successfully",
//     "success": true,
//     "data": {
//         "id": "5c9712a6-d342-4f91-bcfb-6d6df3b88d62",
//         "patientId": "1431c238-a504-43e2-a225-0fdccf802b5b",
//         "clinicId": "2108e19b-2f25-4a23-9417-af6ac68d09f9",
//         "vaccinationName": "vaccine1",
//         "vaccinationDate": "2023-04-27T09:53:23.421Z",
//         "url": ""
//     },
//     "error": null
// }
import 'dart:convert';

PostVaccineResponse postVaccineResponseFromJson(String str) => PostVaccineResponse.fromJson(json.decode(str));

String postVaccineResponseToJson(PostVaccineResponse data) => json.encode(data.toJson());

class PostVaccineResponse {
  String message;
  bool success;
  Data data;
  dynamic error;

  PostVaccineResponse({
    required this.message,
    required this.success,
    required this.data,
    this.error,
  });

  factory PostVaccineResponse.fromJson(Map<String, dynamic> json) => PostVaccineResponse(
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
  String clinicId;
  String vaccinationName;
  DateTime vaccinationDate;
  String url;

  Data({
    required this.id,
    required this.patientId,
    required this.clinicId,
    required this.vaccinationName,
    required this.vaccinationDate,
    required this.url,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        patientId: json["patientId"],
        clinicId: json["clinicId"],
        vaccinationName: json["vaccinationName"],
        vaccinationDate: DateTime.parse(json["vaccinationDate"]),
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "patientId": patientId,
        "clinicId": clinicId,
        "vaccinationName": vaccinationName,
        "vaccinationDate": vaccinationDate.toIso8601String(),
        "url": url,
      };
}
