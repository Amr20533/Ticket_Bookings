import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ticket_booking_app/constants.dart';
import 'package:ticket_booking_app/core/class/app_layout.dart';

class CustomSecondaryInputField extends StatelessWidget {
  const CustomSecondaryInputField({
    super.key,
    required TextEditingController controller,
    required this.validator,
    required this.title,
    required this.keyboardType,
    this.hintText,
    this.secure = false,
    this.suffixIcon,
  }) : _controller = controller;

  final TextEditingController _controller;
  final String title;
  final String? hintText;
  final Widget? suffixIcon;
  final TextInputType keyboardType;
  final bool secure;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppLayout.getHeight(context, 85),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.titleMedium,),
          Gap(AppLayout.getHeight(context, 10)),
          SizedBox(
            height: AppLayout.getHeight(context, 50),
            child: Align(
              child: TextFormField(
                controller: _controller,
                obscureText: secure,
                keyboardType: keyboardType,
                // initialValue: hintText,
                decoration: InputDecoration(
                    hintText: hintText,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(AppLayout.getWidth(context, 12))),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(AppLayout.getWidth(context, 12)),
                        borderSide: const BorderSide(color: kPrimaryButtonColor, width: 1)
                    ),
                    contentPadding: const EdgeInsets.only(top: 3, left: 12, right: 12,),
                    suffixIcon: suffixIcon
                  //   enabledBorder: OutlineInputBorder(
                  //     borderRadius: BorderRadius.circular(AppLayout.getWidth(context, 12)),
                  //     borderSide: const BorderSide(color: kPrimaryButtonColor, width: 1)
                  // )
                ),
                validator: validator,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
