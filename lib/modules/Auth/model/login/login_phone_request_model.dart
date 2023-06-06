// {
//   "phoneNumber": "6363865667"
// }

// To parse this JSON data, do
//
//     final loginPhoneRequestModel = loginPhoneRequestModelFromJson(jsonString);

import 'dart:convert';

LoginPhoneRequestModel loginPhoneRequestModelFromJson(String str) => LoginPhoneRequestModel.fromJson(json.decode(str));

String loginPhoneRequestModelToJson(LoginPhoneRequestModel data) => json.encode(data.toJson());

class LoginPhoneRequestModel {
  LoginPhoneRequestModel({
    required this.phoneNumber,
  });

  String phoneNumber;

  factory LoginPhoneRequestModel.fromJson(Map<String, dynamic> json) => LoginPhoneRequestModel(
        phoneNumber: json["phoneNumber"],
      );

  Map<String, dynamic> toJson() => {
        "phoneNumber": phoneNumber,
      };
}
