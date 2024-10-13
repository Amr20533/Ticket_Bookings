import 'package:flutter/material.dart';
import 'package:ticket_booking_app/constants.dart';
import 'package:ticket_booking_app/models/Flight/flight_model.dart';
import 'package:ticket_booking_app/providers/features/flights_notifier.dart';

Widget buildSeatPriceOption(BuildContext context, {required String seatType, required Prices prices, required FlightsNotifier flightsNotifier}) {
  final price = _getPrice(seatType, prices);

  return GestureDetector(
    onTap: () {
      flightsNotifier.selectedSeatClass = seatType;
    },
    child: Row(
      children: [
        Checkbox(
          value: flightsNotifier.selectedSeatClass == seatType,
          activeColor: kPrimaryColor,
          onChanged: (bool? isChecked) {
            if (isChecked == true) {
              flightsNotifier.selectedSeatClass = seatType;
            }
          },
        ),
        Text(
          seatType,
          style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.black, fontSize: 16),
        ),
        const Spacer(flex: 1),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Text(
            '\$${price ?? 0}',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black),
          ),
        ),
      ],
    ),
  );
}
int? _getPrice(String seatType, Prices prices) {
  switch (seatType) {
    case 'Economy':
      return prices.economy;
    case 'Business':
      return prices.business;
    case 'First Class':
      return prices.firstClass;
    default:
      return null;
  }
}
