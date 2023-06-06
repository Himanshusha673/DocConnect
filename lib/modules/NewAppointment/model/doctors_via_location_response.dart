// To parse this JSON data, do
//
//     final geoLocationDoctorsResponse = geoLocationDoctorsResponseFromJson(jsonString);

import 'dart:convert';

GeoLocationDoctorsResponse geoLocationDoctorsResponseFromJson(String str) => GeoLocationDoctorsResponse.fromJson(json.decode(str));

String geoLocationDoctorsResponseToJson(GeoLocationDoctorsResponse data) => json.encode(data.toJson());

class GeoLocationDoctorsResponse {
  int status;
  List<AvailableDoctor> data;

  GeoLocationDoctorsResponse({
    required this.status,
    required this.data,
  });

  factory GeoLocationDoctorsResponse.fromJson(Map<String, dynamic> json) => GeoLocationDoctorsResponse(
        status: json["status"],
        data: List<AvailableDoctor>.from(json["data"].map((x) => AvailableDoctor.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class AvailableDoctor {
  Doctor doctor;
  UserData userData;

  AvailableDoctor({
    required this.doctor,
    required this.userData,
  });

  factory AvailableDoctor.fromJson(Map<String, dynamic> json) => AvailableDoctor(
        doctor: Doctor.fromJson(json["doctor"]),
        userData: UserData.fromJson(json["userData"]),
      );

  Map<String, dynamic> toJson() => {
        "doctor": doctor.toJson(),
        "userData": userData.toJson(),
      };
}

class Doctor {
  String id;
  String userId;
  String clinicId;
  String qualification;
  String licenseNumber;
  String onlineFees;
  String inPersonFees;
  DateTime createdAt;
  DateTime updatedAt;
  String description;
  String specialisation;

  Doctor({
    required this.id,
    required this.userId,
    required this.clinicId,
    required this.qualification,
    required this.licenseNumber,
    required this.onlineFees,
    required this.inPersonFees,
    required this.createdAt,
    required this.updatedAt,
    required this.description,
    required this.specialisation,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) => Doctor(
        id: json["id"],
        userId: json["userId"],
        clinicId: json["clinicId"],
        qualification: json["qualification"],
        licenseNumber: json["licenseNumber"],
        onlineFees: json["onlineFees"],
        inPersonFees: json["inPersonFees"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        description: json["description"],
        specialisation: json["specialisation"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "clinicId": clinicId,
        "qualification": qualification,
        "licenseNumber": licenseNumber,
        "onlineFees": onlineFees,
        "inPersonFees": inPersonFees,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "description": description,
        "specialisation": specialisation,
      };
}

class UserData {
  String id;
  String name;
  String email;
  String phoneNumber;
  String address;
  String city;
  String state;
  String country;
  String pinCode;
  DateTime dateOfBirth;
  String gender;
  bool isDeactive;
  bool isMfaActive;
  String photo;
  DateTime createdAt;
  dynamic updatedAt;

  UserData({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.address,
    required this.city,
    required this.state,
    required this.country,
    required this.pinCode,
    required this.dateOfBirth,
    required this.gender,
    required this.isDeactive,
    required this.isMfaActive,
    required this.photo,
    required this.createdAt,
    this.updatedAt,
  });

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        address: json["address"],
        city: json["city"],
        state: json["state"],
        country: json["country"],
        pinCode: json["pinCode"],
        dateOfBirth: DateTime.parse(json["dateOfBirth"]),
        gender: json["gender"],
        isDeactive: json["isDeactive"],
        isMfaActive: json["isMfaActive"],
        photo: json["photo"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "phoneNumber": phoneNumber,
        "address": address,
        "city": city,
        "state": state,
        "country": country,
        "pinCode": pinCode,
        "dateOfBirth": dateOfBirth.toIso8601String(),
        "gender": gender,
        "isDeactive": isDeactive,
        "isMfaActive": isMfaActive,
        "photo": photo,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt,
      };
}
// {
//     "status": 200,
//     "data": [
//         {
//             "doctor": {
//                 "id": "0cb3df2f-273f-46dc-82f8-2724bc83b865",
//                 "userId": "0b9ed073-294c-4fc6-b04a-5244c8140f55",
//                 "clinicId": "0320f9a4-ba8b-4fbf-a0e1-42c0d61eb340",
//                 "qualification": "Lead Communications Liaison",
//                 "licenseNumber": "548e3c5a-f77a-4aa5-8b7f-78751096c99a",
//                 "onlineFees": "183.86",
//                 "inPersonFees": "762.20",
//                 "createdAt": "2023-05-06T11:08:20.625Z",
//                 "updatedAt": "2023-05-06T11:08:20.625Z",
//                 "description": "Ipsum eligendi ratione nam doloremque maxime fuga beatae aut. Ex accusamus possimus. Sit placeat saepe qui explicabo ducimus hic earum esse aliquam. Ipsam dicta est tenetur eligendi. Voluptas delectus dolor natus at. Repellendus at molestiae officiis facilis dicta earum.",
//                 "specialisation": "numquam"
//             },
//             "userData": {
//                 "id": "0b9ed073-294c-4fc6-b04a-5244c8140f55",
//                 "name": "Miss Kristopher McClure",
//                 "email": "Brendan36@hotmail.com",
//                 "phoneNumber": "+91 0083734539",
//                 "address": "796 Estrella Plaza",
//                 "city": "Hectortown",
//                 "state": "Alaska",
//                 "country": "Bahrain",
//                 "pinCode": "82545",
//                 "dateOfBirth": "2023-02-08T22:54:50.608Z",
//                 "gender": "MALE",
//                 "isDeactive": false,
//                 "isMfaActive": false,
//                 "photo": "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/237.jpg",
//                 "createdAt": "2023-05-06T11:08:20.210Z",
//                 "updatedAt": null
//             }
//         }
//     ]
// }