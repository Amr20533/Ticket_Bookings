import 'package:flutter/material.dart';
import 'package:ticket_booking_app/models/auth/forgot_password_model.dart';
import 'package:ticket_booking_app/utils/hero_static/end_points.dart';
import 'package:ticket_booking_app/utils/remote/dio_helper.dart';

class ForgotPasswordNotifier extends ChangeNotifier{
  DioHelper helper = DioHelper();
  late GlobalKey<FormState> formKey;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  String _resetEmail = '';

  String get resetEmail => _resetEmail;

  set resetEmail(String newMail){
    _resetEmail = newMail;
    notifyListeners();
  }

  bool _isPassword = true;

  bool get isPassword => _isPassword;

  set isPassword(bool newStatus){
    _isPassword = newStatus;
    notifyListeners();
  }

  bool _isConfirmPassword = true;

  bool get isConfirmPassword => _isConfirmPassword;

  set isConfirmPassword(bool newStatus){
    _isConfirmPassword = newStatus;
    notifyListeners();
  }

  String _verifyCode = '';

  String get verifyCode => _verifyCode;

  set verifyCode(String code){
    _verifyCode = code;
    notifyListeners();
  }


  Future<dynamic> userForgotPassword(ForgotPasswordModel forgotPasswordModel) async {
    try {
      var verifyData = await helper.noAuthPostData(
        AppEndPoints.userForgotPassword,
        body: forgotPasswordModel.toJson(),
      );

      debugPrint('Response data: $verifyData');
      return verifyData;

    } catch (e) {debugPrint('Error during forgot password request: $e');
      return null; // Return null or handle the error as needed
    }
  }




  ForgotPasswordNotifier(){
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    formKey = GlobalKey<FormState>();
  }
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

}