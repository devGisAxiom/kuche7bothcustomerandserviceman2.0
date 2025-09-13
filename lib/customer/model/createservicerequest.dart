class CreateServiceRequest {
  String? status;
  int? errorCode;
  String? message;

  CreateServiceRequest({this.status, this.errorCode, this.message});

  CreateServiceRequest.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    errorCode = json['error_code'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['status'] = status;
    data['error_code'] = errorCode;
    data['message'] = message;
    return data;
  }
}
