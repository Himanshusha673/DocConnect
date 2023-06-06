class AllergyUpdateResponse {
  String? message;
  bool? success;
  AllergyUpdateResponseData? data;
  String? error;

  AllergyUpdateResponse({this.message, this.success, this.data, this.error});

  AllergyUpdateResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    success = json['success'];
    data = json['data'] != null
        ? AllergyUpdateResponseData.fromJson(json['data'])
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

class AllergyUpdateResponseData {
  String? id;
  String? patientId;
  List<String>? foodAllergies;
  List<String>? medicineAllergies;
  List<String>? petAllergies;
  String? other;

  AllergyUpdateResponseData(
      {this.id,
      this.patientId,
      this.foodAllergies,
      this.medicineAllergies,
      this.petAllergies,
      this.other});

  AllergyUpdateResponseData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    patientId = json['patientId'];
    foodAllergies = json['foodAllergies'].cast<String>();
    medicineAllergies = json['medicineAllergies'].cast<String>();
    petAllergies = json['petAllergies'].cast<String>();
    other = json['other'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['patientId'] = patientId;
    data['foodAllergies'] = foodAllergies;
    data['medicineAllergies'] = medicineAllergies;
    data['petAllergies'] = petAllergies;
    data['other'] = other;
    return data;
  }
}
