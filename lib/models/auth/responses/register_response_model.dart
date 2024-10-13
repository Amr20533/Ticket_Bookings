import 'dart:convert';

RegisterResponseModel registerResponseModelFromJson(String str) => RegisterResponseModel.fromJson(json.decode(str));

class RegisterResponseModel {
  final String status;
  final String token;
  final UserData data;

  RegisterResponseModel({
    required this.status,
    required this.token,
    required this.data,
  });

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) {
    return RegisterResponseModel(
      status: json['status'],
      token: json['token'],
      data: UserData.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'token': token,
      'data': data.toJson(),
    };
  }
}

class UserData {
  final User user;

  UserData({required this.user});

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      user: User.fromJson(json['user']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user': user.toJson(),
    };
  }
}

class User {
  final String firstName;
  final String lastName;
  final String email;
  final String photo;
  final List<dynamic> orders; // Adjust type if necessary
  final List<dynamic> chatOrders; // Adjust type if necessary
  final String? phoneNumber;
  final String? gender;
  final bool active;
  final String id;
  final int v;

  User({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.photo,
    required this.orders,
    required this.chatOrders,
    this.phoneNumber,
    this.gender,
    required this.active,
    required this.id,
    required this.v,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      photo: json['photo'],
      orders: List<dynamic>.from(json['orders'] ?? []),
      chatOrders: List<dynamic>.from(json['chatOrders'] ?? []),
      phoneNumber: json['phoneNumber'],
      gender: json['gender'],
      active: json['active'],
      id: json['_id'],
      v: json['__v'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'photo': photo,
      'orders': orders,
      'chatOrders': chatOrders,
      'phoneNumber': phoneNumber,
      'gender': gender,
      'active': active,
      '_id': id,
      '__v': v,
    };
  }
}
