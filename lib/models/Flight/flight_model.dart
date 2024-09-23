class FlightModel {
  Prices? prices;
  String? sId;
  String? plane;
  String? from;
  String? to;
  String? flyingTime;
  String? departureDate;
  int? flightNumber;
  int? economy;
  int? business;
  int? firstClass;

  FlightModel(
      {this.prices,
        this.sId,
        this.plane,
        this.from,
        this.to,
        this.flyingTime,
        this.departureDate,
        this.flightNumber,
        this.economy,
        this.business,
        this.firstClass});

  FlightModel.fromJson(Map<String, dynamic> json) {
    prices =
    json['prices'] != null ? Prices.fromJson(json['prices']) : null;
    sId = json['_id'];
    plane = json['plane'];
    from = json['from'];
    to = json['to'];
    flyingTime = json['flyingTime'];
    departureDate = json['departureDate'];
    flightNumber = json['flightNumber'];
    economy = json['economy'];
    business = json['business'];
    firstClass = json['firstClass'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (prices != null) {
      data['prices'] = prices!.toJson();
    }
    data['_id'] = sId;
    data['plane'] = plane;
    data['from'] = from;
    data['to'] = to;
    data['flyingTime'] = flyingTime;
    data['departureDate'] = departureDate;
    data['flightNumber'] = flightNumber;
    data['economy'] = economy;
    data['business'] = business;
    data['firstClass'] = firstClass;
    return data;
  }
}

class Prices {
  int? economy;
  int? business;
  int? firstClass;

  Prices({this.economy, this.business, this.firstClass});

  Prices.fromJson(Map<String, dynamic> json) {
    economy = json['economy'];
    business = json['business'];
    firstClass = json['firstClass'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['economy'] = economy;
    data['business'] = business;
    data['firstClass'] = firstClass;
    return data;
  }
}
