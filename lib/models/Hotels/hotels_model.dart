class HotelsModel {
  List<String>? image;
  String? country;
  String? address;
  String? description;
  List<Room>? room;

  HotelsModel(
      {this.image, this.country, this.address, this.description, this.room});

  HotelsModel.fromJson(Map<String, dynamic> json) {
    image = json['image'].cast<String>();
    country = json['country'];
    address = json['address'];
    description = json['description'];
    if (json['room'] != null) {
      room = <Room>[];
      json['room'].forEach((v) {
        room!.add(Room.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image'] = image;
    data['country'] = country;
    data['address'] = address;
    data['description'] = description;
    if (room != null) {
      data['room'] = room!.map((v) => v .toJson()).toList();
    }
    return data;
  }
}

class Room {
  String? type;
  int? price;
  int? totalRooms;
  int? availableRooms;

  Room({this.type, this.price, this.totalRooms, this.availableRooms});

  Room.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    price = json['price'];
    totalRooms = json['totalRooms'];
    availableRooms = json['availableRooms'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['price'] = price;
    data['totalRooms'] = totalRooms;
    data['availableRooms'] = availableRooms;
    return data;
  }
}
