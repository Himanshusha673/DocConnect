class DownloadPrescriptionDetails {
  String? message;
  bool? success;
  String? data;
  String? error;

  DownloadPrescriptionDetails(
      {this.message, this.success, this.data, this.error});

  DownloadPrescriptionDetails.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    success = json['success'];
    data = json['data'];
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['success'] = success;
    data['data'] = this.data;
    data['error'] = error;
    return data;
  }
}
