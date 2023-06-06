class PrescriptionDetails {
  int? status;
  String? message;
  PrescriptionDetailsData? data;

  PrescriptionDetails({this.status, this.message, this.data});

  PrescriptionDetails.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null
        ? PrescriptionDetailsData.fromJson(json['data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class PrescriptionDetailsData {
  Appointment? appointment;
  PatientDetails? patient;
  DoctorDetails? doctor;
  List<PatientCategory>? patientCategory;
  ClinicDetails? clinic;

  PrescriptionDetailsData(
      {this.appointment,
      this.patient,
      this.doctor,
      this.patientCategory,
      this.clinic});

  PrescriptionDetailsData.fromJson(Map<String, dynamic> json) {
    appointment = json['appointment'] != null
        ? Appointment.fromJson(json['appointment'])
        : null;
    patient = json['patient'] != null
        ? PatientDetails.fromJson(json['patient'])
        : null;
    doctor =
        json['doctor'] != null ? DoctorDetails.fromJson(json['doctor']) : null;
    if (json['patientCategory'] != null) {
      patientCategory = <PatientCategory>[];
      json['patientCategory'].forEach((v) {
        patientCategory!.add(PatientCategory.fromJson(v));
      });
    }
    clinic =
        json['clinic'] != null ? ClinicDetails.fromJson(json['clinic']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (appointment != null) {
      data['appointment'] = appointment!.toJson();
    }
    if (patient != null) {
      data['patient'] = patient!.toJson();
    }
    if (doctor != null) {
      data['doctor'] = doctor!.toJson();
    }
    if (patientCategory != null) {
      data['patientCategory'] =
          patientCategory!.map((v) => v.toJson()).toList();
    }
    if (clinic != null) {
      data['clinic'] = clinic!.toJson();
    }
    return data;
  }
}

class Appointment {
  String? id;
  String? clinicId;
  String? patientId;
  String? doctorId;
  String? preclinicalId;
  String? title;
  String? consultationDetailsId;
  String? startTime;
  String? speciality;
  bool? isEmergency;
  String? priorityType;
  String? status;
  String? paymentStatus;
  String? endTime;
  String? createdAt;
  String? appointmentType;
  String? appointmentDate;
  String? doctorWorkingHoursId;

  Appointment(
      {this.id,
      this.clinicId,
      this.patientId,
      this.doctorId,
      this.preclinicalId,
      this.title,
      this.consultationDetailsId,
      this.startTime,
      this.speciality,
      this.isEmergency,
      this.priorityType,
      this.status,
      this.paymentStatus,
      this.endTime,
      this.createdAt,
      this.appointmentType,
      this.appointmentDate,
      this.doctorWorkingHoursId});

  Appointment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    clinicId = json['clinicId'];
    patientId = json['patientId'];
    doctorId = json['doctorId'];
    preclinicalId = json['preclinicalId'];
    title = json['title'];
    consultationDetailsId = json['consultationDetailsId'];
    startTime = json['startTime'];
    speciality = json['speciality'];
    isEmergency = json['isEmergency'];
    priorityType = json['priorityType'];
    status = json['status'];
    paymentStatus = json['paymentStatus'];
    endTime = json['endTime'];
    createdAt = json['createdAt'];
    appointmentType = json['appointmentType'];
    appointmentDate = json['appointmentDate'];
    doctorWorkingHoursId = json['doctorWorkingHoursId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['clinicId'] = clinicId;
    data['patientId'] = patientId;
    data['doctorId'] = doctorId;
    data['preclinicalId'] = preclinicalId;
    data['title'] = title;
    data['consultationDetailsId'] = consultationDetailsId;
    data['startTime'] = startTime;
    data['speciality'] = speciality;
    data['isEmergency'] = isEmergency;
    data['priorityType'] = priorityType;
    data['status'] = status;
    data['paymentStatus'] = paymentStatus;
    data['endTime'] = endTime;
    data['createdAt'] = createdAt;
    data['appointmentType'] = appointmentType;
    data['appointmentDate'] = appointmentDate;
    data['doctorWorkingHoursId'] = doctorWorkingHoursId;
    return data;
  }
}

class PatientDetails {
  UserData? userData;
  PatientDeatilsInfo? patient;
  List<Allergies>? allergies;
  List<PatientCategory>? patientCategory;

  PatientDetails(
      {this.userData, this.patient, this.allergies, this.patientCategory});

  PatientDetails.fromJson(Map<String, dynamic> json) {
    userData =
        json['userData'] != null ? UserData.fromJson(json['userData']) : null;
    patient = json['patient'] != null
        ? PatientDeatilsInfo.fromJson(json['patient'])
        : null;
    if (json['allergies'] != null) {
      allergies = <Allergies>[];
      json['allergies'].forEach((v) {
        allergies!.add(Allergies.fromJson(v));
      });
    }
    if (json['patientCategory'] != null) {
      patientCategory = <PatientCategory>[];
      json['patientCategory'].forEach((v) {
        patientCategory!.add(PatientCategory.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (userData != null) {
      data['userData'] = userData!.toJson();
    }
    if (patient != null) {
      data['patient'] = patient!.toJson();
    }
    if (allergies != null) {
      data['allergies'] = allergies!.map((v) => v.toJson()).toList();
    }
    if (patientCategory != null) {
      data['patientCategory'] =
          patientCategory!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UserData {
  String? id;
  String? name;
  String? email;
  String? phoneNumber;
  String? address;
  String? city;
  String? state;
  String? country;
  String? pinCode;
  String? dateOfBirth;
  String? gender;
  bool? isDeactive;
  bool? isMfaActive;
  String? photo;
  String? createdAt;
  String? updatedAt;
  String? qualification;

  UserData(
      {this.id,
      this.name,
      this.email,
      this.phoneNumber,
      this.address,
      this.city,
      this.state,
      this.country,
      this.pinCode,
      this.dateOfBirth,
      this.gender,
      this.isDeactive,
      this.isMfaActive,
      this.photo,
      this.createdAt,
      this.updatedAt,
      this.qualification});

  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    address = json['address'];
    city = json['city'];
    state = json['state'];
    country = json['country'];
    pinCode = json['pinCode'];
    dateOfBirth = json['dateOfBirth'];
    gender = json['gender'];
    isDeactive = json['isDeactive'];
    isMfaActive = json['isMfaActive'];
    photo = json['photo'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    qualification = json['qualification'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['phoneNumber'] = phoneNumber;
    data['address'] = address;
    data['city'] = city;
    data['state'] = state;
    data['country'] = country;
    data['pinCode'] = pinCode;
    data['dateOfBirth'] = dateOfBirth;
    data['gender'] = gender;
    data['isDeactive'] = isDeactive;
    data['isMfaActive'] = isMfaActive;
    data['photo'] = photo;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['qualification'] = qualification;
    return data;
  }
}

class PatientDeatilsInfo {
  String? id;
  String? gender;
  String? maritalStatus;
  String? createdAt;
  bool? isArchived;
  String? updatedAt;
  String? userId;

  PatientDeatilsInfo(
      {this.id,
      this.gender,
      this.maritalStatus,
      this.createdAt,
      this.isArchived,
      this.updatedAt,
      this.userId});

  PatientDeatilsInfo.fromJson(Map<String, dynamic> json) {
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

class Allergies {
  String? id;
  String? patientId;
  List<String>? medicineAllergies;
  List<String>? foodAllergies;
  List<String>? petAllergies;
  String? other;

  Allergies(
      {this.id,
      this.patientId,
      this.medicineAllergies,
      this.foodAllergies,
      this.petAllergies,
      this.other});

  Allergies.fromJson(Map<String, dynamic> json) {
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

class PatientCategory {
  String? id;
  String? patientId;
  String? clinicId;
  String? category;

  PatientCategory({this.id, this.patientId, this.clinicId, this.category});

  PatientCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    patientId = json['patientId'];
    clinicId = json['clinicId'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['patientId'] = patientId;
    data['clinicId'] = clinicId;
    data['category'] = category;
    return data;
  }
}

class DoctorDetails {
  Doctor? doctor;
  UserData? userData;

  DoctorDetails({this.doctor, this.userData});

  DoctorDetails.fromJson(Map<String, dynamic> json) {
    doctor = json['doctor'] != null ? Doctor.fromJson(json['doctor']) : null;
    userData =
        json['userData'] != null ? UserData.fromJson(json['userData']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (doctor != null) {
      data['doctor'] = doctor!.toJson();
    }
    if (userData != null) {
      data['userData'] = userData!.toJson();
    }
    return data;
  }
}

class Doctor {
  String? id;
  String? userId;
  String? clinicId;
  String? qualification;
  String? licenseNumber;
  String? onlineFees;
  String? inPersonFees;
  String? createdAt;
  String? updatedAt;
  String? description;
  String? specialisation;

  Doctor(
      {this.id,
      this.userId,
      this.clinicId,
      this.qualification,
      this.licenseNumber,
      this.onlineFees,
      this.inPersonFees,
      this.createdAt,
      this.updatedAt,
      this.description,
      this.specialisation});

  Doctor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    clinicId = json['clinicId'];
    qualification = json['qualification'];
    licenseNumber = json['licenseNumber'];
    onlineFees = json['onlineFees'];
    inPersonFees = json['inPersonFees'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    description = json['description'];
    specialisation = json['specialisation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userId'] = userId;
    data['clinicId'] = clinicId;
    data['qualification'] = qualification;
    data['licenseNumber'] = licenseNumber;
    data['onlineFees'] = onlineFees;
    data['inPersonFees'] = inPersonFees;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['description'] = description;
    data['specialisation'] = specialisation;
    return data;
  }
}

class ClinicDetails {
  String? id;
  String? name;
  String? logo;
  String? themeColor;
  String? address;
  String? city;
  String? state;
  String? country;
  String? zipCode;
  String? emailId;
  List<String>? mobileNumbers;
  String? description;
  String? websiteURL;
  String? twitterHandle;
  String? socialMediaHandle;
  String? meta;
  bool? isClosed;
  String? geoLocation;
  List<String>? speciality;
  String? type;
  String? ownerId;
  String? onboardedBy;
  int? subscriptionId;

  ClinicDetails(
      {this.id,
      this.name,
      this.logo,
      this.themeColor,
      this.address,
      this.city,
      this.state,
      this.country,
      this.zipCode,
      this.emailId,
      this.mobileNumbers,
      this.description,
      this.websiteURL,
      this.twitterHandle,
      this.socialMediaHandle,
      this.meta,
      this.isClosed,
      this.geoLocation,
      this.speciality,
      this.type,
      this.ownerId,
      this.onboardedBy,
      this.subscriptionId});

  ClinicDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    logo = json['logo'];
    themeColor = json['themeColor'];
    address = json['address'];
    city = json['city'];
    state = json['state'];
    country = json['country'];
    zipCode = json['zipCode'];
    emailId = json['emailId'];
    mobileNumbers = json['mobileNumbers'].cast<String>();
    description = json['description'];
    websiteURL = json['websiteURL'];
    twitterHandle = json['twitterHandle'];
    socialMediaHandle = json['socialMediaHandle'];
    meta = json['meta'];
    isClosed = json['isClosed'];
    geoLocation = json['geoLocation'];
    speciality = json['speciality'].cast<String>();
    type = json['type'];
    ownerId = json['ownerId'];
    onboardedBy = json['onboardedBy'];
    subscriptionId = json['subscriptionId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['logo'] = logo;
    data['themeColor'] = themeColor;
    data['address'] = address;
    data['city'] = city;
    data['state'] = state;
    data['country'] = country;
    data['zipCode'] = zipCode;
    data['emailId'] = emailId;
    data['mobileNumbers'] = mobileNumbers;
    data['description'] = description;
    data['websiteURL'] = websiteURL;
    data['twitterHandle'] = twitterHandle;
    data['socialMediaHandle'] = socialMediaHandle;
    data['meta'] = meta;
    data['isClosed'] = isClosed;
    data['geoLocation'] = geoLocation;
    data['speciality'] = speciality;
    data['type'] = type;
    data['ownerId'] = ownerId;
    data['onboardedBy'] = onboardedBy;
    data['subscriptionId'] = subscriptionId;
    return data;
  }
}
