import 'package:ticket_booking_app/utils/data/city_abbreviations.dart';

class TicketsFormatter{

  String getCityAbbreviation(String city) {
    // Check if the city is null or empty
    if (city.isEmpty) {
      return 'Unknown';
    }

    // Trim the city name
    String trimmedCity = city.trim();

    // Convert the city name to lowercase for comparison
    String? abbreviation = cityAbbreviations.entries
        .firstWhere(
          (entry) => entry.key.toLowerCase() == trimmedCity.toLowerCase(),
      orElse: () => const MapEntry('', 'Unknown'),
    ).value;

    return abbreviation;
  }

  /// A function to return text of 11 characters as ['668e 11f 2c50']
  String formatTicketId(String ticketId) {
    // Ensure the ticketId has at least 11 characters
    if (ticketId.length < 11) {
      return ticketId;
    }

    // Get the first 11 characters
    String first11 = ticketId.substring(0, 11);

    // Format as desired: split after 3, 2, and 4 characters
    String formatted = '${first11.substring(0, 3)} ${first11.substring(3, 5)} ${first11.substring(5, 9)}';

    return formatted;
  }

  String formatTicketNumber(String ticketNumber) {
    if (ticketNumber.length < 5) {
      return ticketNumber;
    }
    return ticketNumber.substring(0, 5);
  }

  String formatBookingCode(String bookingCode) {
    if (bookingCode.length < 6) {
      return bookingCode;
    }
    return bookingCode.substring(0, 6);
  }


}