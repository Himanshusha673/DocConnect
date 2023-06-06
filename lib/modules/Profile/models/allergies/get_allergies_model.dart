class AllergieModel {
  String? message;
  bool? success;
  List<AllergyDataModel>? data;
  String? error;

  AllergieModel({this.message, this.success, this.data, this.error});

  AllergieModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    success = json['success'];
    if (json['data'] != null) {
      data = <AllergyDataModel>[];
      json['data'].forEach((v) {
        data!.add(AllergyDataModel.fromJson(v));
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

class AllergyDataModel {
  String? id;
  String? patientId;
  List<String>? foodAllergies;
  List<String>? medicineAllergies;
  List<String>? petAllergies;
  String? other;

  AllergyDataModel(
      {this.id,
      this.patientId,
      this.foodAllergies,
      this.medicineAllergies,
      this.petAllergies,
      this.other});

  AllergyDataModel.fromJson(Map<String, dynamic> json) {
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
