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
          color: Colors.black,
          fontSize: 16,fontWeight:FontWeight.w600
        ),
        titleSmall: TextStyle(
          color: Colors.grey,
          fontSize: 14,fontWeight:FontWeight.w400
        ),
        headlineSmall: TextStyle(
          color: kLightThemeTextColor,
          fontSize: 26,fontWeight:FontWeight.bold
        ),
        headlineLarge: TextStyle(
          color: Colors.black,
          fontSize: 38,fontWeight:FontWeight.bold
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