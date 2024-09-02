import 'package:flutter/material.dart';
import 'package:ticket_booking_app/constants.dart';
import 'package:ticket_booking_app/core/class/app_layout.dart';

class CustomInputField extends StatelessWidget {
  const CustomInputField({
    super.key,
    required TextEditingController controller,
    required this.validator,
    required this.label,
    this.hintText,
    this.secure = false,
    this.suffixIcon,
  }) : _controller = controller;

  final TextEditingController _controller;
  final String label;
  final String? hintText;
  final Widget? suffixIcon;
  final bool secure;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      obscureText: secure,
      decoration: InputDecoration(
          labelText: label,
          hintText: hintText,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(AppLayout.getWidth(context, 12))),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppLayout.getWidth(context, 12)),
              borderSide: const BorderSide(color: kPrimaryButtonColor, width: 1)
          ),
          suffixIcon: suffixIcon
        //   enabledBorder: OutlineInputBorder(
        //     borderRadius: BorderRadius.circular(AppLayout.getWidth(context, 12)),
        //     borderSide: const BorderSide(color: kPrimaryButtonColor, width: 1)
        // )
      ),
      validator: validator,
    );
  }
}
