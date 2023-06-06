// {
//   "otp": "470817",
//   "validationId": "da3394faedfc62b576f21b354da5637c1f53c9cac5ea22e60d468c793c30000b068d53f5bbaa056f289433e2bbbfb4c5bbec40baab75bd029011700e16543284aa9ffa017c2af6682d7499694e5ac548292d948d"
// }

// To parse this JSON data, do
//
//     final mfaPhoneRequest = mfaPhoneRequestFromJson(jsonString);

import 'dart:convert';

MfaPhoneRequest mfaPhoneRequestFromJson(String str) => MfaPhoneRequest.fromJson(json.decode(str));

String mfaPhoneRequestToJson(MfaPhoneRequest data) => json.encode(data.toJson());

class MfaPhoneRequest {
  MfaPhoneRequest({
    required this.otp,
    required this.validationId,
  });

  String otp;
  String validationId;

  factory MfaPhoneRequest.fromJson(Map<String, dynamic> json) => MfaPhoneRequest(
        otp: json["otp"],
        validationId: json["validationId"],
      );

  Map<String, dynamic> toJson() => {
        "otp": otp,
        "validationId": validationId,
      };
}
