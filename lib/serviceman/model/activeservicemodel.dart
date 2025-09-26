// // class ActiveServiceandTodaysTask {
// //   String? status;
// //   int? errorCode;
// //   String? message;
// //   List<Data>? data;

// //   ActiveServiceandTodaysTask(
// //       {this.status, this.errorCode, this.message, this.data});

// //   ActiveServiceandTodaysTask.fromJson(Map<String, dynamic> json) {
// //     status = json['status'];
// //     errorCode = json['error_code'];
// //     message = json['message'];
// //     if (json['data'] != null) {
// //       data = <Data>[];
// //       json['data'].forEach((v) {
// //         data!.add(Data.fromJson(v));
// //       });
// //     }
// //   }

// //   Map<String, dynamic> toJson() {
// //     final Map<String, dynamic> data = new Map<String, dynamic>();
// //     data['status'] = status;
// //     data['error_code'] = errorCode;
// //     data['message'] = message;
// //     if (this.data != null) {
// //       data['data'] = this.data!.map((v) => v.toJson()).toList();
// //     }
// //     return data;
// //   }
// // }

// // class Data {
// //   int? id;
// //   String? taskName;
// //   String? salesMan;
// //   String? taskType;
// //   String? taskProduct;
// //   String? taskCustomer;
// //   String? taskDate;
// //   String? taskNote;
// //   String? taskStatus;
// //   int? taskStatusId;
// //   String? taskCustomerNote;
// //   String? taskAcceptCustomer;
// //   String? taskFeedback;
// //   String? taskGoogleLink;
// //   List<SubTasks>? subTasks;
// //   List<TimeLines>? timeLines;
// //   Customer? customer;
// //   Customer? serviceMan;
// //   List<Materials>? materials;

// //   Data(
// //       {this.id,
// //       this.taskName,
// //       this.salesMan,
// //       this.taskType,
// //       this.taskProduct,
// //       this.taskCustomer,
// //       this.taskDate,
// //       this.taskNote,
// //       this.taskStatus,
// //       this.taskStatusId,
// //       this.taskCustomerNote,
// //       this.taskAcceptCustomer,
// //       this.taskFeedback,
// //       this.taskGoogleLink,
// //       this.subTasks,
// //       this.timeLines,
// //       this.customer,
// //       this.serviceMan,
// //       this.materials});

// //   Data.fromJson(Map<String, dynamic> json) {
// //     id = json['id'];
// //     taskName = json['task_name'];
// //     salesMan = json['sales_man'];
// //     taskType = json['task_type'];
// //     taskProduct = json['task_product'];
// //     taskCustomer = json['task_customer'];
// //     taskDate = json['task_date'];
// //     taskNote = json['task_note'];
// //     taskStatus = json['task_status'];
// //     taskStatusId = json['task_status_id'];
// //     taskCustomerNote = json['task_customer_note'];
// //     taskAcceptCustomer = json['task_accept_customer'];
// //     taskFeedback = json['task_feedback'];
// //     taskGoogleLink = json['task_google_link'];
// //     if (json['sub_tasks'] != null) {
// //       subTasks = <SubTasks>[];
// //       json['sub_tasks'].forEach((v) {
// //         subTasks!.add(SubTasks.fromJson(v));
// //       });
// //     }
// //     if (json['time_lines'] != null) {
// //       timeLines = <TimeLines>[];
// //       json['time_lines'].forEach((v) {
// //         timeLines!.add(TimeLines.fromJson(v));
// //       });
// //     }
// //     customer = json['customer'] != null
// //         ? Customer.fromJson(json['customer'])
// //         : null;
// //     serviceMan = json['service_man'] != null
// //         ? Customer.fromJson(json['service_man'])
// //         : null;
// //     if (json['materials'] != null) {
// //       materials = <Materials>[];
// //       json['materials'].forEach((v) {
// //         materials!.add(Materials.fromJson(v));
// //       });
// //     }
// //   }

