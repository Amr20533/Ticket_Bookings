import 'package:flutter/material.dart';
import 'package:ticket_booking_app/utils/end_points.dart';
import 'package:ticket_booking_app/utils/remote/dio_helper.dart';

class FlightsNotifier extends ChangeNotifier{
  DioHelper helper = DioHelper();

  List<dynamic> flights = [];

  Future<List<dynamic>> getAllFlights() async {
    flights = await helper.getNoAuthData(AppEndPoints.getAllFlights);
    return flights;
  }

}