import 'package:flutter/material.dart';
import 'package:ticket_booking_app/utils/hero_static/end_points.dart';
import 'package:ticket_booking_app/utils/helpers/dataService.dart';
import 'package:ticket_booking_app/utils/remote/dio_helper.dart';

class ProfileNotifier extends ChangeNotifier{
  DioHelper helper = DioHelper();
  late GlobalKey<FormState> formKey;
  late TextEditingController emailController;
  late TextEditingController passwordController;

  bool isLoggedIn = DataService.sharedPreferences.getBool('isLoggedIn') ?? false;


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