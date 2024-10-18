import 'package:flutter/material.dart';
import 'package:ticket_booking_app/utils/helpers/dataService.dart';
import 'package:ticket_booking_app/utils/hero_static/end_points.dart';
import 'package:ticket_booking_app/utils/hero_static/request_status.dart';
import 'package:ticket_booking_app/utils/remote/dio_helper.dart';

class ReviewNotifier extends ChangeNotifier{
  DioHelper helper = DioHelper();
  TextEditingController reviewController = TextEditingController();

  List<dynamic> flights = [];

  RequestStatus _status = RequestStatus.COOL;

  RequestStatus get status => _status;

  set status(RequestStatus newStatus){
    _status = newStatus;
    notifyListeners();
  }

  String _paymentGateway = '';

  String get paymentGateway => _paymentGateway;

  set paymentGateway(String newGateway){
    _paymentGateway = newGateway;
    notifyListeners();
  }
  String _flightId = '';

  String get flightId => _flightId;

  set flightId(String newId){
    _flightId = newId;
    notifyListeners();
  }

  String _errorMessage = '';

  String get errorMessage => _errorMessage;

  set errorMessage(String error){
    _errorMessage = error;
    notifyListeners();
  }

  String _selectedSeatClass = 'Economy';

  String get selectedSeatClass => _selectedSeatClass;

  set selectedSeatClass(String newPrice){
    _selectedSeatClass = newPrice;
    notifyListeners();
  }

  String _selectedSeat = '';

  String get selectedSeat => _selectedSeat;

  set selectedSeat(String newPrice){
    _selectedSeat = newPrice;
    notifyListeners();
  }


  Future<void> getAllReviews() async {
    await helper.userGetData(
        endPoint: AppEndPoints.getAllReview,
        token: DataService.sharedPreferences.getString('userToken')!
    );
    debugPrint("Got Review Successfully ");
  }



  ReviewNotifier(){
    getAllReviews();
  }
}