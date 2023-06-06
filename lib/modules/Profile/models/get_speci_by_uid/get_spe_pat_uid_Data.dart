class GetSpecificPatientresponseByUid {
  String? message;
  bool? success;
  GetSpecificPatientDataByUid? data;
  String? error;

  GetSpecificPatientresponseByUid(
      {this.message, this.success, this.data, this.error});

  GetSpecificPatientresponseByUid.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    success = json['success'];
    data = json['data'] != null
        ? GetSpecificPatientDataByUid.fromJson(json['data'])
        : null;
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['success'] = success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['error'] = error;
    return data;
  }
}

class GetSpecificPatientDataByUid {
  String? userData;
  GetSpecificPatientinfoDataByUid? patient;
  List<GetSpecificPatientAllergydataByUid>? allergies;

  GetSpecificPatientDataByUid({this.userData, this.patient, this.allergies});

  GetSpecificPatientDataByUid.fromJson(Map<String, dynamic> json) {
    userData = json['userData'];
    patient = json['patient'] != null
        ? GetSpecificPatientinfoDataByUid.fromJson(json['patient'])
        : null;
    if (json['allergies'] != null) {
      allergies = <GetSpecificPatientAllergydataByUid>[];
      json['allergies'].forEach((v) {
        allergies!.add(GetSpecificPatientAllergydataByUid.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userData'] = userData;
    if (patient != null) {
      data['patient'] = patient!.toJson();
    }
    if (allergies != null) {
      data['allergies'] = allergies!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GetSpecificPatientinfoDataByUid {
  String? id;
  String? gender;
  String? maritalStatus;
  String? createdAt;
  bool? isArchived;
  String? updatedAt;
  String? userId;

  GetSpecificPatientinfoDataByUid(
      {this.id,
      this.gender,
      this.maritalStatus,
      this.createdAt,
      this.isArchived,
      this.updatedAt,
      this.userId});

  GetSpecificPatientinfoDataByUid.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    gender = json['gender'];
    maritalStatus = json['maritalStatus'];
    createdAt = json['createdAt'];
    isArchived = json['isArchived'];
    updatedAt = json['updatedAt'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['gender'] = gender;
    data['maritalStatus'] = maritalStatus;
    data['createdAt'] = createdAt;
    data['isArchived'] = isArchived;
    data['updatedAt'] = updatedAt;
    data['userId'] = userId;
    return data;
  }
}

class GetSpecificPatientAllergydataByUid {
  String? id;
  String? patientId;
  List<String>? medicineAllergies;
  List<String>? foodAllergies;
  List<String>? petAllergies;
  String? other;

  GetSpecificPatientAllergydataByUid(
      {this.id,
      this.patientId,
      this.medicineAllergies,
      this.foodAllergies,
      this.petAllergies,
      this.other});

  GetSpecificPatientAllergydataByUid.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    patientId = json['patientId'];
    medicineAllergies = json['medicineAllergies'].cast<String>();
    foodAllergies = json['foodAllergies'].cast<String>();
    petAllergies = json['petAllergies'].cast<String>();
    other = json['other'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['patientId'] = patientId;
    data['medicineAllergies'] = medicineAllergies;
    data['foodAllergies'] = foodAllergies;
    data['petAllergies'] = petAllergies;
    data['other'] = other;
    return data;
  }
}
