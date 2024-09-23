import 'package:flutter/material.dart';
import 'package:ticket_booking_app/core/const/app_assets.dart';
import 'package:ticket_booking_app/layout/start/sheet_screens/first_page.dart';
import 'package:ticket_booking_app/layout/start/sheet_screens/second_page.dart';
import 'package:ticket_booking_app/layout/start/sheet_screens/third_page.dart';

class StartPageNotifier extends ChangeNotifier{
  int _selectedImage = 0;
  final PageController pageController = PageController();

  int get selectedImage => _selectedImage;

  set selectedImage(int newIndex){
    _selectedImage = newIndex;
    notifyListeners();
  }

  List<String> screens = [
    AppAssets.image_1,
    AppAssets.image_2,
    AppAssets.image_4,
    // AppAssets.image_3,
  ];

  List<Widget> bottomSheetScreens = const [
    FirstSheetPage(),
    SecondSheetPage(),
    ThirdSheetPage(),
  ];

  void nextPage(){
    if(selectedImage < 2){
      selectedImage ++;
      pageController.animateToPage(selectedImage,
          duration: const Duration(milliseconds: 600),
          curve: Curves.bounceInOut);
    }
  }

}