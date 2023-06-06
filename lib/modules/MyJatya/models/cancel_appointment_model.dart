class CancelAppointmentResponse {
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

  CancelAppointmentResponse(
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

  CancelAppointmentResponse.fromJson(Map<String, dynamic> json) {
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
