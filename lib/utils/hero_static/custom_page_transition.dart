import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Route customPageTransition({required Widget widget}) {
  return PageRouteBuilder(

    transitionDuration: const Duration(seconds: 1),
    reverseTransitionDuration: const Duration(seconds: 1),
    pageBuilder: (context, animation, secondaryAnimation) => widget,
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
