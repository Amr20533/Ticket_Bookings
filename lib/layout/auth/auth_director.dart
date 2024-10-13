import 'package:flutter/material.dart';
import 'package:ticket_booking_app/core/const/routes.dart';
import 'package:ticket_booking_app/utils/helpers/dataService.dart';

class AuthDirector extends StatelessWidget {
  const AuthDirector({super.key});

  void _navigateBasedOnAuthStatus(BuildContext context, bool isLoggedIn) {
    if (isLoggedIn) {
      Navigator.pushReplacementNamed(context, AppRoutes.main);
    } else {
      Navigator.pushReplacementNamed(context, AppRoutes.login);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool?>(
      future: Future.value(DataService.sharedPreferences.getBool('isLoggedIn')),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text("Error while directing to Home Screen: ${snapshot.error}"));
        } else if (snapshot.hasData) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            // Use the null-aware operator to check if snapshot.data is null
            _navigateBasedOnAuthStatus(context, snapshot.data ?? false);
          });
          return const Center(child: SizedBox());
        } else {
          // Handle the case when snapshot does not have data
          WidgetsBinding.instance.addPostFrameCallback((_) {
            _navigateBasedOnAuthStatus(context, false);
          });
          return const Center(child: SizedBox());
        }
      },
    );
  }
}
