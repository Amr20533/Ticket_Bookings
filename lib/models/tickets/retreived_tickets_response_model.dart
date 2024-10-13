class TicketResponseModel {
  final String status;
  final List<Ticket> tickets;

  TicketResponseModel({required this.status, required this.tickets});

  factory TicketResponseModel.fromJson(Map<String, dynamic> json) {
    var ticketList = json['tickets'] as List;
    List<Ticket> tickets = ticketList.map((i) => Ticket.fromJson(i)).toList();

    return TicketResponseModel(
      status: json['status'],
      tickets: tickets,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'tickets': tickets.map((ticket) => ticket.toJson()).toList(),
    };
  }
}

class Ticket {
  final String id;
  final String user;
  final String outboundFlight;
  final String returnFlight;
  final String seatClass;
  final DateTime outboundDate;
  final DateTime returnDate;
  final double price;
  final int version;
  final String status;
  final String type;

  Ticket({
    required this.id,
    required this.user,
    required this.outboundFlight,
    required this.returnFlight,
    required this.seatClass,
    required this.outboundDate,
    required this.returnDate,
    required this.price,
    required this.version,
    required this.status,
    required this.type,
  });

  factory Ticket.fromJson(Map<String, dynamic> json) {
    return Ticket(
      id: json['_id'],
      user: json['user'],
      outboundFlight: json['outboundFlight'],
      returnFlight: json['returnFlight'],
      seatClass: json['seatClass'],
      outboundDate: DateTime.parse(json['outboundDate']),
      returnDate: DateTime.parse(json['returnDate']),
      price: json['price'].toDouble(),
      version: json['__v'],
      status: json['status'],
      type: json['type'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'user': user,
      'outboundFlight': outboundFlight,
      'returnFlight': returnFlight,
      'seatClass': seatClass,
      'outboundDate': outboundDate.toIso8601String(),
      'returnDate': returnDate.toIso8601String(),
      'price': price,
      '__v': version,
      'status': status,
      'type': type,
    };
  }
}
