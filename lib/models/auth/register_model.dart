
import 'dart:convert';

RegisterModel registerModelFromJson(String str) => RegisterModel.fromJson(json.decode(str));

String registerModelToJson(RegisterModel data) => json.encode(data.toJson());

class RegisterModel {
  RegisterModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.confirmPassword,
  });

  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String confirmPassword;

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
    firstName: json["firstName"],
    lastName: json["lastName"],
    email: json["email"],
    password: json["password"],
    confirmPassword: json["passwordConfirm"],
  );

  Map<String, dynamic> toJson() => {
    "firstName": firstName,
    "lastName": lastName,
    "email": email,
    "password": password,
    "passwordConfirm": confirmPassword,
  };
}

