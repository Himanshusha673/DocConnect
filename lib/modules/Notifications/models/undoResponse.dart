class UndoResponseData {
  String? message;
  bool? success;
  String? error;

  UndoResponseData({this.message, this.success, this.error});

  UndoResponseData.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    success = json['success'];
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['success'] = success;
    data['error'] = error;
    return data;
  }
}
