class AppEndPoints{
  // static const String server = 'http://10.0.2.2:3005';
  static const String server = 'https://booking-0xi6.onrender.com';
  // static const String server = 'https://booking-0xi6.onrender.com';

  /// *********************** Authentication ***********************
  static const String userLogin = 'api/v1/users/login';
  static const String userSignUp = 'api/v1/users/signUp';
  static const String userUpdateProfile = 'api/v1/users/udpateMe';
  static const String userUpdatePassword = 'api/v1/users/updateMyPassword';
  static const String userDeleteAccount = 'api/v1/users/deleteMe';
  static const String userGetProfileData = 'api/v1/users/Me';
  static const String userGetProfileDataById = 'api/v1/users/';
  static const String userForgotPassword = 'api/v1/users/forgotPassword';
  static const String userResetPassword = 'api/v1/users/resetPassword';

  /// *********************** Hotels ***********************
  static const String bookHotelRoom = 'api/v1/booking';
  static const String getAllHotels = 'api/v1/hotels';
  static const String getHotelById = 'api/v1/hotels';
  static const String addHotelToFavorite = 'api/v1/users/favorites/add-hotel-to-favorites';
  static const String removeHotelFromFavorite = 'api/v1/users/favorites/add-hotel-to-favorites';

  /// *********************** Flights ***********************
  static const String getAllFlights = 'api/v1/flight';
  static const String createFlight = 'api/v1/flight';
  static const String addReview = 'api/v1/reviewFlight';
  static const String getAllReview = 'api/v1/reviewFlight';


  /// *********************** Tickets ***********************
  static const String createFlightTicket = 'api/v1/flightticket';
  static const String cancelFlightTicket = 'api/v1/flightticket/refund';
  static const String getAllFlightTickets = 'api/v1/flightticket';

  /// *********************** Plane ***********************
  static const String createPlane = 'api/v1/plane';
  static const String getAllPlanes = 'api/v1/plane';


}