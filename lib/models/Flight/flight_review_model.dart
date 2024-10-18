class FlightReview {
  String review;
  int rating;
  String ticketType;
  String ticketId;

  FlightReview({
    this.review = '',
    this.rating = 0,
    this.ticketType = '',
    this.ticketId = '',
  });

  factory FlightReview.fromJson(Map<String, dynamic> json) {
    return FlightReview(
      review: json['review'] ?? '',
      rating: json['rating'] ?? 0,
      ticketType: json['ticketType'] ?? '',
      ticketId: json['ticketId'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'review': review,
      'rating': rating,
      'ticketType': ticketType,
      'ticketId': ticketId,
    };
  }
}
