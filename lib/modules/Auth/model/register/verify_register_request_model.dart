// {
//   "otp": "171414",
//   "validationId": "27ca310c43a5eb08e88838f770788875c11e67674c2a62585684f2cb9fd82b0a588a913e80e0e6ad82277c0287bc9b321c01ef8cee18a6738a4d455e1fa84866ff5f18ccc3e3c1609aea5817a198528605bfa737ac8e82af15db7ce985b4923107f43a77d3020aa01cde26d23eb3ee0816def1afd410"
// }

// To parse this JSON data, do
//
//     final verifyRegisterRequest = verifyRegisterRequestFromJson(jsonString);

import 'dart:convert';

VerifyRegisterRequest verifyRegisterRequestFromJson(String str) => VerifyRegisterRequest.fromJson(json.decode(str));

String verifyRegisterRequestToJson(VerifyRegisterRequest data) => json.encode(data.toJson());

class VerifyRegisterRequest {
  VerifyRegisterRequest({
    required this.otp,
    required this.validationId,
  });

  String otp;
  String validationId;

  factory VerifyRegisterRequest.fromJson(Map<String, dynamic> json) => VerifyRegisterRequest(
        otp: json["otp"],
        validationId: json["validationId"],
      );

  Map<String, dynamic> toJson() => {
        "otp": otp,
        "validationId": validationId,
      };
}
