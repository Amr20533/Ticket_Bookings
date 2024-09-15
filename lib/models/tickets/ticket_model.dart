
class TicketModel {
  String? flight;
  String? seatClass;
  String? type;

  TicketModel(
      {this.flight, this.seatClass, this.type});

  TicketModel.fromJson(Map<String, dynamic> json) {
    flight = json['flight'];
    seatClass = json['seatClass'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['flight'] = flight;
    data['seatClass'] = seatClass;
    data['type'] = type;
    return data;
  }
}
