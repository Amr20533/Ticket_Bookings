import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:ticket_booking_app/models/Hotels/favorite_model.dart';
import 'package:ticket_booking_app/utils/helpers/dataService.dart';
import 'package:ticket_booking_app/utils/hero_static/end_points.dart';
import 'package:ticket_booking_app/utils/hero_static/request_status.dart';
import 'package:ticket_booking_app/utils/remote/dio_helper.dart';

class FavoritesNotifier extends ChangeNotifier{
  DioHelper helper = DioHelper();

  RequestStatus _status = RequestStatus.COOL;


  RequestStatus get status => _status;

  set status(RequestStatus newStatus){
    _status = newStatus;
    notifyListeners();
  }

  String _errorMessage = '';

  String get errorMessage => _errorMessage;

  set errorMessage(String error){
    _errorMessage = error;
    notifyListeners();
  }

  Future<String> userAddHotelToFavorite(HotelFavoriteModel favoriteModel) async {
    _status = RequestStatus.LOADING;
    try {
      var favoriteResponseData = await helper.postData(
        AppEndPoints.addHotelToFavorite,
        body: favoriteModel.toJson(),
        token: DataService.sharedPreferences.getString('userToken')!,
      );

      if (favoriteResponseData['status'] == 'fail') {
        _status = RequestStatus.FAILURE;
        errorMessage = favoriteResponseData['message'];
        throw Exception(favoriteResponseData['message']);
      }

      return favoriteResponseData['status'];
    } catch (e) {
      _status = RequestStatus.EXCEPTION;
      if (e is DioException) {
        final _errorDataMessage = e.response?.data['message'] ?? 'An unknown error occurred';
        debugPrint('DioError: ${e.response?.data}');
        errorMessage = _errorDataMessage;

        throw Exception(_errorDataMessage);
      } else {
        errorMessage = 'An unexpected error occurred: $e';
        throw Exception(errorMessage);
      }
    }
  }


}