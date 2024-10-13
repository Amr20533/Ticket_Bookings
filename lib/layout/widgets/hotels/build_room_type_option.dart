import 'package:flutter/material.dart';
import 'package:ticket_booking_app/constants.dart';
import 'package:ticket_booking_app/providers/hotels_notifier.dart';

Widget buildRoomTypeOption(BuildContext context,{required String roomType, required HotelsNotifier hotelsNotifier, required VoidCallback onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Row(
      children: [
        Checkbox(
          value: hotelsNotifier.selectedRoom == roomType,
          activeColor: kPrimaryColor,
          onChanged: (bool? isChecked) {
            if (isChecked == true) {
              hotelsNotifier.selectedRoom = roomType;
            }
          },
        ),
        Text(roomType, style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.black),),
      ],
    ),
  );
}
