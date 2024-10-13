
class ProfileDataModel {
  ProfileDataModel({
    required this.status,
    required this.data,
  });

  final Data data;
  final String status;

  factory ProfileDataModel.fromJson(Map<String, dynamic> json) => ProfileDataModel(
    data: Data.fromJson(json['data']),
    status: json["status"],
  );
}
class Data {
  SubData? subData;

  Data({this.subData});

  Data.fromJson(Map<String, dynamic> json) {
    subData = json['data'] != null ? SubData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (subData != null) {
      data['data'] = subData!.toJson();
    }
    return data;
  }
}

class SubData {
  String? sId;
  String? firstName;
  String? lastName;
  String? email;
  String? photo;
  String? gender;
  String? phoneNumber;
  int? iV;
  String? id;

  SubData({
    this.sId,
    this.firstName,
    this.lastName,
    this.email,
    this.photo,
    this.gender,
    this.phoneNumber,
    this.iV,
    this.id,
  });

  SubData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    photo = json['photo'];
    gender = json['gender'];
    phoneNumber = json['phoneNumber'].toString();
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