// //   Map<String, dynamic> toJson() {
// //     final Map<String, dynamic> data = new Map<String, dynamic>();
// //     data['id'] = id;
// //     data['task_name'] = taskName;
// //     data['sales_man'] = salesMan;
// //     data['task_type'] = taskType;
// //     data['task_product'] = taskProduct;
// //     data['task_customer'] = taskCustomer;
// //     data['task_date'] = taskDate;
// //     data['task_note'] = taskNote;
// //     data['task_status'] = taskStatus;
// //     data['task_status_id'] = taskStatusId;
// //     data['task_customer_note'] = taskCustomerNote;
// //     data['task_accept_customer'] = taskAcceptCustomer;
// //     data['task_feedback'] = taskFeedback;
// //     data['task_google_link'] = taskGoogleLink;
// //     if (subTasks != null) {
// //       data['sub_tasks'] = subTasks!.map((v) => v.toJson()).toList();
// //     }
// //     if (timeLines != null) {
// //       data['time_lines'] = timeLines!.map((v) => v.toJson()).toList();
// //     }
// //     if (customer != null) {
// //       data['customer'] = customer!.toJson();
// //     }
// //     if (serviceMan != null) {
// //       data['service_man'] = serviceMan!.toJson();
// //     }
// //     if (materials != null) {
// //       data['materials'] = materials!.map((v) => v.toJson()).toList();
// //     }
// //     return data;
// //   }
// // }

// // class SubTasks {
// //   int? subTaskId;
// //   int? taskId;
// //   String? taskName;
// //   String? taskDate;
// //   String? taskNote;
// //   int? taskPhase;
// //   String? taskStatus;
// //   String? taskGoogleLink;
// //   List<Materials>? materials;
// //   List<TaskFiles>? taskFiles;

// //   SubTasks(
// //       {this.subTaskId,
// //       this.taskId,
// //       this.taskName,
// //       this.taskDate,
// //       this.taskNote,
// //       this.taskPhase,
// //       this.taskStatus,
// //       this.taskGoogleLink,
// //       this.materials,
// //       this.taskFiles});

// //   SubTasks.fromJson(Map<String, dynamic> json) {
// //     subTaskId = json['sub_task_id'];
// //     taskId = json['task_id'];
// //     taskName = json['task_name'];
// //     taskDate = json['task_date'];
// //     taskNote = json['task_note'];
// //     taskPhase = json['task_phase'];
// //     taskStatus = json['task_status'];
// //     taskGoogleLink = json['task_google_link'];
// //     if (json['materials'] != null) {
// //       materials = <Materials>[];
// //       json['materials'].forEach((v) {
// //         materials!.add(new Materials.fromJson(v));
// //       });
// //     }
// //     if (json['task_files'] != null) {
// //       taskFiles = <TaskFiles>[];
// //       json['task_files'].forEach((v) {
// //         taskFiles!.add(new TaskFiles.fromJson(v));
// //       });
// //     }
// //   }

// //   Map<String, dynamic> toJson() {
// //     final Map<String, dynamic> data = new Map<String, dynamic>();
// //     data['sub_task_id'] = subTaskId;
// //     data['task_id'] = taskId;
// //     data['task_name'] = taskName;
// //     data['task_date'] = taskDate;
// //     data['task_note'] = taskNote;
// //     data['task_phase'] = taskPhase;
// //     data['task_status'] = taskStatus;
// //     data['task_google_link'] = taskGoogleLink;
// //     if (materials != null) {
// //       data['materials'] = materials!.map((v) => v.toJson()).toList();
// //     }
// //     if (taskFiles != null) {
// //       data['task_files'] = taskFiles!.map((v) => v.toJson()).toList();
// //     }
// //     return data;
// //   }
// // }

// // class Materials {
// //   int? id;
// //   String? name;

// //   Materials({this.id, this.name});

// //   Materials.fromJson(Map<String, dynamic> json) {
// //     id = json['id'];
// //     name = json['name'];
// //   }

// //   Map<String, dynamic> toJson() {
// //     final Map<String, dynamic> data = new Map<String, dynamic>();
// //     data['id'] = id;
// //     data['name'] = name;
// //     return data;
// //   }
// // }

// // class TaskFiles {
// //   String? name;

// //   TaskFiles({this.name});

// //   TaskFiles.fromJson(Map<String, dynamic> json) {
// //     name = json['name'];
// //   }

