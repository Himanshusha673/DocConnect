// To parse this JSON data, do
//
//     final postVaccineRequest = postVaccineRequestFromJson(jsonString);
// {
//   "patientId": "1431c238-a504-43e2-a225-0fdccf802b5b",
//   "clinicId": "2108e19b-2f25-4a23-9417-af6ac68d09f9",
//   "vaccinationName": "vaccine1",
//   "vaccinationDate": "2023-04-27T09:53:23.421Z",
//   "url": ""
// }
import 'dart:convert';

PostVaccineRequest postVaccineRequestFromJson(String str) => PostVaccineRequest.fromJson(json.decode(str));

String postVaccineRequestToJson(PostVaccineRequest data) => json.encode(data.toJson());

class PostVaccineRequest {
  String patientId;
  String clinicId;
  String vaccinationName;
  DateTime vaccinationDate;
  String url;

  PostVaccineRequest({
    required this.patientId,
    required this.clinicId,
    required this.vaccinationName,
    required this.vaccinationDate,
    required this.url,
  });

  factory PostVaccineRequest.fromJson(Map<String, dynamic> json) => PostVaccineRequest(
        patientId: json["patientId"],
        clinicId: json["clinicId"],
        vaccinationName: json["vaccinationName"],
        vaccinationDate: DateTime.parse(json["vaccinationDate"]),
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "patientId": patientId,
        "clinicId": clinicId,
        "vaccinationName": vaccinationName,
        "vaccinationDate": vaccinationDate.toIso8601String(),
        "url": url,
      };
}
