class GetAllPrecriptionResposnse {
  String? message;
  bool? success;
  List<GetAllPrescriptionData>? data;
  String? error;

  GetAllPrecriptionResposnse(
      {this.message, this.success, this.data, this.error});

  GetAllPrecriptionResposnse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    success = json['success'];
    if (json['data'] != null) {
      data = <GetAllPrescriptionData>[];
      json['data'].forEach((v) {
        data!.add(GetAllPrescriptionData.fromJson(v));
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

class GetAllPrescriptionData {
  String? id;
  String? patientId;
  String? appointmentId;
  String? chiefComplaint;
  String? investigation;
  String? examination;
  String? provisionalDiagnosis;
  String? createdDate;
  List<Medicines>? medicines;

  GetAllPrescriptionData(
      {this.id,
      this.patientId,
      this.appointmentId,
      this.chiefComplaint,
      this.investigation,
      this.examination,
      this.provisionalDiagnosis,
      this.createdDate,
      this.medicines});

  GetAllPrescriptionData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    patientId = json['patientId'];
    appointmentId = json['appointmentId'];
    chiefComplaint = json['chiefComplaint'];
    investigation = json['investigation'];
    examination = json['examination'];
    provisionalDiagnosis = json['provisionalDiagnosis'];
    createdDate = json['createdDate'];
    if (json['medicines'] != null) {
      medicines = <Medicines>[];
      json['medicines'].forEach((v) {
        medicines!.add(Medicines.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['patientId'] = patientId;
    data['appointmentId'] = appointmentId;
    data['chiefComplaint'] = chiefComplaint;
    data['investigation'] = investigation;
    data['examination'] = examination;
    data['provisionalDiagnosis'] = provisionalDiagnosis;
    data['createdDate'] = createdDate;
    if (medicines != null) {
      data['medicines'] = medicines!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Medicines {
  String? id;
  String? prescriptionId;
  String? medicineName;
  String? dose;
  String? time;
  int? quantity;
  String? duration;
  String? route;
  String? meal;
  String? comments;

  Medicines(
      {this.id,
      this.prescriptionId,
      this.medicineName,
      this.dose,
      this.time,
      this.quantity,
      this.duration,
      this.route,
      this.meal,
      this.comments});

  Medicines.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    prescriptionId = json['prescriptionId'];
    medicineName = json['medicineName'];
    dose = json['dose'];
    time = json['time'];
    quantity = json['quantity'];
    duration = json['duration'];
    route = json['route'];
    meal = json['meal'];
    comments = json['comments'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['prescriptionId'] = prescriptionId;
    data['medicineName'] = medicineName;
    data['dose'] = dose;
    data['time'] = time;
    data['quantity'] = quantity;
    data['duration'] = duration;
    data['route'] = route;
    data['meal'] = meal;
    data['comments'] = comments;
    return data;
  }
}
