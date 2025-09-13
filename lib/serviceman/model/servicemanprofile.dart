class ServiceManProfile {
  String? status;
  int? errorCode;
  String? message;
  Data? data;

  ServiceManProfile({this.status, this.errorCode, this.message, this.data});

  ServiceManProfile.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    errorCode = json['error_code'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['error_code'] = this.errorCode;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? name;
  String? email;
  String? contactNumber;
  int? id;

  Data({this.name, this.email, this.contactNumber, this.id});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    contactNumber = json['contact_number'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['contact_number'] = this.contactNumber;
    data['id'] = this.id;
    return data;
  }
}
