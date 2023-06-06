// {
//     "status": 200,
//     "data": {
//         "validationId": "fbfadb4f0b4dc2f4fa0012281d546396435dcbc10d72d81573de618ca50ec1db2b246723e53466db7ff18896c53a723a02a162245edccf0d0a29aef8062275f1d2a98023393637518b1f093820edc3203184bd5b1d06aaa1dd5711959be1e46eb966ff5a3edf04a80e2510220f3340dd3759743b514c",
//         "otp": "726074"
//     }
// }
// To parse this JSON data, do
//
//     final registerResponse = registerResponseFromJson(jsonString);

import 'dart:convert';

RegisterResponse registerResponseFromJson(String str) => RegisterResponse.fromJson(json.decode(str));

String registerResponseToJson(RegisterResponse data) => json.encode(data.toJson());

class RegisterResponse {
  RegisterResponse({
    required this.status,
    required this.data,
  });

  int status;
  Data data;

  factory RegisterResponse.fromJson(Map<String, dynamic> json) => RegisterResponse(
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
  });

  String validationId;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        validationId: json["validationId"],
      );

  Map<String, dynamic> toJson() => {
        "validationId": validationId,
      };
}
