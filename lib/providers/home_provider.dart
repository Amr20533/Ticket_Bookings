import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:ticket_booking_app/core/styles/dark_theme.dart';
import 'package:ticket_booking_app/core/styles/light_theme.dart';
import 'package:ticket_booking_app/layout/home_page.dart';
import 'package:ticket_booking_app/layout/profile_page.dart';
import 'package:ticket_booking_app/layout/search_page.dart';
import 'package:ticket_booking_app/layout/ticket_page.dart';

class HomeNotifier extends ChangeNotifier{
  int _curPage = 0;
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  Locale _locale = const Locale('en');

  List<Locale> locales = const[
    Locale('en', ''),
    Locale('ar', ''),
  ];
 List<Widget> screens = [
    HomePage(),
    SearchPage(),
    TicketPage(),
    ProfilePage(),
  ];

  List<BottomNavigationBarItem> items = const[
    BottomNavigationBarItem(icon: Icon(FluentSystemIcons.ic_fluent_home_regular), label: 'Home', activeIcon: Icon(FluentSystemIcons.ic_fluent_home_filled)),
    BottomNavigationBarItem(icon: Icon(FluentSystemIcons.ic_fluent_search_regular), label: 'Search', activeIcon: Icon(FluentSystemIcons.ic_fluent_search_filled)),
    BottomNavigationBarItem(icon: Icon(FluentSystemIcons.ic_fluent_ticket_regular), label: 'Tickets', activeIcon: Icon(FluentSystemIcons.ic_fluent_ticket_filled)),
    BottomNavigationBarItem(icon: Icon(FluentSystemIcons.ic_fluent_person_regular), label: 'Profile', activeIcon: Icon(FluentSystemIcons.ic_fluent_person_filled)),
  ];

  set curPage(nextPage){
    _curPage = nextPage;
    notifyListeners();
  }
  int get curPage => _curPage;




  ThemeData get currentTheme => _isDarkMode ? darkTheme : lightTheme;

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }


  Locale get locale => _locale;

  void setLocale(Locale locale) {
    _locale = locale;
    notifyListeners();
  }
}