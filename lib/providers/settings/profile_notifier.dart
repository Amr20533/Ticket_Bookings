import 'package:flutter/material.dart';
import 'package:ticket_booking_app/models/profile/update_password.dart';
import 'package:ticket_booking_app/models/profile/update_profile_model.dart';
import 'package:ticket_booking_app/utils/hero_static/end_points.dart';
import 'package:ticket_booking_app/utils/helpers/dataService.dart';
import 'package:ticket_booking_app/utils/remote/dio_helper.dart';

class ProfileNotifier extends ChangeNotifier{
  DioHelper helper = DioHelper();
  late GlobalKey<FormState> formKey;
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController phoneController;
  late TextEditingController dateOfBirthController;
  late TextEditingController confirmPasswordController;

  bool isLoggedIn = DataService.sharedPreferences.getBool('isLoggedIn') ?? false;


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

  int _selectedGender = -1;

  int get selectedGender => _selectedGender;

  set selectedGender(int newValue){
    _selectedGender = newValue;
    notifyListeners();
  }



  Future<dynamic> updatePassword(UpdatePasswordModel updatePasswordModel) async {
    String? token = DataService.sharedPreferences.getString('userToken');
    try {
      var passwordData = await helper.postData(
        AppEndPoints.userUpdatePassword,
        token: token!,
        body: updatePasswordModel.toJson(),
      );

      return passwordData;
    } catch (e) {
      print('Error update user password: $e');
      return Future.error('Failed to update user password');
    }
  }

  Future<dynamic> updateProfile(UpdateProfileModel updateProfileModel) async {
    String? token = DataService.sharedPreferences.getString('userToken');
    try {
      var passwordData = await helper.postData(
        AppEndPoints.userUpdateProfile,
        token: token!,
        body: updateProfileModel.toJson(),
      );

      return passwordData;
    } catch (e) {
      print('Error update user profile: $e');
      return Future.error('Failed to update user profile');
    }
  }


  Future<dynamic> deleteAccount() async {
    String? token = DataService.sharedPreferences.getString('userToken');
    try {
      var deleteAccount = await helper.postData(
        AppEndPoints.userDeleteAccount,
        token: token!,
        body: {},
      );

      return deleteAccount;
    } catch (e) {
      print('Error delete user account: $e');
      return Future.error('Failed to delete user account');
    }
  }


  Future<dynamic> getUserData() async {
    String? token = DataService.sharedPreferences.getString('userToken');
    try {
      var profileData = await helper.userGetData(
        endPoint: AppEndPoints.userGetProfileData,
        token: token!,
      );

      return profileData['data']['data'];
    } catch (e) {
      print('Error fetching user data: $e');
      // Handles error appropriately, maybe return a default ProfileDataModel or rethrow
      return Future.error('Failed to fetch user data');
    }
  }


  void userLogout() async {
    DataService.setData(key: 'isLoggedIn', value: false);
    DataService.removeData(key: 'userToken');
    DataService.removeData(key: 'userId');
    notifyListeners();
  }






  ProfileNotifier(){
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    phoneController = TextEditingController();
    dateOfBirthController = TextEditingController();
    confirmPasswordController = TextEditingController();
    formKey = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    phoneController.dispose();
    dateOfBirthController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

}