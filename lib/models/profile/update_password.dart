
import 'dart:convert';

UpdatePasswordModel updatePasswordModelFromJson(String str) => UpdatePasswordModel.fromJson(json.decode(str));

String updatePasswordModelToJson(UpdatePasswordModel data) => json.encode(data.toJson());

class UpdatePasswordModel {
  UpdatePasswordModel({
    required this.password,
    required this.confirmPassword,
  });

  final String password;
  final String confirmPassword;

  factory UpdatePasswordModel.fromJson(Map<String, dynamic> json) => UpdatePasswordModel(
    password: json["password"],
    confirmPassword: json["passwordConfirm"],
  );

  Map<String, dynamic> toJson() => {
    "password": password,
    "passwordConfirm": confirmPassword,
  };
}