// //   Map<String, dynamic> toJson() {
// //     final Map<String, dynamic> data = new Map<String, dynamic>();
// //     data['name'] = name;
// //     return data;
// //   }
// // }

// // class TimeLines {
// //   int? taskId;
// //   String? timelineText;
// //   String? createdAt;
// //   String? updatedAt;

// //   TimeLines({this.taskId, this.timelineText, this.createdAt, this.updatedAt});

// //   TimeLines.fromJson(Map<String, dynamic> json) {
// //     taskId = json['task_id'];
// //     timelineText = json['timeline_text'];
// //     createdAt = json['created_at'];
// //     updatedAt = json['updated_at'];
// //   }

// //   Map<String, dynamic> toJson() {
// //     final Map<String, dynamic> data = new Map<String, dynamic>();
// //     data['task_id'] = taskId;
// //     data['timeline_text'] = timelineText;
// //     data['created_at'] = createdAt;
// //     data['updated_at'] = updatedAt;
// //     return data;
// //   }
// // }

// // class Customer {
// //   int? id;
// //   String? name;
// //   String? email;
// //   String? contactNumber;
// //   String? address1;
// //   String? address2;
// //   String? city;
// //   String? state;
// //   String? pincode;
// //   String? location;

// //   Customer(
// //       {this.id,
// //       this.name,
// //       this.email,
// //       this.contactNumber,
// //       this.address1,
// //       this.address2,
// //       this.city,
// //       this.state,
// //       this.pincode,
// //       this.location});

// //   Customer.fromJson(Map<String, dynamic> json) {
// //     id = json['id'];
// //     name = json['name'];
// //     email = json['email'];
// //     contactNumber = json['contact_number'];
// //     address1 = json['address_1'];
// //     address2 = json['address_2'];
// //     city = json['city'];
// //     state = json['state'];
// //     pincode = json['pincode'];
// //     location = json['location'];
// //   }

// //   Map<String, dynamic> toJson() {
// //     final Map<String, dynamic> data = new Map<String, dynamic>();
// //     data['id'] = id;
// //     data['name'] = name;
// //     data['email'] = email;
// //     data['contact_number'] = contactNumber;
// //     data['address_1'] = address1;
// //     data['address_2'] = address2;
// //     data['city'] = city;
// //     data['state'] = state;
// //     data['pincode'] = pincode;
// //     data['location'] = location;
// //     return data;
// //   }
// // }

// class ActiveServiceandTodaysTask {
//   String? status;
//   int? errorCode;
//   String? message;
//   List<Data>? data;

//   ActiveServiceandTodaysTask({
//     this.status,
//     this.errorCode,
//     this.message,
//     this.data,
//   });

//   ActiveServiceandTodaysTask.fromJson(Map<String, dynamic> json) {
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
//   String? taskGoogleLink;
//   List<SubTasks>? subTasks;
//   List<TimeLines>? timeLines;
//   Customer? customer;
//   Customer? serviceMan;
//   List<FileTypes>? fileTypes;
//   List<Materials>? materials;
//   List<TaskFiles>? taskFiles;

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
//     this.taskGoogleLink,
//     this.subTasks,
//     this.timeLines,
//     this.customer,
//     this.serviceMan,
//     this.fileTypes,
//     this.materials,
//     this.taskFiles,
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
//     taskGoogleLink = json['task_google_link'];
//     if (json['sub_tasks'] != null) {
//       subTasks = <SubTasks>[];
//       json['sub_tasks'].forEach((v) {
//         subTasks!.add(new SubTasks.fromJson(v));
//       });
//     }
//     if (json['time_lines'] != null) {
//       timeLines = <TimeLines>[];
//       json['time_lines'].forEach((v) {
//         timeLines!.add(new TimeLines.fromJson(v));
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
//     if (json['file_types'] != null) {
//       fileTypes = <FileTypes>[];
//       json['file_types'].forEach((v) {
//         fileTypes!.add(new FileTypes.fromJson(v));
//       });
//     }
//     if (json['materials'] != null) {
//       materials = <Materials>[];
//       json['materials'].forEach((v) {
//         materials!.add(new Materials.fromJson(v));
//       });
//     }
//     if (json['task_files'] != null) {
//       taskFiles = <TaskFiles>[];
//       json['task_files'].forEach((v) {
//         taskFiles!.add(new TaskFiles.fromJson(v));
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
//     data['task_google_link'] = this.taskGoogleLink;
//     if (this.subTasks != null) {
//       data['sub_tasks'] = this.subTasks!.map((v) => v.toJson()).toList();
//     }
//     if (this.timeLines != null) {
//       data['time_lines'] = this.timeLines!.map((v) => v.toJson()).toList();
//     }
//     if (this.customer != null) {
//       data['customer'] = this.customer!.toJson();
//     }
//     if (this.serviceMan != null) {
//       data['service_man'] = this.serviceMan!.toJson();
//     }
//     if (this.fileTypes != null) {
//       data['file_types'] = this.fileTypes!.map((v) => v.toJson()).toList();
//     }
//     if (this.materials != null) {
//       data['materials'] = this.materials!.map((v) => v.toJson()).toList();
//     }
//     if (this.taskFiles != null) {
//       data['task_files'] = this.taskFiles!.map((v) => v.toJson()).toList();
//     }
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
//   String? taskGoogleLink;
//   List<Materials>? materials;
//   List<TaskFiles>? taskFiles;

