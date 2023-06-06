//
// {
// "name": "sunil",
// "email": "sunil@jatyatech.com"
// }

// To parse this JSON data, do
//
//     final forgotPasswordRequest = forgotPasswordRequestFromJson(jsonString);

import 'dart:convert';

ForgotPasswordRequest forgotPasswordRequestFromJson(String str) => ForgotPasswordRequest.fromJson(json.decode(str));

String forgotPasswordRequestToJson(ForgotPasswordRequest data) => json.encode(data.toJson());

class ForgotPasswordRequest {
  ForgotPasswordRequest({
    required this.name,
    required this.email,
  });

  String name;
  String email;

  factory ForgotPasswordRequest.fromJson(Map<String, dynamic> json) => ForgotPasswordRequest(
        name: json["name"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
      };
}
