import 'package:flutter/material.dart';

ThemeData get darkTheme {
  return ThemeData(
      scaffoldBackgroundColor: Colors.black,
      primaryColor: Colors.white,
    brightness: Brightness.dark,
      textTheme: const TextTheme(
        titleLarge: TextStyle(
            color: Colors.white,
            fontSize: 22,fontWeight:FontWeight.w600
        ),
        titleMedium: TextStyle(
            color: Colors.white,
            fontSize: 22,fontWeight:FontWeight.w600
        ),
        titleSmall: TextStyle(
            color: Colors.white,
            fontSize: 18,fontWeight:FontWeight.w400
        ),
        headlineSmall: TextStyle(
            color: Colors.white,
            fontSize: 22,fontWeight:FontWeight.w600
        ),
      ),
      appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          elevation: 0,
          iconTheme: IconThemeData(
              size: 20,
              color: Colors.white
          )
      ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.black,
      selectedIconTheme: IconThemeData(
        color: Colors.white,
      ),
      unselectedIconTheme: IconThemeData(
        color: Colors.white38,
      ),
      elevation: 10,
      showSelectedLabels: false,showUnselectedLabels: false
    )
  );
}