import 'package:flutter/material.dart';
import 'package:ticket_booking_app/models/auth/login_model.dart';
import 'package:ticket_booking_app/models/auth/login_response_model.dart';
import 'package:ticket_booking_app/models/auth/register_model.dart';
import 'package:ticket_booking_app/utils/end_points.dart';
import 'package:ticket_booking_app/utils/helpers/dataService.dart';
import 'package:ticket_booking_app/utils/remote/dio_helper.dart';

class RegisterNotifier extends ChangeNotifier{
  DioHelper helper = DioHelper();
  late GlobalKey<FormState> formKey;
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  bool _isLoggedIn = false;

  bool get isLoggedIn => _isLoggedIn;

  set isLoggedIn(bool newStatus){
    _isLoggedIn = newStatus;
    notifyListeners();
  }

  Future<dynamic> userLogin(LoginModel loginModel) async {
    var loginData = await helper.noAuthPostData(AppEndPoints.userLogin,
        body: loginModel.toJson()
    );
    LoginResponseModel loginResponse = LoginResponseModel.fromJson(loginData);

    DataService.setData(key: 'isLoggedIn', value: true);
    _isLoggedIn = DataService.sharedPreferences.getBool('isLoggedIn')!;
    DataService.setData(key: 'userToken', value: loginResponse.token);
    DataService.setData(key: 'userId', value: loginResponse.data.user!.sId!);
    return loginData;
  }

  Future<dynamic> userRegister(RegisterModel registerModel) async {
    var registerData = await helper.noAuthPostData(AppEndPoints.userSignUp,
        body: registerModel.toJson()
    );
    return registerData;
  }


  void userLogout() async {
    _isLoggedIn = DataService.setData(key: 'isLoggedIn', value: false);
    DataService.removeData(key: 'userToken');
    DataService.removeData(key: 'userId');
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