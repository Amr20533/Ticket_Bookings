import 'package:flutter/material.dart';
import 'package:ticket_booking_app/constants.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    required this.onPressed,
    required this.text,
    super.key,
  });
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(text,
        style: Theme.of(context).textTheme.titleMedium!.copyWith(color: kPrimaryColor),),);
  }
}
