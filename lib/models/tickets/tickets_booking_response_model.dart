class TicketsBookingResponseModel {
  final String status;
  final String paymentGateway;

  TicketsBookingResponseModel({
    required this.status,
    required this.paymentGateway,
  });

  factory TicketsBookingResponseModel.fromJson(Map<String, dynamic> json) {
    return TicketsBookingResponseModel(
      status: json['status'] as String,
      paymentGateway: json['paymentGateway'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'paymentGateway': paymentGateway,
    };
  }
}
