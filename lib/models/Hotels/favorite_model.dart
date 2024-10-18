class HotelFavoriteModel {
  String hotelId;

  HotelFavoriteModel({
    this.hotelId = '',
  });

  factory HotelFavoriteModel.fromJson(Map<String, dynamic> json) {
    return HotelFavoriteModel(
      hotelId: json['hotelId'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'hotelId': hotelId,
    };
  }
}
