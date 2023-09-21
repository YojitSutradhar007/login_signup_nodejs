class TokenAuth {
  String? message;
  bool? sucess;

  TokenAuth({this.message, this.sucess});

  TokenAuth.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    sucess = json['sucess'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['sucess'] = this.sucess;
    return data;
  }
}