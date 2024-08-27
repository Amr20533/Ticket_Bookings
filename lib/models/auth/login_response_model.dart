
class LoginResponseModel {
  LoginResponseModel({
    required this.token,
    required this.status,
    required this.data,
  });

  final Data data;
  final String token;
  final String status;

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) => LoginResponseModel(
    data: Data.fromJson(json['data']),
    token: json["token"],
    status: json["status"],
  );
}
class Data {
  User? user;

  Data({this.user});

  Data.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class User {
  String? sId;
  String? firstName;
  String? lastName;
  String? email;
  String? photo;
  int? gender;
  int? phoneNumber;
  int? iV;
  String? id;

  User(
      {this.sId,
        this.firstName,
        this.lastName,
        this.email,
        this.photo,
        this.gender,
        this.phoneNumber,
        this.iV,
        this.id});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    photo = json['photo'];
    gender = json['gender'];
    phoneNumber = json['phoneNumber'];
    iV = json['__v'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['email'] = email;
    data['photo'] = photo;
    data['gender'] = gender;
    data['phoneNumber'] = phoneNumber;
    data['__v'] = iV;
    data['id'] = id;
    return data;
  }
}
