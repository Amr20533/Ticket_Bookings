import 'package:flutter/material.dart';

class ThickContainer extends StatelessWidget {
  const ThickContainer({this.color = Colors.white,super.key});
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(width: 2.5, color: color)
      ),
    );
  }
}
