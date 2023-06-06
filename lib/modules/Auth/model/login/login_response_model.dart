// To parse this JSON data, do
//
//     final loginResponseModel = loginResponseModelFromJson(jsonString);

import 'dart:convert';

import '../../../NewAppointment/model/get_clinic_detail_response.dart';

LoginResponseModel loginResponseModelFromJson(String str) => LoginResponseModel.fromJson(json.decode(str));

String loginResponseModelToJson(LoginResponseModel data) => json.encode(data.toJson());

class LoginResponseModel {
  int status;
  Data data;

  LoginResponseModel({
    required this.status,
    required this.data,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) => LoginResponseModel(
        status: json["status"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
      };
}

class Data {
  String authToken;
  User user;

  Data({
    required this.authToken,
    required this.user,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        authToken: json["authToken"],
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "authToken": authToken,
        "user": user.toJson(),
      };
}

class User {
  String id;
  String email;
  String name;
  List<Role> roles;
  bool isDeactive;
  bool isMfaActive;
  String? phoneNumber;
  Patient patient;

  User({
    required this.id,
    required this.email,
    required this.name,
    required this.roles,
    required this.isDeactive,
    required this.isMfaActive,
    required this.phoneNumber,
    required this.patient,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        email: json["email"],
        name: json["name"],
        roles: List<Role>.from(json["roles"].map((x) => Role.fromJson(x))),
        isDeactive: json["isDeactive"],
        isMfaActive: json["isMfaActive"],
        phoneNumber: json["phoneNumber"] ?? "",
        patient: Patient.fromJson(json["patient"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "name": name,
        "roles": List<dynamic>.from(roles.map((x) => x.toJson())),
        "isDeactive": isDeactive,
        "isMfaActive": isMfaActive,
        "phoneNumber": phoneNumber,
        "patient": patient.toJson(),
      };
}

class Patient {
  String id;
  String userId;
  DateTime createdAt;
  DateTime updatedAt;
  String gender;
  String maritalStatus;
  String height;
  String weight;
  bool isArchived;
  List<PatientCategory> patientCategory;

  Patient({
    required this.id,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
    required this.gender,
    required this.maritalStatus,
    required this.height,
    required this.weight,
    required this.isArchived,
    required this.patientCategory,
  });

  factory Patient.fromJson(Map<String, dynamic> json) => Patient(
        id: json["id"],
        userId: json["userId"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        gender: json["gender"] ?? "",
        maritalStatus: json["maritalStatus"] ?? "",
        height: json["height"] ?? "",
        weight: json["weight"] ?? "",
        isArchived: json["isArchived"],
        patientCategory: List<PatientCategory>.from(json["patientCategory"].map((x) => PatientCategory.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "gender": gender,
        "maritalStatus": maritalStatus,
        "height": height,
        "weight": weight,
        "isArchived": isArchived,
        "patientCategory": List<dynamic>.from(patientCategory.map((x) => x.toJson())),
      };
}

class PatientCategory {
  String id;
  String patientId;
  String clinicId;
  String category;
  Clinic clinic;

  PatientCategory({
    required this.id,
    required this.patientId,
    required this.clinicId,
    required this.category,
    required this.clinic,
  });

  factory PatientCategory.fromJson(Map<String, dynamic> json) => PatientCategory(
        id: json["id"],
        patientId: json["patientId"],
        clinicId: json["clinicId"],
        category: json["category"],
        clinic: Clinic.fromJson(json["clinic"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "patientId": patientId,
        "clinicId": clinicId,
        "category": category,
        "clinic": clinic.toJson(),
      };
}

class Role {
  String id;
  String userId;
  String role;

  Role({
    required this.id,
    required this.userId,
    required this.role,
  });

  factory Role.fromJson(Map<String, dynamic> json) => Role(
        id: json["id"],
        userId: json["userId"],
        role: json["role"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "role": role,
      };
}
// {
//     "status": 200,
//     "data": {
//         "authToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InRlc3RQYXRpZW50QGdtYWlsLmNvbSIsInJzbiI6IjQxMzZjZDBiLWQ5MGItNGFmNy1iNDg1LTVkMWRlZDhkYjI1NiIsImlhdCI6MTY4MzMyNzA3OCwiZXhwIjoxNjgzNDk5ODc4fQ.6apo9Pe0yr6IhTMBObiEeu2jjJdJMy3x1xLJEqfbZkE",
//         "user": {
//             "id": "10",
//             "email": "testPatient@gmail.com",
//             "name": "testPatient",
//             "roles": [
//                 {
//                     "id": "d6965a43-f22f-498a-adae-3e8b48bc2e36",
//                     "userId": "10",
//                     "role": "PATIENT"
//                 }
//             ],
//             "isDeactive": false,
//             "isMfaActive": false,
//             "phoneNumber": "+91 7475618291",
//             "clinicsOwned": [],
//             "doctor": [],
//             "clinicAdmin": null,
//             "clinicAssistant": null,
//             "receptionist": null,
//             "patient": {
//                 "id": "11",
//                 "userId": "10",
//                 "createdAt": "2021-12-03T05:40:44.408Z",
//                 "updatedAt": "2022-12-03T05:40:44.408Z",
//                 "gender": "MALE",
//                 "maritalStatus": "UNMARRIED",
//                 "height": "180",
//                 "weight": "80",
//                 "isArchived": false,
//                 "patientCategory": [
//                     {
//                         "id": "68439864-edd8-435e-b7bc-a7dde337787e",
//                         "patientId": "11",
//                         "clinicId": "2",
//                         "category": "General",
//                         "clinic": {
//                             "id": "2",
//                             "name": "Health Clinic",
//                             "logo": "https://img.freepik.com/free-vector/flat-hand-drawn-hospital-reception-scene_52683-54613.jpg?w=1380&t=st=1683208199~exp=1683208799~hmac=5b93249d3aab8f0d39fe0435fcf68cb5ca0f7cc37a3d0744965902e5f03b556a",
//                             "themeColor": "#30686e",
//                             "address": "0917 O Conner Estates",
//                             "city": "East Jarretmouth",
//                             "state": "Georgia",
//                             "country": "USA",
//                             "zipCode": "17839",
//                             "emailId": "testClinic@gmail.com",
//                             "mobileNumbers": [
//                                 "+91 8462524194"
//                             ],
//                             "description": "Iste molestiae incidunt aliquam possimus reprehenderit eum corrupti. Deleniti modi voluptatem nostrum ut esse",
//                             "websiteURL": "https://remarkable-hackwork.info",
//                             "twitterHandle": "Nettie_Zboncak40",
//                             "socialMediaHandle": "Jeanne98",
//                             "meta": "Maxime vel numquam quibusdam. Dignissimos ex molestias quos aut molestiae quam nihil occaecati maiores.",
//                             "isClosed": false,
//                             "geoLocation": "-30.9501,-154.0226",
//                             "speciality": [
//                                 "Orthopedics, Cardiology, general "
//                             ],
//                             "ownerId": null,
//                             "onboardedBy": "1",
//                             "subscriptionId": 55422
//                         }
//                     }
//                 ]
//             }
//         }
//     }
// }