import 'dart:convert';

GetSlotsResponse getSlotsResponseFromJson(String str) => GetSlotsResponse.fromJson(json.decode(str));

String getSlotsResponseToJson(GetSlotsResponse data) => json.encode(data.toJson());

class GetSlotsResponse {
  int status;
  List<SlotDatum> data;

  GetSlotsResponse({
    required this.status,
    required this.data,
  });

  factory GetSlotsResponse.fromJson(Map<String, dynamic> json) => GetSlotsResponse(
        status: json["status"],
        data: List<SlotDatum>.from(json["data"].map((x) => SlotDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class SlotDatum {
  String id;
  String weekday;
  DateTime startTime;
  DateTime endTime;
  String doctorId;
  DateTime createdAt;
  bool isActive;

  SlotDatum({
    required this.id,
    required this.weekday,
    required this.startTime,
    required this.endTime,
    required this.doctorId,
    required this.createdAt,
    required this.isActive,
  });

  factory SlotDatum.fromJson(Map<String, dynamic> json) => SlotDatum(
        id: json["id"],
        weekday: json["weekday"],
        startTime: DateTime.parse(json["startTime"]),
        endTime: DateTime.parse(json["endTime"]),
        doctorId: json["doctorId"],
        createdAt: DateTime.parse(json["createdAt"]),
        isActive: json["isActive"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "weekday": weekday,
        "startTime": startTime.toIso8601String(),
        "endTime": endTime.toIso8601String(),
        "doctorId": doctorId,
        "createdAt": createdAt.toIso8601String(),
        "isActive": isActive,
      };
}
