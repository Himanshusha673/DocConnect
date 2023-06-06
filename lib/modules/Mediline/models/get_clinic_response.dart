// To parse this JSON data, do
//
//     final getAllClinicResopnse = getAllClinicResopnseFromJson(jsonString);

import 'dart:convert';

import '../../NewAppointment/model/get_clinic_detail_response.dart';

GetAllClinicResopnse getAllClinicResopnseFromJson(String str) => GetAllClinicResopnse.fromJson(json.decode(str));

String getAllClinicResopnseToJson(GetAllClinicResopnse data) => json.encode(data.toJson());

class GetAllClinicResopnse {
  bool success;
  String message;
  List<Datum> data;

  GetAllClinicResopnse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory GetAllClinicResopnse.fromJson(Map<String, dynamic> json) => GetAllClinicResopnse(
        success: json["success"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Clinic clinic;
  List<WorkingHour> workingHours;

  Datum({
    required this.clinic,
    required this.workingHours,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        clinic: Clinic.fromJson(json["clinic"]),
        workingHours: List<WorkingHour>.from(json["workingHours"].map((x) => WorkingHour.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "clinic": clinic.toJson(),
        "workingHours": List<dynamic>.from(workingHours.map((x) => x.toJson())),
      };
}

class WorkingHour {
  String clinicId;
  Weekday weekday;
  DateTime openingTime;
  DateTime closingTime;

  WorkingHour({
    required this.clinicId,
    required this.weekday,
    required this.openingTime,
    required this.closingTime,
  });

  factory WorkingHour.fromJson(Map<String, dynamic> json) => WorkingHour(
        clinicId: json["clinicId"],
        weekday: weekdayValues.map[json["weekday"]]!,
        openingTime: DateTime.parse(json["openingTime"]),
        closingTime: DateTime.parse(json["closingTime"]),
      );

  Map<String, dynamic> toJson() => {
        "clinicId": clinicId,
        "weekday": weekdayValues.reverse[weekday],
        "openingTime": openingTime.toIso8601String(),
        "closingTime": closingTime.toIso8601String(),
      };
}

enum Weekday { FRIDAY, WEDNESDAY, SATURDAY, MONDAY, SUNDAY, THURSDAY, TUESDAY }

final weekdayValues = EnumValues({
  "FRIDAY": Weekday.FRIDAY,
  "MONDAY": Weekday.MONDAY,
  "SATURDAY": Weekday.SATURDAY,
  "SUNDAY": Weekday.SUNDAY,
  "THURSDAY": Weekday.THURSDAY,
  "TUESDAY": Weekday.TUESDAY,
  "WEDNESDAY": Weekday.WEDNESDAY
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
// {
//     "success": true,
//     "message": "null",
//     "data": [
//         {
//             "clinic": {
//                 "id": "19b0ed84-a850-4e57-b373-757af7b5b63a",
//                 "name": "Yundt Inc",
//                 "logo": "https://loremflickr.com/640/480",
//                 "themeColor": "#6b5d41",
//                 "address": "411 Mueller Underpass",
//                 "city": "North Shanny",
//                 "state": "California",
//                 "country": "Bahamas",
//                 "zipCode": "81318",
//                 "emailId": "Lon67@yahoo.com",
//                 "mobileNumbers": [
//                     "+91 9326685810"
//                 ],
//                 "description": "Iusto asperiores minus id unde perferendis atque. Tempora reiciendis nobis ipsam aspernatur nemo sint error aspernatur hic. Cupiditate nam quasi rem ratione dolore.",
//                 "websiteURL": "https://angry-rear.name",
//                 "twitterHandle": "Dion78",
//                 "socialMediaHandle": "Theresa71",
//                 "meta": "Quibusdam deleniti accusamus tempore et dicta ipsa id consequuntur autem. Tempora eos aliquam sint explicabo earum quis fugiat consequatur.",
//                 "isClosed": false,
//                 "geoLocation": "76.9281, 134.5387",
//                 "speciality": [
//                     "Hat",
//                     "kilogram",
//                     "redundant"
//                 ],
//                 "ownerId": null,
//                 "onboardedBy": "cf53e090-8925-4767-b157-f3d405a845e6",
//                 "subscriptionId": 81002
//             },
//             "workingHours": [
//                 {
//                     "clinicId": "19b0ed84-a850-4e57-b373-757af7b5b63a",
//                     "weekday": "FRIDAY",
//                     "openingTime": "1970-01-01T13:11:29.195Z",
//                     "closingTime": "1970-01-01T13:11:29.195Z"
//                 },
//                 {
//                     "clinicId": "19b0ed84-a850-4e57-b373-757af7b5b63a",
//                     "weekday": "WEDNESDAY",
//                     "openingTime": "1970-01-01T13:11:29.195Z",
//                     "closingTime": "1970-01-01T13:11:29.195Z"
//                 },
//                 {
//                     "clinicId": "19b0ed84-a850-4e57-b373-757af7b5b63a",
//                     "weekday": "WEDNESDAY",
//                     "openingTime": "1970-01-01T13:11:29.195Z",
//                     "closingTime": "1970-01-01T13:11:29.195Z"
//                 },
//                 {
//                     "clinicId": "19b0ed84-a850-4e57-b373-757af7b5b63a",
//                     "weekday": "SATURDAY",
//                     "openingTime": "1970-01-01T13:11:29.195Z",
//                     "closingTime": "1970-01-01T13:11:29.195Z"
//                 },
//                 {
//                     "clinicId": "19b0ed84-a850-4e57-b373-757af7b5b63a",
//                     "weekday": "MONDAY",
//                     "openingTime": "1970-01-01T13:11:29.195Z",
//                     "closingTime": "1970-01-01T13:11:29.195Z"
//                 },
//                 {
//                     "clinicId": "19b0ed84-a850-4e57-b373-757af7b5b63a",
//                     "weekday": "MONDAY",
//                     "openingTime": "1970-01-01T13:11:29.195Z",
//                     "closingTime": "1970-01-01T13:11:29.195Z"
//                 },
//                 {
//                     "clinicId": "19b0ed84-a850-4e57-b373-757af7b5b63a",
//                     "weekday": "WEDNESDAY",
//                     "openingTime": "1970-01-01T13:11:29.195Z",
//                     "closingTime": "1970-01-01T13:11:29.195Z"
//                 }
//             ]
//         },
     
     
   
    // ]
// }