import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ticket_booking_app/models/Booking/room_booking_model.dart';
import 'package:ticket_booking_app/models/Booking/room_booking_response.dart';
import 'package:ticket_booking_app/utils/helpers/dataService.dart';
import 'package:ticket_booking_app/utils/hero_static/end_points.dart';
import 'package:ticket_booking_app/utils/remote/dio_helper.dart';
import 'package:http/http.dart' as http;

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
  List<dynamic> bookingData = [];
  // Map<String, dynamic> data = {};

  Future<List<dynamic>> getHotelsData() async {
    hotels = await helper.getNoAuthData(AppEndPoints.getAllHotels);
    return hotels;
  }

  Future<dynamic> getHotelsDataById(String id) async {
    hotels = await helper.getNoAuthData('${AppEndPoints.getHotelById}/$id');
    return hotels;
  }


  Future<BookingRoomResponseModel> userBookARoom(RoomBookingModel roomBookingModel) async {
    var bookingData = await helper.postData(AppEndPoints.bookHotelRoom,
        body: roomBookingModel.toJson(),
        token: DataService.sharedPreferences.getString('userToken')!
    );
    BookingRoomResponseModel booking = BookingRoomResponseModel.fromJson(bookingData);
    // debugPrint('Your Gateway --> $_paymentGateway');
    return booking;
  }

  // Future<dynamic> userBookARoom(RoomBookingModel roomBookingModel) async {
  //   var bookingData = await makePostRequest(
  //     endPoint: AppEndPoints.bookHotelRoom,
  //     body: roomBookingModel.toJson(),
  //   );
  //   return bookingData;
  // }

  Future<void> makePostRequest({required Map<String, dynamic> body, required String endPoint}) async {
    // The URL to which you want to send the POST request
    final url = Uri.parse('${AppEndPoints.server}/$endPoint');

    // // The body of the request
    // final Map<String, dynamic> body = {
    //   'key1': 'value1',
    //   'key2': 'value2',
    // };

    try {
      // Sending the POST request
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${DataService.sharedPreferences.getString('userToken')!}'
        },
        body: jsonEncode(body),
      );

      // Check the response status
      if (response.statusCode == 200) {
        // Successfully received response
        print('Response data: ${response.body}');
      } else {
        // Error response
        print('Failed to post data: ${response.statusCode}');
        print('Response: ${response.body}');
      }
    } catch (e) {
      print('Error occurred: $e');
    }
  }

}