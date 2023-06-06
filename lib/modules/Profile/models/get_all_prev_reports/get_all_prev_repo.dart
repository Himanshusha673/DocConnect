class GetAllPrevReportsForSpecificPatient {
  String? message;
  bool? success;
  List<ReportData>? data;
  String? error;

  GetAllPrevReportsForSpecificPatient({this.message, this.success, this.data, this.error});

  GetAllPrevReportsForSpecificPatient.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    success = json['success'];
    if (json['data'] != null) {
      data = <ReportData>[];
      json['data'].forEach((v) {
        data!.add(ReportData.fromJson(v));
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

class ReportData {
  String? id;
  String? patientId;
  String? doctorId;
  String? reportName;
  String? reportDate;
  String? url;

  ReportData({this.id, this.patientId, this.doctorId, this.reportName, this.reportDate, this.url});

  ReportData.fromJson(Map<String, dynamic> json) {
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
