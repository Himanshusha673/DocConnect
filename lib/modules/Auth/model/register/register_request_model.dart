// {
//   "name": "sunil",
//   "email": "sunil@gmail.com",
//   "password": "sunil123"
// }

// To parse this JSON data, do
//
//     final registerRequest = registerRequestFromJson(jsonString);

import 'dart:convert';

RegisterRequest registerRequestFromJson(String str) => RegisterRequest.fromJson(json.decode(str));

String registerRequestToJson(RegisterRequest data) => json.encode(data.toJson());

class RegisterRequest {
  RegisterRequest({
    required this.name,
    required this.email,
    required this.password,
  });

  String name;
  String email;
  String password;

  factory RegisterRequest.fromJson(Map<String, dynamic> json) => RegisterRequest(
        name: json["name"],
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "password": password,
      };
}
