// To parse this JSON data, do
//
//     final vaccinationsResponse = vaccinationsResponseFromJson(jsonString);

// {
//     "message": "vaccination fetched successfully",
//     "success": true,
//     "data": [
//         {
//             "id": "19444fbd-9f4d-442d-93d7-f75dab4ae0dc",
//             "patientId": "1431c238-a504-43e2-a225-0fdccf802b5b",
//             "clinicId": "fa977109-c421-439f-a4ca-643f07f7c61d",
//             "vaccinationName": "quae",
//             "vaccinationDate": "2022-08-06T11:07:31.017Z",
//             "url": "https://loremflickr.com/640/480"
//         }
//     ],
//     "error": null
// }
import 'dart:convert';

VaccinationsResponse vaccinationsResponseFromJson(String str) => VaccinationsResponse.fromJson(json.decode(str));

String vaccinationsResponseToJson(VaccinationsResponse data) => json.encode(data.toJson());

class VaccinationsResponse {
  String message;
  bool success;
  List<Datum> data;
  dynamic error;

  VaccinationsResponse({
    required this.message,
    required this.success,
    required this.data,
    this.error,
  });

  factory VaccinationsResponse.fromJson(Map<String, dynamic> json) => VaccinationsResponse(
        message: json["message"],
        success: json["success"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        error: json["error"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "error": error,
      };
}

class Datum {
  String id;
  String patientId;
  String clinicId;
  String vaccinationName;
  DateTime vaccinationDate;
  String url;

  Datum({
    required this.id,
    required this.patientId,
    required this.clinicId,
    required this.vaccinationName,
    required this.vaccinationDate,
    required this.url,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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