//   SubTasks({
//     this.subTaskId,
//     this.taskId,
//     this.taskName,
//     this.taskDate,
//     this.taskNote,
//     this.taskPhase,
//     this.taskStatus,
//     this.taskGoogleLink,
//     this.materials,
//     this.taskFiles,
//   });

//   SubTasks.fromJson(Map<String, dynamic> json) {
//     subTaskId = json['sub_task_id'];
//     taskId = json['task_id'];
//     taskName = json['task_name'];
//     taskDate = json['task_date'];
//     taskNote = json['task_note'];
//     taskPhase = json['task_phase'];
//     taskStatus = json['task_status'];
//     taskGoogleLink = json['task_google_link'];
//     if (json['materials'] != null) {
//       materials = <Materials>[];
//       json['materials'].forEach((v) {
//         materials!.add(new Materials.fromJson(v));
//       });
//     }
//     if (json['task_files'] != null) {
//       taskFiles = <TaskFiles>[];
//       json['task_files'].forEach((v) {
//         taskFiles!.add(new TaskFiles.fromJson(v));
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
//     data['task_google_link'] = this.taskGoogleLink;
//     if (this.materials != null) {
//       data['materials'] = this.materials!.map((v) => v.toJson()).toList();
//     }
//     if (this.taskFiles != null) {
//       data['task_files'] = this.taskFiles!.map((v) => v.toJson()).toList();
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

// class TaskFiles {
//   String? name;

//   TaskFiles({this.name});

//   TaskFiles.fromJson(Map<String, dynamic> json) {
//     name = json['name'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['name'] = this.name;
//     return data;
//   }
// }

// class TimeLines {
//   int? taskId;
//   String? timelineText;
//   String? createdAt;
//   String? updatedAt;

//   TimeLines({this.taskId, this.timelineText, this.createdAt, this.updatedAt});

//   TimeLines.fromJson(Map<String, dynamic> json) {
//     taskId = json['task_id'];
//     timelineText = json['timeline_text'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['task_id'] = this.taskId;
//     data['timeline_text'] = this.timelineText;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
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

// class FileTypes {
//   int? id;
//   String? name;
//   int? fileTypeId;
//   String? image;

//   FileTypes({this.id, this.name, this.fileTypeId, this.image});

//   FileTypes.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     fileTypeId = json['file_type_id'];
//     image = json['image'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['file_type_id'] = this.fileTypeId;
//     data['image'] = this.image;
//     return data;
//   }
// }
class ActiveServiceandTodaysTask {
  String? status;
  int? errorCode;
  String? message;
  List<Data>? data;

  ActiveServiceandTodaysTask({
    this.status,
    this.errorCode,
    this.message,
    this.data,
  });

