import 'dart:convert';

ModelLogin modelLoginFromJson(String str) =>
    ModelLogin.fromJson(json.decode(str));

String modelLoginToJson(ModelLogin data) => json.encode(data.toJson());

class ModelLogin {
  String? status;
  int? errorCode;
  String? token;
  String? tokenType;
  int? expiresIn;
  int? userType;

  ModelLogin({
    this.status,
    this.errorCode,
    this.token,
    this.tokenType,
    this.expiresIn,
    this.userType,
  });

  factory ModelLogin.fromJson(Map<String, dynamic> json) => ModelLogin(
    status: json["status"]?.toString(),
    errorCode:
        json["error_code"] is int
            ? json["error_code"]
            : int.tryParse(json["error_code"].toString()),
    token: json["token"]?.toString(),
    tokenType: json["token_type"]?.toString(),
    expiresIn:
        json["expires_in"] is int
            ? json["expires_in"]
            : int.tryParse(json["expires_in"].toString()),
    userType:
        json["user_type"] is int
            ? json["user_type"]
            : int.tryParse(json["user_type"].toString()),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "error_code": errorCode,
    "token": token,
    "token_type": tokenType,
    "expires_in": expiresIn,
    "user_type": userType,
  };

  bool get isNotEmpty =>
      (status?.isNotEmpty ?? false) && (token?.isNotEmpty ?? false);
}
