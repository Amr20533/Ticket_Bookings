
import 'dart:convert';

UpdateProfileModel updateProfileModelFromJson(String str) => UpdateProfileModel.fromJson(json.decode(str));

String updateProfileModelToJson(UpdateProfileModel data) => json.encode(data.toJson());

class UpdateProfileModel {
  UpdateProfileModel({
    this.firstName,
    this.lastName,
    this.email,
    this.dateOfBirth,
    this.phone,
    this.gender,
  });

  final String? firstName;
  final String? lastName;
  final String? email;
  final String? dateOfBirth;
  final String? phone;
  final String? gender;

  factory UpdateProfileModel.fromJson(Map<String, dynamic> json) => UpdateProfileModel(
    firstName: json["firstName"],
    lastName: json["lastName"],
    email: json["email"],
    dateOfBirth: json["dateOfBirth"],
    gender: json["gender"],
    phone: json["phone"],
  );

  Map<String, dynamic> toJson() => {
    "firstName": firstName,
    "lastName": lastName,
    "email": email,
    "dateOfBirth": dateOfBirth,
    "gender": gender,
    "phone": phone,
  };
}

