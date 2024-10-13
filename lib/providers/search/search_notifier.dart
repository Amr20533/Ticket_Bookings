import 'package:flutter/material.dart';
import 'package:ticket_booking_app/models/Hotels/hotel_response_model.dart';
import 'package:ticket_booking_app/utils/helpers/dataService.dart';
import 'package:ticket_booking_app/utils/hero_static/end_points.dart';
import 'package:ticket_booking_app/utils/remote/dio_helper.dart';

class SearchNotifier extends ChangeNotifier{
  DioHelper helper = DioHelper();
  late TextEditingController searchFlightsController ;
  int _selectedIndex = 0;

  List<dynamic> filteredHotels = [];
  int get selectedIndex => _selectedIndex;

  set selectedIndex(newValue){
    _selectedIndex = newValue;
    notifyListeners();
  }



  Future<List<dynamic>> searchForHotels() async {
    var response = await helper.userGetData(
        endPoint: '${AppEndPoints.getAllHotels}?hotelName=${searchFlightsController.text}',
        token: DataService.sharedPreferences.getString('userToken')!
    );
    print(response);


    var hotelResponse = HotelResponseModel.fromJson(response);
    return hotelResponse.data.hotels;
  }

  // Future<List<Hotel>> searchForHotels() async {
  //   var response = await helper.userGetData(
  //       endPoint: '${AppEndPoints.getAllHotels}?hotelName=${searchFlightsController.text}',
  //       token: DataService.sharedPreferences.getString('userToken')!
  //   );
  //
  //   return HotelResponseModel.fromJson(response).data.hotels;
  // }

    // searchFlightsController.addListener(searchForHotels);


    SearchNotifier(){
    searchFlightsController = TextEditingController();

    searchFlightsController.addListener(searchForHotels);
  }

  @override
  void dispose() {
    searchFlightsController.dispose();
    super.dispose();
  }

}