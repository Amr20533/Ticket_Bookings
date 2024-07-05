import 'package:flutter/material.dart';

class SearchNotifier extends ChangeNotifier{
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  set selectedIndex(newValue){
    _selectedIndex = newValue;
    notifyListeners();
  }



}