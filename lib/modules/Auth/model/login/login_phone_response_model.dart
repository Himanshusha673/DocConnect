// To parse this JSON data, do
//
//     final loginPhoneResponse = loginPhoneResponseFromJson(jsonString);
// {
//     "status": 200,
//     "data": {
//         "isMfaActive": true,
//         "validationId": "da3394faedfc62b576f21b354da5637c1f53c9cac5ea22e60d468c793c30000b068d53f5bbaa056f289433e2bbbfb4c5bbec40baab75bd029011700e16543284aa9ffa017c2af6682d7499694e5ac548292d948d",
//         "otp": "470817"
//     }
// }
import 'dart:convert';

LoginPhoneResponse loginPhoneResponseFromJson(String str) => LoginPhoneResponse.fromJson(json.decode(str));

String loginPhoneResponseToJson(LoginPhoneResponse data) => json.encode(data.toJson());

class LoginPhoneResponse {
  LoginPhoneResponse({
    required this.status,
    required this.data,
  });

  int status;
  Data data;

  factory LoginPhoneResponse.fromJson(Map<String, dynamic> json) => LoginPhoneResponse(
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
    required this.isMfaActive,
    required this.validationId,
    required this.otp,
  });

  bool isMfaActive;
  String validationId;
  String otp;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        isMfaActive: json["isMfaActive"],
        validationId: json["validationId"],
        otp: json["otp"],
      );

  Map<String, dynamic> toJson() => {
        "isMfaActive": isMfaActive,
        "validationId": validationId,
        "otp": otp,
      };
}
