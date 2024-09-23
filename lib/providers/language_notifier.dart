import 'package:flutter/material.dart';
import 'package:ticket_booking_app/core/localization/app_localization.dart';
import 'package:ticket_booking_app/core/styles/dark_theme.dart';
import 'package:ticket_booking_app/core/styles/light_theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class LanguageNotifier extends ChangeNotifier{
 Locale _locale = const Locale('en');
 bool _isDarkMode = false;

 bool get isDarkMode => _isDarkMode;

 Locale get locale => _locale;


 List<Locale> locales = const[
   Locale('ar', ''),
   Locale('en', ''),
 ];

 Iterable<LocalizationsDelegate<dynamic>> delegates =const [
   AppLocalizations.delegate,
   GlobalMaterialLocalizations.delegate,
   GlobalWidgetsLocalizations.delegate,
   GlobalCupertinoLocalizations.delegate,
 ];


 void setLocale(Locale locale) {
   _locale = locale;
   notifyListeners();
 }


 ThemeData get currentTheme => _isDarkMode ? darkTheme : lightTheme;

 void toggleTheme() {
   _isDarkMode = !_isDarkMode;
   notifyListeners();
 }

}