  ActiveServiceandTodaysTask.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    errorCode = json['error_code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['status'] = status;
    data['error_code'] = errorCode;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? taskName;
  String? salesMan;
  String? taskType;
  String? taskProduct;
  String? taskCustomer;
  String? taskDate;
  String? taskNote;
  String? taskStatus;
  int? taskStatusId;
  String? taskCustomerNote;
  String? taskAcceptCustomer;
  String? taskFeedback;
  String? taskGoogleLink;
  String? stage;
  String? customerServiceRequest;
  dynamic idStage;
  dynamic idCustomerServiceRequest;
  List<SubTasks>? subTasks;
  List<TimeLines>? timeLines;
  Customer? customer;
  Customer? serviceMan;
  List<FileTypes>? fileTypes;
  List<Materials>? materials;
  List<TaskFiles>? taskFiles;

  Data({
    this.id,
    this.taskName,
    this.salesMan,
    this.taskType,
    this.taskProduct,
    this.taskCustomer,
    this.taskDate,
    this.taskNote,
    this.taskStatus,
    this.taskStatusId,
    this.taskCustomerNote,
    this.taskAcceptCustomer,
    this.taskFeedback,
    this.taskGoogleLink,
    this.stage,
    this.customerServiceRequest,
    this.idStage,
    this.idCustomerServiceRequest,
    this.subTasks,
    this.timeLines,
    this.customer,
    this.serviceMan,
    this.fileTypes,
    this.materials,
    this.taskFiles,
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    taskName = json['task_name'];
    salesMan = json['sales_man'];
    taskType = json['task_type'];
    taskProduct = json['task_product'];
    taskCustomer = json['task_customer'];
    taskDate = json['task_date'];
    taskNote = json['task_note'];
    taskStatus = json['task_status'];
    taskStatusId = json['task_status_id'];
    taskCustomerNote = json['task_customer_note'];
    taskAcceptCustomer = json['task_accept_customer'];
    taskFeedback = json['task_feedback'];
    taskGoogleLink = json['task_google_link'];
    stage = json['stage'];
    customerServiceRequest = json['customer_service_request'];
    idStage = json['id_stage'];
    idCustomerServiceRequest = json['id_customer_service_request'];

    if (json['sub_tasks'] != null) {
      subTasks = <SubTasks>[];
      json['sub_tasks'].forEach((v) {
        subTasks!.add(SubTasks.fromJson(v));
      });
    }
    if (json['time_lines'] != null) {
      timeLines = <TimeLines>[];
      json['time_lines'].forEach((v) {
        timeLines!.add(TimeLines.fromJson(v));
      });
    }
    customer =
        json['customer'] != null ? Customer.fromJson(json['customer']) : null;
    serviceMan =
        json['service_man'] != null
            ? Customer.fromJson(json['service_man'])
            : null;

    if (json['file_types'] != null) {
      fileTypes = <FileTypes>[];
      json['file_types'].forEach((v) {
        fileTypes!.add(FileTypes.fromJson(v));
      });
    }
    if (json['materials'] != null) {
      materials = <Materials>[];
      json['materials'].forEach((v) {
        materials!.add(Materials.fromJson(v));
      });
    }
    if (json['task_files'] != null) {
      taskFiles = <TaskFiles>[];
      json['task_files'].forEach((v) {
        taskFiles!.add(TaskFiles.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['task_name'] = taskName;
    data['sales_man'] = salesMan;
    data['task_type'] = taskType;
    data['task_product'] = taskProduct;
    data['task_customer'] = taskCustomer;
    data['task_date'] = taskDate;
    data['task_note'] = taskNote;
    data['task_status'] = taskStatus;
    data['task_status_id'] = taskStatusId;
    data['task_customer_note'] = taskCustomerNote;
    data['task_accept_customer'] = taskAcceptCustomer;
    data['task_feedback'] = taskFeedback;
    data['task_google_link'] = taskGoogleLink;
    data['stage'] = stage;
    data['customer_service_request'] = customerServiceRequest;
    data['id_stage'] = idStage;
    data['id_customer_service_request'] = idCustomerServiceRequest;

    if (subTasks != null) {
      data['sub_tasks'] = subTasks!.map((v) => v.toJson()).toList();
    }
    if (timeLines != null) {
      data['time_lines'] = timeLines!.map((v) => v.toJson()).toList();
    }
    if (customer != null) {
      data['customer'] = customer!.toJson();
    }
    if (serviceMan != null) {
      data['service_man'] = serviceMan!.toJson();
    }
    if (fileTypes != null) {
      data['file_types'] = fileTypes!.map((v) => v.toJson()).toList();
    }
    if (materials != null) {
      data['materials'] = materials!.map((v) => v.toJson()).toList();
    }
    if (taskFiles != null) {
      data['task_files'] = taskFiles!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SubTasks {
  int? subTaskId;
  int? taskId;
  String? taskName;
  String? taskDate;
  String? taskNote;
  int? taskPhase;
  String? taskStatus;
  String? taskGoogleLink;
  List<Materials>? materials;
  List<TaskFiles>? taskFiles;

  SubTasks({
    this.subTaskId,
    this.taskId,
    this.taskName,
    this.taskDate,
    this.taskNote,
    this.taskPhase,
    this.taskStatus,
    this.taskGoogleLink,
    this.materials,
    this.taskFiles,
  });

  SubTasks.fromJson(Map<String, dynamic> json) {
    subTaskId = json['sub_task_id'];
    taskId = json['task_id'];
    taskName = json['task_name'];
    taskDate = json['task_date'];
    taskNote = json['task_note'];
    taskPhase = json['task_phase'];
    taskStatus = json['task_status'];
    taskGoogleLink = json['task_google_link'];

    if (json['materials'] != null) {
      materials = <Materials>[];
      json['materials'].forEach((v) {
        materials!.add(Materials.fromJson(v));
      });
    }
    if (json['task_files'] != null) {
      taskFiles = <TaskFiles>[];
      json['task_files'].forEach((v) {
        taskFiles!.add(TaskFiles.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['sub_task_id'] = subTaskId;
    data['task_id'] = taskId;
    data['task_name'] = taskName;
    data['task_date'] = taskDate;
    data['task_note'] = taskNote;
    data['task_phase'] = taskPhase;
    data['task_status'] = taskStatus;
    data['task_google_link'] = taskGoogleLink;

    if (materials != null) {
      data['materials'] = materials!.map((v) => v.toJson()).toList();
    }
    if (taskFiles != null) {
      data['task_files'] = taskFiles!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Materials {
  int? id;
  String? name;

  Materials({this.id, this.name});

  Materials.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}

class TaskFiles {
  String? name;
  String? fileType;

  TaskFiles({this.name, this.fileType});

  TaskFiles.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    fileType = json['file_type']; // sometimes empty
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['name'] = name;
    data['file_type'] = fileType;
    return data;
  }
}

class TimeLines {
  int? taskId;
  String? timelineText;
  String? createdAt;
  String? updatedAt;

  TimeLines({this.taskId, this.timelineText, this.createdAt, this.updatedAt});

  TimeLines.fromJson(Map<String, dynamic> json) {
    taskId = json['task_id'];
    timelineText = json['timeline_text'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['task_id'] = taskId;
    data['timeline_text'] = timelineText;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Customer {
  int? id;
  String? name;
  String? email;
  String? contactNumber;
  String? address1;
  String? address2;
  String? city;
  String? state;
  String? pincode;
  String? location;

  Customer({
    this.id,
    this.name,
    this.email,
    this.contactNumber,
    this.address1,
    this.address2,
    this.city,
    this.state,
    this.pincode,
    this.location,
  });

  Customer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    contactNumber = json['contact_number'];
    address1 = json['address_1'];
    address2 = json['address_2'];
    city = json['city'];
    state = json['state'];
    pincode = json['pincode'];
    location = json['location'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['contact_number'] = contactNumber;
    data['address_1'] = address1;
    data['address_2'] = address2;
    data['city'] = city;
    data['state'] = state;
    data['pincode'] = pincode;
    data['location'] = location;
    return data;
  }
}

class FileTypes {
  int? id;
  String? name;
  int? fileTypeId;
  String? image;

  FileTypes({this.id, this.name, this.fileTypeId, this.image});

  FileTypes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    fileTypeId = json['file_type_id'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    data['file_type_id'] = fileTypeId;
    data['image'] = image;
    return data;
  }
}
