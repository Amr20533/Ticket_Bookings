class PlaneModel {
  String? planeName;
  int? numberOfPassengers;
  String? model;
  String? airline;

  PlaneModel(
      {this.planeName, this.numberOfPassengers, this.model, this.airline});

  PlaneModel.fromJson(Map<String, dynamic> json) {
    planeName = json['planeName'];
    numberOfPassengers = json['numberOfPassengers'];
    model = json['model'];
    airline = json['airline'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['planeName'] = planeName;
    data['numberOfPassengers'] = numberOfPassengers;
    data['model'] = model;
    data['airline'] = airline;
    return data;
  }
}
