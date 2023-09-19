// To parse this JSON data, do
//
//     final signUpModel = signUpModelFromJson(jsonString);

import 'dart:convert';

SignUpModel signUpModelFromJson(String str) => SignUpModel.fromJson(json.decode(str));

String signUpModelToJson(SignUpModel data) => json.encode(data.toJson());

class SignUpModel {
  String message;
  bool success;
  Result result;

  SignUpModel({
    required this.message,
    required this.success,
    required this.result,
  });

  factory SignUpModel.fromJson(Map<String, dynamic> json) => SignUpModel(
    message: json["message"],
    success: json["success"],
    result: Result.fromJson(json["result"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "success": success,
    "result": result.toJson(),
  };
}

class Result {
  String id;
  String email;
  String password;
  DateTime updatedAt;
  DateTime createdAt;

  Result({
    required this.id,
    required this.email,
    required this.password,
    required this.updatedAt,
    required this.createdAt,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["id"],
    email: json["email"],
    password: json["password"],
    updatedAt: DateTime.parse(json["updatedAt"]),
    createdAt: DateTime.parse(json["createdAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "email": email,
    "password": password,
    "updatedAt": updatedAt.toIso8601String(),
    "createdAt": createdAt.toIso8601String(),
  };
}
