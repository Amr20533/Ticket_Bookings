import 'package:flutter/material.dart';
import 'package:ticket_booking_app/layout/auth/register_screen.dart';

Route customRegisterTransition() {
  return PageRouteBuilder(

    transitionDuration: const Duration(seconds: 1),
    reverseTransitionDuration: const Duration(seconds: 1),
    pageBuilder: (context, animation, secondaryAnimation) => const RegisterScreen(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.easeInOut;

      final curvedAnimation = CurvedAnimation(
          parent: animation,
          curve: curve
      );

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      var offsetAnimation = animation.drive(tween);

      // return SlideTransition(
      //   position: offsetAnimation,
      //   child: child,
      // );
      return FadeTransition(
        opacity: curvedAnimation,
        child: child,
      );
    },
  );
}