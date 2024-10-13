import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:ticket_booking_app/models/auth/register_model.dart';
import 'package:ticket_booking_app/models/auth/responses/register_response_model.dart';
import 'package:ticket_booking_app/utils/hero_static/end_points.dart';
import 'package:ticket_booking_app/utils/hero_static/request_status.dart';
import 'package:ticket_booking_app/utils/remote/dio_helper.dart';

class RegisterNotifier extends ChangeNotifier{
  DioHelper helper = DioHelper();
  late GlobalKey<FormState> formKey;
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  RequestStatus _requestStatus = RequestStatus.COOL;

  RequestStatus get requestStatus => _requestStatus;

  set requestStatus(RequestStatus newStatus){
    _requestStatus = newStatus;
    notifyListeners();
  }


  bool _isPassword = true;

  bool get isPassword => _isPassword;

  set isPassword(bool newStatus){
    _isPassword = newStatus;
    notifyListeners();
  }

  Future<RequestStatus> userRegister(RegisterModel registerModel) async {
    requestStatus = RequestStatus.LOADING;

    try {
      var registerData = await helper.noAuthPostData(
        AppEndPoints.userSignUp,
        body: registerModel.toJson(),
      );

      RegisterResponseModel registerResponse = RegisterResponseModel.fromJson(registerData);

      if (registerResponse.status == 'success') {

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


  RegisterNotifier(){

    emailController = TextEditingController();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    formKey = GlobalKey<FormState>();
  }
  @override
  void dispose() {
    emailController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

}