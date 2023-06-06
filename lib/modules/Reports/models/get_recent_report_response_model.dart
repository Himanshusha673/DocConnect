class GetAllRecentReportsResponse {
  String? message;
  bool? success;
  List<GetRecentReportsData>? data;
  String? error;

  GetAllRecentReportsResponse(
      {this.message, this.success, this.data, this.error});

  GetAllRecentReportsResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    success = json['success'];
    if (json['data'] != null) {
      data = <GetRecentReportsData>[];
      json['data'].forEach((v) {
        data!.add(GetRecentReportsData.fromJson(v));
      });
    }
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['success'] = success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['error'] = error;
    return data;
  }
}

class GetRecentReportsData {
  String? id;
  String? patientId;
  String? doctorId;
  String? reportName;
  String? reportDate;
  String? url;

  GetRecentReportsData(
      {this.id,
      this.patientId,
      this.doctorId,
      this.reportName,
      this.reportDate,
      this.url});

  GetRecentReportsData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    patientId = json['patientId'];
    doctorId = json['doctorId'];
    reportName = json['reportName'];
    reportDate = json['reportDate'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['patientId'] = patientId;
    data['doctorId'] = doctorId;
    data['reportName'] = reportName;
    data['reportDate'] = reportDate;
    data['url'] = url;
    return data;
  }
}
