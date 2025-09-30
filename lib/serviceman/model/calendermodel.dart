// class CalenderModel {
//   String? status;
//   int? errorCode;
//   String? message;
//   List<Data>? data;

//   CalenderModel({this.status, this.errorCode, this.message, this.data});

//   CalenderModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     errorCode = json['error_code'];
//     message = json['message'];
//     if (json['data'] != null) {
//       data = <Data>[];
//       json['data'].forEach((v) {
//         data!.add(new Data.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['status'] = this.status;
//     data['error_code'] = this.errorCode;
//     data['message'] = this.message;
//     if (this.data != null) {
//       data['data'] = this.data!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Data {
//   int? id;
//   String? title;
//   String? start;
//   String? brand;
//   int? idBrand;
//   int? idCustomer;
//   String? customer;
//   String? location;
//   String? taskType;
//   String? taskName;
//   String? taskStatus;

//   Data({
//     this.id,
//     this.title,
//     this.start,
//     this.brand,
//     this.idBrand,
//     this.idCustomer,
//     this.customer,
//     this.location,
//     this.taskType,
//     this.taskName,
//     this.taskStatus,
//   });

//   Data.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     title = json['title'];
//     start = json['start'];
//     brand = json['brand'];
//     idBrand = json['id_brand'];
//     idCustomer = json['id_customer'];
//     customer = json['customer'];
//     location = json['location'];
//     taskType = json['task_type'];
//     taskName = json['task_name'];
//     taskStatus = json['task_status'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['title'] = this.title;
//     data['start'] = this.start;
//     data['brand'] = this.brand;
//     data['id_brand'] = this.idBrand;
//     data['id_customer'] = this.idCustomer;
//     data['customer'] = this.customer;
//     data['location'] = this.location;
//     data['task_type'] = this.taskType;
//     data['task_name'] = this.taskName;
//     data['task_status'] = this.taskStatus;
//     return data;
//   }
// }
class CalenderModel {
  String? status;
  int? errorCode;
  String? message;
  List<Data>? data;

  CalenderModel({this.status, this.errorCode, this.message, this.data});

  CalenderModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    errorCode = json['error_code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['error_code'] = this.errorCode;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? title;
  String? start;
  String? brand;
  int? idBrand;
  int? idCustomer;
  String? customer;
  String? location;
  String? taskType;
  String? taskName;
  String? taskStatus;

  Data({
    this.id,
    this.title,
    this.start,
    this.brand,
    this.idBrand,
    this.idCustomer,
    this.customer,
    this.location,
    this.taskType,
    this.taskName,
    this.taskStatus,
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    start = json['start'];
    brand = json['brand'];
    idBrand = json['id_brand'];
    idCustomer = json['id_customer'];
    customer = json['customer'];
    location = json['location'];
    taskType = json['task_type'];
    taskName = json['task_name'];
    taskStatus = json['task_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['start'] = this.start;
    data['brand'] = this.brand;
    data['id_brand'] = this.idBrand;
    data['id_customer'] = this.idCustomer;
    data['customer'] = this.customer;
    data['location'] = this.location;
    data['task_type'] = this.taskType;
    data['task_name'] = this.taskName;
    data['task_status'] = this.taskStatus;
    return data;
  }
}
