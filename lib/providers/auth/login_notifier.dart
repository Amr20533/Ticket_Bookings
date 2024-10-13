import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ticket_booking_app/models/auth/login_model.dart';
import 'package:ticket_booking_app/models/auth/responses/login_response_model.dart';
import 'package:ticket_booking_app/utils/hero_static/end_points.dart';
import 'package:ticket_booking_app/utils/helpers/dataService.dart';
import 'package:ticket_booking_app/utils/hero_static/request_status.dart';
import 'package:ticket_booking_app/utils/remote/dio_helper.dart';

class LoginNotifier extends ChangeNotifier{
  DioHelper helper = DioHelper();
  late GlobalKey<FormState> formKey;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  RequestStatus _requestStatus = RequestStatus.COOL;

  bool _isLoggedIn = false;

  RequestStatus get requestStatus => _requestStatus;

  set requestStatus(RequestStatus newStatus){
    _requestStatus = newStatus;
    notifyListeners();
  }

  bool get isLoggedIn => _isLoggedIn;

  set isLoggedIn(bool newStatus){
    _isLoggedIn = newStatus;
    notifyListeners();
  }

  bool _isPassword = true;

  bool get isPassword => _isPassword;

  set isPassword(bool newStatus){
    _isPassword = newStatus;
    notifyListeners();
  }

  Future<RequestStatus> userLogin(LoginModel loginModel) async {
    requestStatus = RequestStatus.LOADING;

    try {
      var loginData = await helper.noAuthPostData(
        AppEndPoints.userLogin,
        body: loginModel.toJson(),
      );

      LoginResponseModel loginResponse = LoginResponseModel.fromJson(loginData);

      if (loginResponse.status == 'success') {
        DataService.setData(key: 'isLoggedIn', value: true);
        DataService.setData(key: 'userToken', value: loginResponse.token);
        DataService.setData(key: 'userId', value: loginResponse.data.user!.sId!);

        requestStatus = RequestStatus.SUCCESS;
      } else {
        requestStatus = RequestStatus.FAILURE;
      }
    } catch (e) {
      if (e is TimeoutException) {
        requestStatus = RequestStatus.TIMEOUT;
      } else if (e is SocketException) {
        requestStatus = RequestStatus.OFFLINE;
      } else {
        requestStatus = RequestStatus.INVALID_RESPONSE;
      }
    }

    return requestStatus;
  }



  void userLogout() async {
    _isLoggedIn = DataService.setData(key: 'isLoggedIn', value: false);
    DataService.removeData(key: 'userToken');
    DataService.removeData(key: 'userId');
  }






  LoginNotifier(){
    emailController = TextEditingController();
    passwordController = TextEditingController();
    formKey = GlobalKey<FormState>();
  }
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

}