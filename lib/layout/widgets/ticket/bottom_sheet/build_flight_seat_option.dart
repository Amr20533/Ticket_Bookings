import 'package:flutter/material.dart';
import 'package:ticket_booking_app/constants.dart';
import 'package:ticket_booking_app/providers/features/flights_notifier.dart';

Widget buildFlightSeatOption(BuildContext context,{required String seatType, required FlightsNotifier flightsNotifier, required VoidCallback onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Row(
      children: [
        Checkbox(
          value: flightsNotifier.selectedSeat == seatType,
          activeColor: kPrimaryColor,
          onChanged: (bool? isChecked) {
            if (isChecked == true) {
              flightsNotifier.selectedSeat = seatType;
            }
          },
        ),
        Text(seatType, style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.black, fontSize: 16),),
      ],
    ),
  );
}
