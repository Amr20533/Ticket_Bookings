import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:ticket_booking_app/layout/primary_interfaces/home_page.dart';
import 'package:ticket_booking_app/layout/primary_interfaces/search_page.dart';
import 'package:ticket_booking_app/layout/settings/account/profile_page.dart';
import 'package:ticket_booking_app/layout/primary_interfaces/ticket_page.dart';

class HomeNotifier extends ChangeNotifier{
  int _curPage = 0;


 List<Widget> screens = const [
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





}