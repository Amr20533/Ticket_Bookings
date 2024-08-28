import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:ticket_booking_app/core/styles/dark_theme.dart';
import 'package:ticket_booking_app/core/styles/light_theme.dart';
import 'package:ticket_booking_app/layout/home_page.dart';
import 'package:ticket_booking_app/layout/profile_page.dart';
import 'package:ticket_booking_app/layout/search_page.dart';
import 'package:ticket_booking_app/layout/ticket_page.dart';
import 'package:ticket_booking_app/utils/end_points.dart';
import 'package:ticket_booking_app/utils/remote/dio_helper.dart';

class HotelsNotifier extends ChangeNotifier{
  DioHelper helper = DioHelper();

  List<dynamic> hotels = [];
  // Map<String, dynamic> data = {};

  Future<List<dynamic>> getHotelsData() async {
    hotels = await helper.getNoAuthData(AppEndPoints.getAllHotels);
    return hotels;
  }

}