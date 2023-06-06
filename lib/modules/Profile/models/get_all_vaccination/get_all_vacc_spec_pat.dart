class GetAllvaccinationForSpecificPatient {
  String? message;
  bool? success;
  List<GetAllVaccinationData>? data;
  String? error;

  GetAllvaccinationForSpecificPatient(
      {this.message, this.success, this.data, this.error});

  GetAllvaccinationForSpecificPatient.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    success = json['success'];
    if (json['data'] != null) {
      data = <GetAllVaccinationData>[];
      json['data'].forEach((v) {
        data!.add(GetAllVaccinationData.fromJson(v));
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

class GetAllVaccinationData {
  String? id;
  String? patientId;
  String? clinicId;
  String? vaccinationName;
  String? vaccinationDate;
  String? url;

  GetAllVaccinationData(
      {this.id,
      this.patientId,
      this.clinicId,
      this.vaccinationName,
      this.vaccinationDate,
      this.url});

  GetAllVaccinationData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    patientId = json['patientId'];
    clinicId = json['clinicId'];
    vaccinationName = json['vaccinationName'];
    vaccinationDate = json['vaccinationDate'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['patientId'] = patientId;
    data['clinicId'] = clinicId;
    data['vaccinationName'] = vaccinationName;
    data['vaccinationDate'] = vaccinationDate;
    data['url'] = url;
    return data;
  }
}
