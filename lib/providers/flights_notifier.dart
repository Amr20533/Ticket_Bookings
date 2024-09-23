import 'package:flutter/material.dart';
import 'package:ticket_booking_app/models/tickets/ticket_model.dart';
import 'package:ticket_booking_app/models/tickets/tickets_booking_response_model.dart';
import 'package:ticket_booking_app/utils/helpers/dataService.dart';
import 'package:ticket_booking_app/utils/hero_static/end_points.dart';
import 'package:ticket_booking_app/utils/remote/dio_helper.dart';

class FlightsNotifier extends ChangeNotifier{
  DioHelper helper = DioHelper();

  List<dynamic> flights = [];

  List<dynamic> flightTickets = [];

  String _paymentGateway = '';

  String get paymentGateway => _paymentGateway;

  set paymentGateway(String newGateway){
    _paymentGateway = newGateway;
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
    var ticketResponseData = await helper.postData(
      AppEndPoints.createFlightTicket,
      body: ticketModel.toJson(),
      token: DataService.sharedPreferences.getString('userToken')!,
    );

    TicketsBookingResponseModel tickets = TicketsBookingResponseModel.fromJson(ticketResponseData);
    return tickets;
  }

}