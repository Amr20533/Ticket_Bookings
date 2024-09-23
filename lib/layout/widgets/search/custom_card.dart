import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.title,
    required this.icon,
    required double height,
    required double width,
  }) : _height = height, _width = width;

  final double _height;
  final double _width;
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _height * 0.052,width: _width * 0.9,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(_width * 0.01),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.grey.shade400,),
          const Gap(10),
          Text(title, style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 15,color: Colors.black),),
        ],
      ),
    );
  }
}
