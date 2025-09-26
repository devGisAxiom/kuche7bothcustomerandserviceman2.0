// class Todaystask {
//   String? status;
//   int? errorCode;
//   String? message;
//   List<Data>? data;

//   Todaystask({this.status, this.errorCode, this.message, this.data});

//   Todaystask.fromJson(Map<String, dynamic> json) {
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
//   String? taskName;
//   String? salesMan;
//   String? taskType;
//   String? taskProduct;
//   String? taskCustomer;
//   String? taskDate;
//   String? taskNote;
//   String? taskStatus;
//   int? taskStatusId;
//   String? taskCustomerNote;
//   String? taskAcceptCustomer;
//   String? taskFeedback;
//   List<Materials>? materials;
//   Customer? customer;
//   Customer? serviceMan;
//   List<SubTasks>? subTasks;

//   Data({
//     this.id,
//     this.taskName,
//     this.salesMan,
//     this.taskType,
//     this.taskProduct,
//     this.taskCustomer,
//     this.taskDate,
//     this.taskNote,
//     this.taskStatus,
//     this.taskStatusId,
//     this.taskCustomerNote,
//     this.taskAcceptCustomer,
//     this.taskFeedback,
//     this.materials,
//     this.customer,
//     this.serviceMan,
//     this.subTasks,
//   });

//   Data.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     taskName = json['task_name'];
//     salesMan = json['sales_man'];
//     taskType = json['task_type'];
//     taskProduct = json['task_product'];
//     taskCustomer = json['task_customer'];
//     taskDate = json['task_date'];
//     taskNote = json['task_note'];
//     taskStatus = json['task_status'];
//     taskStatusId = json['task_status_id'];
//     taskCustomerNote = json['task_customer_note'];
//     taskAcceptCustomer = json['task_accept_customer'];
//     taskFeedback = json['task_feedback'];
//     if (json['materials'] != null) {
//       materials = <Materials>[];
//       json['materials'].forEach((v) {
//         materials!.add(new Materials.fromJson(v));
//       });
//     }
//     customer =
//         json['customer'] != null
//             ? new Customer.fromJson(json['customer'])
//             : null;
//     serviceMan =
//         json['service_man'] != null
//             ? new Customer.fromJson(json['service_man'])
//             : null;
//     if (json['sub_tasks'] != null) {
//       subTasks = <SubTasks>[];
//       json['sub_tasks'].forEach((v) {
//         subTasks!.add(new SubTasks.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['task_name'] = this.taskName;
//     data['sales_man'] = this.salesMan;
//     data['task_type'] = this.taskType;
//     data['task_product'] = this.taskProduct;
//     data['task_customer'] = this.taskCustomer;
//     data['task_date'] = this.taskDate;
//     data['task_note'] = this.taskNote;
//     data['task_status'] = this.taskStatus;
//     data['task_status_id'] = this.taskStatusId;
//     data['task_customer_note'] = this.taskCustomerNote;
//     data['task_accept_customer'] = this.taskAcceptCustomer;
//     data['task_feedback'] = this.taskFeedback;
//     if (this.materials != null) {
//       data['materials'] = this.materials!.map((v) => v.toJson()).toList();
//     }
//     if (this.customer != null) {
//       data['customer'] = this.customer!.toJson();
//     }
//     if (this.serviceMan != null) {
//       data['service_man'] = this.serviceMan!.toJson();
//     }
//     if (this.subTasks != null) {
//       data['sub_tasks'] = this.subTasks!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Materials {
//   int? id;
//   String? name;

//   Materials({this.id, this.name});

//   Materials.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     return data;
//   }
// }

// class Customer {
//   int? id;
//   String? name;
//   String? email;
//   String? contactNumber;
//   String? address1;
//   String? address2;
//   String? city;
//   String? state;
//   String? pincode;
//   String? location;

//   Customer({
//     this.id,
//     this.name,
//     this.email,
//     this.contactNumber,
//     this.address1,
//     this.address2,
//     this.city,
//     this.state,
//     this.pincode,
//     this.location,
//   });

//   Customer.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     email = json['email'];
//     contactNumber = json['contact_number'];
//     address1 = json['address_1'];
//     address2 = json['address_2'];
//     city = json['city'];
//     state = json['state'];
//     pincode = json['pincode'];
//     location = json['location'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['email'] = this.email;
//     data['contact_number'] = this.contactNumber;
//     data['address_1'] = this.address1;
//     data['address_2'] = this.address2;
//     data['city'] = this.city;
//     data['state'] = this.state;
//     data['pincode'] = this.pincode;
//     data['location'] = this.location;
//     return data;
//   }
// }

// class SubTasks {
//   int? subTaskId;
//   int? taskId;
//   String? taskName;
//   String? taskDate;
//   String? taskNote;
//   int? taskPhase;
//   String? taskStatus;
//   List<Materials>? materials;

//   SubTasks({
//     this.subTaskId,
//     this.taskId,
//     this.taskName,
//     this.taskDate,
//     this.taskNote,
//     this.taskPhase,
//     this.taskStatus,
//     this.materials,
//   });

//   SubTasks.fromJson(Map<String, dynamic> json) {
//     subTaskId = json['sub_task_id'];
//     taskId = json['task_id'];
//     taskName = json['task_name'];
//     taskDate = json['task_date'];
//     taskNote = json['task_note'];
//     taskPhase = json['task_phase'];
//     taskStatus = json['task_status'];
//     if (json['materials'] != null) {
//       materials = <Materials>[];
//       json['materials'].forEach((v) {
//         materials!.add(new Materials.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['sub_task_id'] = this.subTaskId;
//     data['task_id'] = this.taskId;
//     data['task_name'] = this.taskName;
//     data['task_date'] = this.taskDate;
//     data['task_note'] = this.taskNote;
//     data['task_phase'] = this.taskPhase;
//     data['task_status'] = this.taskStatus;
//     if (this.materials != null) {
//       data['materials'] = this.materials!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
