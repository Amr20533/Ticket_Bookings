import 'package:flutter/material.dart';
import 'package:ticket_booking_app/models/profile/profile_data.dart';
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

  Map<String, dynamic> myProfile = {};

  DateTime _selectedDate = DateTime.now();

  DateTime get selectedDate => _selectedDate;

  set selectedDate(DateTime date){
    _selectedDate = date;
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

  String _selectedGender = 'NONE';

  String get selectedGender => _selectedGender;

  set selectedGender(String newValue){
    _selectedGender = newValue;
    notifyListeners();
  }

  final List<String> genders = [
  'male',
  'female'
  ];




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
      var passwordData = await helper.patchData(
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


  Future<Map<String, dynamic>?> getUserData() async {
    String? token = DataService.sharedPreferences.getString('userToken');

    if (token == null) {
      debugPrint('User token is null. Cannot fetch user data.');
      return null; // or return a default profile data
    }

    try {
      var profileData = await helper.getMyData(
        endPoint: AppEndPoints.userGetProfileData,
        token: token,
      );

      debugPrint('Profile data: $profileData');
      debugPrint('Token: $token');

      if (profileData['data'] != null) {
        myProfile = profileData['data']['data'];
        return myProfile;
      } else {
        debugPrint('No profile data found in response.');
        return null; // or handle accordingly
      }
    } catch (e) {
      debugPrint('Error fetching user data: $e');
      return Future.error('Failed to fetch user data: $e');
    }
  }



  void userLogout() async {
    DataService.setData(key: 'isLoggedIn', value: false);
    DataService.removeData(key: 'userToken');
    DataService.removeData(key: 'userId');
    notifyListeners();
  }






  ProfileNotifier(){
    getUserData();
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