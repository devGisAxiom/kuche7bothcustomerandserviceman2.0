class Phase1 {
  String? status;
  int? errorCode;
  String? message;
  List<dynamic>? data;
  Phase1({this.status, this.errorCode, this.message, this.data});

  Phase1.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    errorCode = json['error_code']?.toInt();
    message = json['message'];
    data = json['data']?.map((v) => v).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['status'] = this.status;
    data['error_code'] = this.errorCode;
    data['message'] = this.message;
    data['data'] = this.data?.map((v) => v.toJson()).toList();
    return data;
  }
}