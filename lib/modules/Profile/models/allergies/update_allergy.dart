class AllergyUpdateRequest {
  String? patientId;
  List<String>? medicineAllergies;
  List<String>? foodAllergies;
  List<String>? petAllergies;
  String? other;

  AllergyUpdateRequest(
      {this.patientId,
      this.medicineAllergies,
      this.foodAllergies,
      this.petAllergies,
      this.other = ""});

  AllergyUpdateRequest.fromJson(Map<String, dynamic> json) {
    patientId = json['patientId'];
    medicineAllergies = json['medicineAllergies'].cast<String>();
    foodAllergies = json['foodAllergies'].cast<String>();
    petAllergies = json['petAllergies'].cast<String>();
    other = json['other'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['patientId'] = patientId;
    data['medicineAllergies'] = medicineAllergies;
    data['foodAllergies'] = foodAllergies;
    data['petAllergies'] = petAllergies;
    data['other'] = other ?? "";
    return data;
  }
}
