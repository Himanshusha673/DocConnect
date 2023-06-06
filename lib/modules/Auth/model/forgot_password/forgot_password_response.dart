// {
//     "status": 200,
//     "data": {
//         "validationId": "87dfef968d757fe8a6934d61f5b0d752c28f6e23cfe4cda8109fe605940cd8ff70a4e4a06202fd968bb68925daf8834a606a3c9ee38a65a2d6a644bd96fb853b259d52ff3c6928c2ed3534ee3200fbfc008c57b49477663d3d6b0455ed67fcc1e0771aef",
//         "otp": "379621"
//     }
// }

// To parse this JSON data, do
//
//     final forgotPasswordResponse = forgotPasswordResponseFromJson(jsonString);

import 'dart:convert';

ForgotPasswordResponse forgotPasswordResponseFromJson(String str) => ForgotPasswordResponse.fromJson(json.decode(str));

String forgotPasswordResponseToJson(ForgotPasswordResponse data) => json.encode(data.toJson());

class ForgotPasswordResponse {
  ForgotPasswordResponse({
    required this.status,
    required this.data,
  });

  int status;
  Data data;

  factory ForgotPasswordResponse.fromJson(Map<String, dynamic> json) => ForgotPasswordResponse(
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
    required this.validationId,
    // required this.otp,
  });

  String validationId;
  // String otp;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        validationId: json["validationId"],
        // otp: json["otp"],
      );

  Map<String, dynamic> toJson() => {
        "validationId": validationId,
        // "otp": otp,
      };
}
