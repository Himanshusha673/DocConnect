// {
//   "otp": "125972",
//   "validationId": "3f63388ab66c9d0ec9ea47c569d6aad0221d9aca13b2a22f2d7424f6768ea30a915615b63c804960d2ff3926d6e71dbc637316b1bee49191b0735543c455f628e13f569e8ba039728e1f2669d734c6c75756b85e0b719897d39d45101ef66375",
//   "password": "sunil123456"
// }

// To parse this JSON data, do
//
//     final verifyPasswordRequest = verifyPasswordRequestFromJson(jsonString);

import 'dart:convert';

VerifyForgotPasswordRequest verifyPasswordRequestFromJson(String str) => VerifyForgotPasswordRequest.fromJson(json.decode(str));

String verifyPasswordRequestToJson(VerifyForgotPasswordRequest data) => json.encode(data.toJson());

class VerifyForgotPasswordRequest {
  VerifyForgotPasswordRequest({
    required this.otp,
    required this.validationId,
    required this.password,
  });

  String otp;
  String validationId;
  String password;

  factory VerifyForgotPasswordRequest.fromJson(Map<String, dynamic> json) => VerifyForgotPasswordRequest(
        otp: json["otp"],
        validationId: json["validationId"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "otp": otp,
        "validationId": validationId,
        "password": password,
      };
}
