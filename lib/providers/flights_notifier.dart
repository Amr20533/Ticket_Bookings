import 'package:flutter/material.dart';
import 'package:ticket_booking_app/utils/helpers/dataService.dart';
import 'package:ticket_booking_app/utils/hero_static/end_points.dart';
import 'package:ticket_booking_app/utils/remote/dio_helper.dart';

class FlightsNotifier extends ChangeNotifier{
  DioHelper helper = DioHelper();

  List<dynamic> flights = [];

  Future<List<dynamic>> getAllFlights() async {
    flights = await helper.userGetData(
      endPoint: AppEndPoints.getAllFlights,
      token: DataService.sharedPreferences.getString('userToken')!
    );
    return flights;
  }

}