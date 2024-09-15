import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:ticket_booking_app/core/styles/dark_theme.dart';
import 'package:ticket_booking_app/core/styles/light_theme.dart';
import 'package:ticket_booking_app/layout/home_page.dart';
import 'package:ticket_booking_app/layout/profile_page.dart';
import 'package:ticket_booking_app/layout/search_page.dart';
import 'package:ticket_booking_app/layout/ticket_page.dart';
import 'package:ticket_booking_app/models/Booking/room_booking_model.dart';
import 'package:ticket_booking_app/utils/helpers/dataService.dart';
import 'package:ticket_booking_app/utils/hero_static/end_points.dart';
import 'package:ticket_booking_app/utils/remote/dio_helper.dart';

class HotelsNotifier extends ChangeNotifier{
  DioHelper helper = DioHelper();

  String hotelId = '';
  String roomType = '';
  String startDate = '';
  String endDate = '';


  String _paymentGateway = '';

  String get paymentGateway => _paymentGateway;

  set paymentGateway(String newGateway){
    _paymentGateway = newGateway;
    notifyListeners();
  }

  List<dynamic> hotels = [];
  // Map<String, dynamic> data = {};

  Future<List<dynamic>> getHotelsData() async {
    hotels = await helper.getNoAuthData(AppEndPoints.getAllHotels);
    return hotels;
  }

  Future<dynamic> getHotelsDataById(String id) async {
    hotels = await helper.getNoAuthData('${AppEndPoints.getHotelById}/$id');
    return hotels;
  }


  Future<dynamic> userBookARoom(RoomBookingModel roomBookingModel) async {
    var bookingData = await helper.postData(AppEndPoints.bookHotelRoom,
        body: roomBookingModel.toJson(),
        token: DataService.sharedPreferences.getString('userToken')!
    );
    return bookingData;
  }
}