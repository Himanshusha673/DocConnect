class GetSpecificPatientresponse {
  String message;
  bool success;
  GetSpecificPatientDataById data;
  dynamic error;

  GetSpecificPatientresponse({
    required this.message,
    required this.success,
    required this.data,
    required this.error,
  });

  factory GetSpecificPatientresponse.fromJson(Map<String, dynamic> json) =>
      GetSpecificPatientresponse(
        message: json["message"],
        success: json["success"],
        data: GetSpecificPatientDataById.fromJson(json["data"]),
        error: json["error"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "success": success,
        "data": data.toJson(),
        "error": error,
      };
}

class GetSpecificPatientDataById {
  UserData userData;
  GetSpecificPatientinfoDataById patient;
  List<GetSpecificPatientAllergydata> allergies;

  GetSpecificPatientDataById({
    required this.userData,
    required this.patient,
    required this.allergies,
  });

  factory GetSpecificPatientDataById.fromJson(Map<String, dynamic> json) =>
      GetSpecificPatientDataById(
        userData: UserData.fromJson(json["userData"]),
        patient: GetSpecificPatientinfoDataById.fromJson(json["patient"]),
        allergies: List<GetSpecificPatientAllergydata>.from(json["allergies"]
            .map((x) => GetSpecificPatientAllergydata.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "userData": userData.toJson(),
        "patient": patient.toJson(),
        "allergies": List<dynamic>.from(allergies.map((x) => x.toJson())),
      };
}

class GetSpecificPatientAllergydata {
  String? id;
  String? patientId;
  List<String>? medicineAllergies;
  List<String>? foodAllergies;
  List<String>? petAllergies;
  String? other;

  GetSpecificPatientAllergydata(
      {this.id,
      this.patientId,
      this.medicineAllergies,
      this.foodAllergies,
      this.petAllergies,
      this.other = ""});

  GetSpecificPatientAllergydata.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    patientId = json['patientId'];
    medicineAllergies = json['medicineAllergies'].cast<String>();
    foodAllergies = json['foodAllergies'].cast<String>();
    petAllergies = json['petAllergies'].cast<String>();
    other = json['other'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['patientId'] = patientId;
    data['medicineAllergies'] = medicineAllergies;
    data['foodAllergies'] = foodAllergies;
    data['petAllergies'] = petAllergies;
    data['other'] = other ?? "";
    return data;
  }
}

class GetSpecificPatientinfoDataById {
  String? id;
  String? gender;
  String? maritalStatus;
  String? createdAt;
  bool? isArchived;
  String? updatedAt;
  String? userId;

  GetSpecificPatientinfoDataById(
      {this.id,
      this.gender,
      this.maritalStatus,
      this.createdAt,
      this.isArchived,
      this.updatedAt,
      this.userId});

  GetSpecificPatientinfoDataById.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    gender = json['gender'] ?? "null";
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

class UserData {
  String id;
  String name;
  String email;
  String phoneNumber;
  String address;
  String city;
  String state;
  String country;
  String pinCode;
  DateTime dateOfBirth;
  String gender;
  bool isDeactive;
  bool isMfaActive;
  String photo;
  DateTime createdAt;
  dynamic updatedAt;
  String qualification;

  UserData({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.address,
    required this.city,
    required this.state,
    required this.country,
    required this.pinCode,
    required this.dateOfBirth,
    required this.gender,
    required this.isDeactive,
    required this.isMfaActive,
    required this.photo,
    required this.createdAt,
    required this.updatedAt,
    required this.qualification,
  });

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phoneNumber: json["phoneNumber"] ?? "",
        address: json["address"] ?? "",
        city: json["city"] ?? "",
        state: json["state"] ?? "",
        country: json["country"] ?? "",
        pinCode: json["pinCode"] ?? "",
        dateOfBirth: json["dateOfBirth"] != null
            ? DateTime.parse(json["dateOfBirth"])
            : DateTime.now(),
        gender: json["gender"]??"MALE",
        isDeactive: json["isDeactive"],
        isMfaActive: json["isMfaActive"],
        photo: json["photo"] ?? "",
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] ?? "",
        qualification: json["qualification"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "phoneNumber": phoneNumber,
        "address": address,
        "city": city,
        "state": state,
        "country": country,
        "pinCode": pinCode,
        "dateOfBirth": dateOfBirth.toIso8601String(),
        "gender": gender,
        "isDeactive": isDeactive,
        "isMfaActive": isMfaActive,
        "photo": photo,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt,
        "qualification": qualification,
      };
}
