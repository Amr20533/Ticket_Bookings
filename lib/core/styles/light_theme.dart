import 'package:flutter/material.dart';
import 'package:ticket_booking_app/constants.dart';

ThemeData get lightTheme {
  return ThemeData(
    scaffoldBackgroundColor: kBackgroundColor,
    primaryColor: kPrimaryColor,
    brightness: Brightness.light,
      textTheme: const TextTheme(
        titleLarge: TextStyle(
          color: kLightThemeTextColor,
          fontSize: 22,fontWeight:FontWeight.w600
        ),
        titleMedium: TextStyle(
          color: kLightThemeTextColor,
          fontSize: 22,fontWeight:FontWeight.w600
        ),
        titleSmall: TextStyle(
          color: kLightThemeTextColor,
          fontSize: 18,fontWeight:FontWeight.w400
        ),
        headlineSmall: TextStyle(
          color: kLightThemeTextColor,
          fontSize: 22,fontWeight:FontWeight.w600
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedIconTheme: IconThemeData(
            color: Colors.blueGrey,
          ),
          unselectedIconTheme: IconThemeData(
            color: kUnselectedItemColor,
          ),
          elevation: 10,
          showSelectedLabels: false,showUnselectedLabels: false
      )
  );
}