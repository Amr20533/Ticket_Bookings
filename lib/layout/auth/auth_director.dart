import 'package:flutter/material.dart';
import 'package:ticket_booking_app/core/const/routes.dart';
import 'package:ticket_booking_app/layout/auth/login_screen.dart';
import 'package:ticket_booking_app/layout/mainView.dart';
import 'package:ticket_booking_app/utils/helpers/dataService.dart';

class AuthDirector extends StatelessWidget {
  const AuthDirector({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
        future: Future.value(DataService.sharedPreferences.getBool('isLoggedIn')!) ,
        builder: (context, snapshot){
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text("Error while directing to Home Screen: ${snapshot.error}");
          } else if (snapshot.hasData) {
            if (snapshot.data == true) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                Navigator.pushReplacementNamed(context, AppRoutes.main);
              });
              return const SizedBox.shrink();
            } else {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                Navigator.pushReplacementNamed(context, AppRoutes.login);
              });
              return const SizedBox.shrink();
            }
          } else {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Navigator.pushReplacementNamed(context, AppRoutes.login);
            });
            return const SizedBox.shrink();
          }
        });
  }
}
