import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ticket_booking_app/layout/auth/login_screen.dart';

Route customLoginTransition() {
  return PageRouteBuilder(

    transitionDuration: const Duration(seconds: 1),
    reverseTransitionDuration: const Duration(seconds: 1),
    pageBuilder: (context, animation, secondaryAnimation) => const LoginScreen(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const curve = Curves.easeInOut;

      final curvedAnimation = CurvedAnimation(
          parent: animation,
          curve: curve
      );

      return FadeTransition(
        opacity: curvedAnimation,
        child: child,
      );
    },
  );
}
