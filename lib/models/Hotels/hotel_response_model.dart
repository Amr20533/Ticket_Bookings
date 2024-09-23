class HotelResponseModel {
  final String status;
  final int results;
  final HotelData data;

  HotelResponseModel({
    required this.status,
    required this.results,
    required this.data,
  });

  factory HotelResponseModel.fromJson(Map<String, dynamic> json) {
    return HotelResponseModel(
      status: json['status'] as String,
      results: json['results'] as int,
      data: HotelData.fromJson(json['data']),
    );
  }
}

class HotelData {
  final List<Hotel> hotels;

  HotelData({required this.hotels});

  factory HotelData.fromJson(Map<String, dynamic> json) {
    var hotelList = json['data'] as List;
    List<Hotel> hotels = hotelList.map((i) => Hotel.fromJson(i)).toList();

    return HotelData(hotels: hotels);
  }
}

class Hotel {
  final String id;
  final String hotelName;
  final List<String> images;
  final String country;
  final String address;
  final String description;
  final List<Room> rooms;

  Hotel({
    required this.id,
    required this.hotelName,
    required this.images,
    required this.country,
    required this.address,
    required this.description,
    required this.rooms,
  });

  factory Hotel.fromJson(Map<String, dynamic> json) {
    var roomList = json['room'] as List;
    List<Room> rooms = roomList.map((i) => Room.fromJson(i)).toList();

    return Hotel(
      id: json['_id'] as String,
      hotelName: json['hotelName'] as String,
      images: List<String>.from(json['images']),
      country: json['country'] as String,
      address: json['address'] as String,
      description: json['description'] as String,
      rooms: rooms,
    );
  }
}

class Room {
  final String id;
  final String type;
  final double price;
  final int totalRooms;
  final int availableRooms;

  Room({
    required this.id,
    required this.type,
    required this.price,
    required this.totalRooms,
    required this.availableRooms,
  });

  factory Room.fromJson(Map<String, dynamic> json) {
    return Room(
      id: json['_id'] as String,
      type: json['type'] as String,
      price: (json['price'] as num).toDouble(),
      totalRooms: json['totalRooms'] as int,
      availableRooms: json['availableRooms'] as int,
    );
  }
}
