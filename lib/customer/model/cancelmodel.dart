class CancelModel {
  String? status;
  int? errorCode;
  String? message;

  CancelModel({this.status, this.errorCode, this.message});

  CancelModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    errorCode = json['error_code'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['error_code'] = this.errorCode;
    data['message'] = this.message;
    return data;
  }
}
