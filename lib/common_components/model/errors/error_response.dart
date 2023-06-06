// {"status":400,"error":"Invalid email, Password should be atleast 8 characters, "}

// To parse this JSON data, do
//
//     final errorResponse = errorResponseFromJson(jsonString);

import 'dart:convert';

ErrorResponse errorResponseFromJson(String str) => ErrorResponse.fromJson(json.decode(str));

String errorResponseToJson(ErrorResponse data) => json.encode(data.toJson());

class ErrorResponse {
  ErrorResponse({
    required this.status,
    required this.error,
  });

  int status;
  String error;

  factory ErrorResponse.fromJson(Map<String, dynamic> json) => ErrorResponse(
        status: json["status"],
        error: json["error"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "error": error,
      };
}
