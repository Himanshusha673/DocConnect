// To parse this JSON data, do
//
//     final doctorDetailResponse = doctorDetailResponseFromJson(jsonString);

import 'dart:convert';

DoctorDetailResponse doctorDetailResponseFromJson(String str) => DoctorDetailResponse.fromJson(json.decode(str));

String doctorDetailResponseToJson(DoctorDetailResponse data) => json.encode(data.toJson());

class DoctorDetailResponse {
  int status;
  Data data;

  DoctorDetailResponse({
    required this.status,
    required this.data,
  });

  factory DoctorDetailResponse.fromJson(Map<String, dynamic> json) => DoctorDetailResponse(
        status: json["status"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
      };
}

class Data {
  DoctorDetail doctor;
  List<DoctorWorkingHour> workingHours;

  Data({
    required this.doctor,
    required this.workingHours,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        doctor: DoctorDetail.fromJson(json["doctor"]),
        workingHours: List<DoctorWorkingHour>.from(json["workingHours"].map((x) => DoctorWorkingHour.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "doctor": doctor.toJson(),
        "workingHours": List<dynamic>.from(workingHours.map((x) => x.toJson())),
      };
}

class DoctorDetail {
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

  DoctorDetail({
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

  factory DoctorDetail.fromJson(Map<String, dynamic> json) => DoctorDetail(
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

class DoctorWorkingHour {
  String id;
  String doctorId;
  String weekday;
  DateTime startTime;
  DateTime endTime;

  DoctorWorkingHour({
    required this.id,
    required this.doctorId,
    required this.weekday,
    required this.startTime,
    required this.endTime,
  });

  factory DoctorWorkingHour.fromJson(Map<String, dynamic> json) => DoctorWorkingHour(
        id: json["id"],
        doctorId: json["doctorId"],
        weekday: json["weekday"],
        startTime: DateTime.parse(json["startTime"]),
        endTime: DateTime.parse(json["endTime"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "doctorId": doctorId,
        "weekday": weekday,
        "startTime": startTime.toIso8601String(),
        "endTime": endTime.toIso8601String(),
      };
}
// {
//     "status": 200,
//     "data": {
//         "doctor": {
//             "id": "69c7a370-78ed-4c41-82e0-5887ebcfbfe6",
//             "userId": "f1f584d6-0cd1-45bb-8795-3a6667e4b921",
//             "clinicId": "d6ef3294-9e79-415c-8adf-0f031dee5c2a",
//             "qualification": "Central Research Assistant",
//             "licenseNumber": "5484c1d5-2f79-4e9b-b38f-e1a163e3b070",
//             "onlineFees": "753.88",
//             "inPersonFees": "460.79",
//             "createdAt": "2023-05-05T13:25:52.334Z",
//             "updatedAt": "2023-05-05T13:25:52.334Z",
//             "description": "Quisquam officia nobis suscipit. Illo eum quas praesentium nemo maiores. Corporis cumque est reprehenderit velit deserunt. Et recusandae culpa debitis in temporibus vitae exercitationem cupiditate corrupti. Rem soluta molestiae incidunt accusamus.",
//             "specialisation": "aspernatur"
//         },
//         "workingHours": [
//             {
//                 "id": "e53661ce-4451-4150-b29b-6f0c00e549e7",
//                 "doctorId": "69c7a370-78ed-4c41-82e0-5887ebcfbfe6",
//                 "weekday": "SUNDAY",
//                 "startTime": "1970-01-01T13:25:52.343Z",
//                 "endTime": "1970-01-01T13:25:52.343Z"
//             },
//             {
//                 "id": "413c4d10-f3da-45d9-9ffe-8fbd74f54336",
//                 "doctorId": "69c7a370-78ed-4c41-82e0-5887ebcfbfe6",
//                 "weekday": "THURSDAY",
//                 "startTime": "1970-01-01T13:25:52.343Z",
//                 "endTime": "1970-01-01T13:25:52.343Z"
//             },
//             {
//                 "id": "5c203a18-a308-4d28-a89b-3e58645346fe",
//                 "doctorId": "69c7a370-78ed-4c41-82e0-5887ebcfbfe6",
//                 "weekday": "FRIDAY",
//                 "startTime": "1970-01-01T13:25:52.343Z",
//                 "endTime": "1970-01-01T13:25:52.343Z"
//             },
//             {
//                 "id": "bab3ea85-d8c1-4a1c-8b24-c37ceb3a2708",
//                 "doctorId": "69c7a370-78ed-4c41-82e0-5887ebcfbfe6",
//                 "weekday": "MONDAY",
//                 "startTime": "1970-01-01T13:25:52.343Z",
//                 "endTime": "1970-01-01T13:25:52.343Z"
//             },
//             {
//                 "id": "c4ed1e55-1a64-4be0-bc39-b31752271503",
//                 "doctorId": "69c7a370-78ed-4c41-82e0-5887ebcfbfe6",
//                 "weekday": "SATURDAY",
//                 "startTime": "1970-01-01T13:25:52.343Z",
//                 "endTime": "1970-01-01T13:25:52.343Z"
//             },
//             {
//                 "id": "c2b05408-5f0e-4390-b65f-1e29d3116aca",
//                 "doctorId": "69c7a370-78ed-4c41-82e0-5887ebcfbfe6",
//                 "weekday": "WEDNESDAY",
//                 "startTime": "1970-01-01T13:25:52.343Z",
//                 "endTime": "1970-01-01T13:25:52.343Z"
//             },
//             {
//                 "id": "10920fe1-edbc-4df6-a7cf-68b4e4c6fdeb",
//                 "doctorId": "69c7a370-78ed-4c41-82e0-5887ebcfbfe6",
//                 "weekday": "WEDNESDAY",
//                 "startTime": "1970-01-01T13:25:52.343Z",
//                 "endTime": "1970-01-01T13:25:52.343Z"
//             }
//         ]
//     }
// }