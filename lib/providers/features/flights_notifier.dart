import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:ticket_booking_app/models/tickets/ticket_model.dart';
import 'package:ticket_booking_app/models/tickets/tickets_booking_response_model.dart';
import 'package:ticket_booking_app/utils/helpers/dataService.dart';
import 'package:ticket_booking_app/utils/hero_static/end_points.dart';
import 'package:ticket_booking_app/utils/hero_static/request_status.dart';
import 'package:ticket_booking_app/utils/remote/dio_helper.dart';

class FlightsNotifier extends ChangeNotifier{
  DioHelper helper = DioHelper();

  List<dynamic> flights = [];

  List<dynamic> flightTickets = [];
  RequestStatus _status = RequestStatus.COOL;

  List<String> seats = [
    'one-way',
    'round-trip',
  ];

  RequestStatus get status => _status;

  set status(RequestStatus newStatus){
    _status = newStatus;
    notifyListeners();
  }

  String _paymentGateway = '';

  String get paymentGateway => _paymentGateway;

  set paymentGateway(String newGateway){
    _paymentGateway = newGateway;
    notifyListeners();
  }
  String _flightId = '';

  String get flightId => _flightId;

  set flightId(String newId){
    _flightId = newId;
    notifyListeners();
  }

  String _errorMessage = '';

  String get errorMessage => _errorMessage;

  set errorMessage(String error){
    _errorMessage = error;
    notifyListeners();
  }

  String _selectedSeatClass = 'Economy';

  String get selectedSeatClass => _selectedSeatClass;

  set selectedSeatClass(String newPrice){
    _selectedSeatClass = newPrice;
    notifyListeners();
  }

  String _selectedSeat = '';

  String get selectedSeat => _selectedSeat;

  set selectedSeat(String newPrice){
    _selectedSeat = newPrice;
    notifyListeners();
  }

  Future<List<dynamic>> getAllFlights() async {
    flights = await helper.userGetData(
      endPoint: AppEndPoints.getAllFlights,
      token: DataService.sharedPreferences.getString('userToken')!
    );
    return flights;
  }


  Future<dynamic> getAllFlightTickets() async {
   try{
     var response = await helper.getBlankData(
         endPoint: AppEndPoints.getAllFlightTickets,
         token: DataService.sharedPreferences.getString('userToken')!
     );
     flightTickets = response['tickets'];
     return flightTickets;
   }catch (e){
     debugPrint("Error While Getting Tickets!! ($e)");
   }
  }

  Future<TicketsBookingResponseModel> userTakeFlightTicket(TicketModel ticketModel) async {
    _status = RequestStatus.LOADING;
    try {
      var ticketResponseData = await helper.postData(
        AppEndPoints.createFlightTicket,
        body: ticketModel.toJson(),
        token: DataService.sharedPreferences.getString('userToken')!,
      );

      if (ticketResponseData['status'] == 'fail') {
        _status = RequestStatus.FAILURE;
        errorMessage = ticketResponseData['message'];
        throw Exception(ticketResponseData['message']);
      }

      return TicketsBookingResponseModel.fromJson(ticketResponseData);
    } catch (e) {
      _status = RequestStatus.EXCEPTION;
      if (e is DioException) {
        final _errorDataMessage = e.response?.data['message'] ?? 'An unknown error occurred';
        debugPrint('DioError: ${e.response?.data}');
        errorMessage = _errorDataMessage;

        throw Exception(_errorDataMessage);
      } else {
        errorMessage = 'An unexpected error occurred: $e';
        throw Exception(errorMessage);
      }
    }
  }


  FlightsNotifier(){
    getAllFlights();
  }
}