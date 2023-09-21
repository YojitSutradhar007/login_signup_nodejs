class LoginModel {
  String? message;
  bool? success;
  Result? result;
  String? token;

  LoginModel({this.message, this.success, this.result, this.token});

  LoginModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    success = json['success'];
    result =
    json['result'] != null ? new Result.fromJson(json['result']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['success'] = this.success;
    if (this.result != null) {
      data['result'] = this.result!.toJson();
    }
    data['token'] = this.token;
    return data;
  }
}

class Result {
  String? id;
  String? email;
  String? password;

  Result({this.id, this.email, this.password});

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['password'] = this.password;
    return data;
  }
}
