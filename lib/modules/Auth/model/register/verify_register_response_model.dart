// {
//     "status": 200,
//     "data": {
//         "registerSuccess": true
//     }
// }

// To parse this JSON data, do
//
//     final verifyRegisterResponse = verifyRegisterResponseFromJson(jsonString);

import 'dart:convert';

VerifyRegisterResponse verifyRegisterResponseFromJson(String str) => VerifyRegisterResponse.fromJson(json.decode(str));

String verifyRegisterResponseToJson(VerifyRegisterResponse data) => json.encode(data.toJson());

class VerifyRegisterResponse {
  VerifyRegisterResponse({
    required this.status,
    required this.data,
  });

  int status;
  Data data;

  factory VerifyRegisterResponse.fromJson(Map<String, dynamic> json) => VerifyRegisterResponse(
        status: json["status"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.registerSuccess,
  });

  bool registerSuccess;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        registerSuccess: json["registerSuccess"],
      );

  Map<String, dynamic> toJson() => {
        "registerSuccess": registerSuccess,
      };
}
