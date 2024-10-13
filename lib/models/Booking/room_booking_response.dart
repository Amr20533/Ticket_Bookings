import 'dart:convert';
BookingRoomResponseModel bookingRoomResponseModelFromJson(String json) => BookingRoomResponseModel.fromJson(jsonDecode(json));

class BookingRoomResponseModel {
  final String status;
  final String paymentGateway;

  BookingRoomResponseModel({
    required this.status,
    required this.paymentGateway,
  });

  factory BookingRoomResponseModel.fromJson(Map<String, dynamic> json) {
    return BookingRoomResponseModel(
      status: json['status'] as String,
      paymentGateway: json['paymentGateway'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'paymentGateway': paymentGateway,
    };
  }
}

class Data {
  final String user;
  final String hotel;
  final String roomType;
  final int priceInCents;
  final bool isPaid;
  final String startDate;
  final String endDate;
  final String id;
  final String createdAt;
  final String orderId;
  final int v;

  Data({
    required this.user,
    required this.hotel,
    required this.roomType,
    required this.priceInCents,
    required this.isPaid,
    required this.startDate,
    required this.endDate,
    required this.id,
    required this.createdAt,
    required this.orderId,
    required this.v,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      user: json['user'] as String,
      hotel: json['hotel'] as String,
      roomType: json['roomType'] as String,
      priceInCents: json['priceInCents'] as int,
      isPaid: json['isPaid'] as bool,
      startDate: json['startDate'] as String,
      endDate: json['endDate'] as String,
      id: json['_id'] as String,
      createdAt: json['createdAt'] as String,
      orderId: json['orderId'],
      v: json['__v'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user': user,
      'hotel': hotel,
      'roomType': roomType,
      'priceInCents': priceInCents,
      'isPaid': isPaid,
      'startDate': startDate,
      'endDate': endDate,
      '_id': id,
      'createdAt': createdAt,
      'orderId': orderId,
      '__v': v,
    };
  }
}
