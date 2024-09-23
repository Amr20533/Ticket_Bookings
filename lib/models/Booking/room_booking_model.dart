class RoomBookingModel {
  String? hotelId;
  String? roomType;
  String? startDate;
  String? endDate;

  RoomBookingModel({this.hotelId, this.roomType, this.startDate, this.endDate});

  RoomBookingModel.fromJson(Map<String, dynamic> json) {
    hotelId = json['hotelId'];
    roomType = json['roomType'];
    startDate = json['startDate'];
    endDate = json['endDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['hotelId'] = hotelId;
    data['roomType'] = roomType;
    data['startDate'] = startDate;
    data['endDate'] = endDate;
    return data;
  }
}
