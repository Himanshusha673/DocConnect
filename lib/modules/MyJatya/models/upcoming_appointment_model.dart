class GetAllAppointmentsResponse {
  int? status;
  String? message;
  List<GetAllAppointmentsData>? data;

  GetAllAppointmentsResponse({this.status, this.message, this.data});

  GetAllAppointmentsResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <GetAllAppointmentsData>[];
      json['data'].forEach((v) {
        data!.add(GetAllAppointmentsData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GetAllAppointmentsData {
  GetAllAppointmentsDataModel? appointment;
  GetAllAppointmentsPatientData? patient;
  GetAllAppointmentsDoctorData? doctor;

  GetAllAppointmentsData({this.appointment, this.patient, this.doctor});

  GetAllAppointmentsData.fromJson(Map<String, dynamic> json) {
    appointment = json['appointment'] != null
        ? GetAllAppointmentsDataModel.fromJson(json['appointment'])
        : null;
    patient = json['patient'] != null
        ? GetAllAppointmentsPatientData.fromJson(json['patient'])
        : null;
    doctor = json['doctor'] != null
        ? GetAllAppointmentsDoctorData.fromJson(json['doctor'])
        : null;
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
    return data;
  }
}

class GetAllAppointmentsDataModel {
  String? id;
  String? chiefComplaint;
  String? investigation;
  String? examination;
  String? provisionalDiagnosis;
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

  GetAllAppointmentsDataModel(
      {this.id,
      this.chiefComplaint,
      this.investigation,
      this.examination,
      this.provisionalDiagnosis,
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

  GetAllAppointmentsDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    chiefComplaint = json['chiefComplaint'];
    investigation = json['investigation'];
    examination = json['examination'];
    provisionalDiagnosis = json['provisionalDiagnosis'];
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
    data['chiefComplaint'] = chiefComplaint;
    data['investigation'] = investigation;
    data['examination'] = examination;
    data['provisionalDiagnosis'] = provisionalDiagnosis;
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

class GetAllAppointmentsPatientData {
  GetAllAppointmentsUserData? userData;
  GetAllAppointmentsPatientData? patient;
  List<GetAllAppointMentAllergies>? allergies;

  GetAllAppointmentsPatientData({this.userData, this.patient, this.allergies});

  GetAllAppointmentsPatientData.fromJson(Map<String, dynamic> json) {
    userData = json['userData'] != null
        ? GetAllAppointmentsUserData.fromJson(json['userData'])
        : null;
    patient = json['patient'] != null
        ? GetAllAppointmentsPatientData.fromJson(json['patient'])
        : null;
    if (json['allergies'] != null) {
      allergies = <GetAllAppointMentAllergies>[];
      json['allergies'].forEach((v) {
        allergies!.add(GetAllAppointMentAllergies.fromJson(v));
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
    return data;
  }
}

class GetAllAppointmentsUserData {
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

  GetAllAppointmentsUserData(
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
      this.updatedAt});

  GetAllAppointmentsUserData.fromJson(Map<String, dynamic> json) {
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
    return data;
  }
}

class GetAllAppointmentsPatientBasicInformation {
  String? id;
  String? gender;
  String? maritalStatus;
  String? createdAt;
  bool? isArchived;
  String? updatedAt;
  String? userId;

  GetAllAppointmentsPatientBasicInformation(
      {this.id,
      this.gender,
      this.maritalStatus,
      this.createdAt,
      this.isArchived,
      this.updatedAt,
      this.userId});

  GetAllAppointmentsPatientBasicInformation.fromJson(
      Map<String, dynamic> json) {
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

class GetAllAppointMentAllergies {
  String? id;
  String? patientId;
  List<String>? medicineAllergies;
  List<String>? foodAllergies;
  List<String>? petAllergies;
  String? other;

  GetAllAppointMentAllergies(
      {this.id,
      this.patientId,
      this.medicineAllergies,
      this.foodAllergies,
      this.petAllergies,
      this.other});

  GetAllAppointMentAllergies.fromJson(Map<String, dynamic> json) {
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

class GetAllAppointmentsDoctorListData {
  GetAllAppointmentsDoctorData? doctor;
  GetAllAppointmentsUserData? userData;

  GetAllAppointmentsDoctorListData({this.doctor, this.userData});

  GetAllAppointmentsDoctorListData.fromJson(Map<String, dynamic> json) {
    doctor = json['doctor'] != null
        ? GetAllAppointmentsDoctorData.fromJson(json['doctor'])
        : null;
    userData = json['userData'] != null
        ? GetAllAppointmentsUserData.fromJson(json['userData'])
        : null;
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

class GetAllAppointmentsDoctorData {
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

  GetAllAppointmentsDoctorData(
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

  GetAllAppointmentsDoctorData.fromJson(Map<String, dynamic> json) {
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
