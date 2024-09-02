import 'package:flutter/material.dart';
import 'package:ticket_booking_app/constants.dart';
import 'package:ticket_booking_app/core/class/app_layout.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required VoidCallback onPressed,
    required double width,
    required double height,
    this.fontWeight = FontWeight.w600,
    this.fontSize = 20,
    this.hPadding =  20,
    this.textColor =  Colors.white,
    this.border =  BorderSide.none,
    this.borderRadius =  26,
    this.buttonColor =  kPrimaryButtonColor,
    required String title,
  }) : _onPressed = onPressed, _width = width, _height = height, _title = title;

  final double _width;
  final double _height;
  final double fontSize;
  final double hPadding;
  final Color buttonColor;
  final Color textColor;
  final BorderSide border;
  final double borderRadius;
  final FontWeight fontWeight;
  final String _title;
  final VoidCallback _onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(width: _width,height: _height,
      padding: EdgeInsets.symmetric(horizontal: hPadding),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppLayout.getWidth(context, borderRadius)),
      ),
      child: MaterialButton(
        onPressed: _onPressed,
        color: buttonColor,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          side: border
        ),
        child: Text(_title, style: Theme.of(context).textTheme.titleLarge!.copyWith(color: textColor, fontSize: fontSize, fontWeight: fontWeight),),
      ),);
  }
}
