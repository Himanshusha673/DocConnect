class PatientUpdateFormModel {
  String? gender;
  String? maritalStatus;
  String? userId;
  String? createdAt;
  String? updatedAt;
  bool? isArchived;
  String? height;
  String? weight;

  PatientUpdateFormModel(
      {this.gender,
      this.maritalStatus,
      this.userId,
      this.createdAt,
      this.updatedAt,
      this.isArchived,
      this.height,
      this.weight});

  PatientUpdateFormModel.fromJson(Map<String, dynamic> json) {
    gender = json['gender'];
    maritalStatus = json['maritalStatus'];
    userId = json['userId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    isArchived = json['isArchived'];
    height = json['height'];
    weight = json['weight'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['gender'] = gender;
    data['maritalStatus'] = maritalStatus;
    data['userId'] = userId;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['isArchived'] = isArchived;
    data['height'] = height;
    data['weight'] = weight;
    return data;
  }
}
