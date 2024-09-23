import 'package:flutter/material.dart';
import 'package:ticket_booking_app/constants.dart';
import 'package:ticket_booking_app/core/class/app_layout.dart';
import 'package:ticket_booking_app/providers/start/start_page_notifier.dart';

class CustomStartIndicator extends StatelessWidget {
  const CustomStartIndicator({
    required this.startPageNotifier,
    super.key,
  });
  final StartPageNotifier startPageNotifier;
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(startPageNotifier.screens.length, (index){
        bool isSelected = startPageNotifier.selectedImage == index;
        return AnimatedContainer(
          width: isSelected ? AppLayout.getWidth(context, 60) : AppLayout.getWidth(context, 14),
          height: AppLayout.getWidth(context, 6),
          margin: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(context, 3)),
          duration: const Duration(milliseconds: 600),
          curve: Curves.bounceInOut,
          decoration: BoxDecoration(
              color: isSelected ? kPrimaryColor : kGreyColor.withOpacity(0.3),
              borderRadius: BorderRadius.circular(AppLayout.getWidth(context, 4))
          ),
        );
      }),
    );
  }
}
