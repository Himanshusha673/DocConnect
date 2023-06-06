// {
//     "status": 200,
//     "data": {
//         "passwordReset": true
//     }
// }

// To parse this JSON data, do
//
//     final verifyPasswordResponse = verifyPasswordResponseFromJson(jsonString);

import 'dart:convert';

VerifyForgotPasswordResponse verifyPasswordResponseFromJson(String str) => VerifyForgotPasswordResponse.fromJson(json.decode(str));

String verifyPasswordResponseToJson(VerifyForgotPasswordResponse data) => json.encode(data.toJson());

class VerifyForgotPasswordResponse {
  VerifyForgotPasswordResponse({
    required this.status,
    required this.data,
  });

  int status;
  Data data;

  factory VerifyForgotPasswordResponse.fromJson(Map<String, dynamic> json) => VerifyForgotPasswordResponse(
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
    required this.passwordReset,
  });

  bool passwordReset;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        passwordReset: json["passwordReset"],
      );

  Map<String, dynamic> toJson() => {
        "passwordReset": passwordReset,
      };
}
