import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ticket_booking_app/core/localization/app_localization.dart';
import 'package:ticket_booking_app/layout/widgets/ticket/bottom_sheet/build_flight_seat_option.dart';
import 'package:ticket_booking_app/layout/widgets/ticket/bottom_sheet/build_seat_price_option.dart';
import 'package:ticket_booking_app/models/Flight/flight_model.dart';
import 'package:ticket_booking_app/providers/features/flights_notifier.dart';

class FlightOptions extends StatefulWidget {
  const FlightOptions({super.key, required this.prices});
  final Prices prices;
  @override
  FlightOptionsState createState() => FlightOptionsState();
}

class FlightOptionsState extends State<FlightOptions> {
  bool showPrices = false;
  bool _isSeatsExpanded = false;
  bool _isPricesExpanded = false;

  void _toggleSeats() {
    setState(() {
      _isSeatsExpanded = !_isSeatsExpanded;
      if (_isSeatsExpanded) _isPricesExpanded = false;
    });
  }

  void _togglePrices() {
    setState(() {
      _isPricesExpanded = !_isPricesExpanded;
      if (_isPricesExpanded) _isSeatsExpanded = false;
    });
  }


  @override
  Widget build(BuildContext context) {
    final flightNotifier = Provider.of<FlightsNotifier>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Toggle for seat options
        GestureDetector(
            onTap: _toggleSeats,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalizations.of(context).translate("select-trip"),
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 18),
                  ),
                  Icon(_isSeatsExpanded ? Icons.keyboard_arrow_up : Icons.arrow_drop_down, color: Colors.black,),
                ],
              ),
            )
        ),
        if (_isSeatsExpanded)
          Column(
            children: List.generate(flightNotifier.seats.length, (index) {
              return buildFlightSeatOption(
                context,
                onTap: () {
                  flightNotifier.selectedSeat = flightNotifier.seats[index];
                },
                flightsNotifier: flightNotifier,
                seatType: flightNotifier.seats[index],
              );
            }),
          ),

        // Toggle for pricing options
        GestureDetector(
          onTap: _togglePrices,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocalizations.of(context).translate("select-price"),
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 18),
                ),
                Icon(_isPricesExpanded ? Icons.keyboard_arrow_up : Icons.arrow_drop_down, color: Colors.black,),
              ],
            ),
          ),
        ),
        if (_isPricesExpanded)
          Column(
            children: [
              if (widget.prices.economy != null)
                buildSeatPriceOption(
                  context,
                  seatType: 'Economy',
                  prices: widget.prices,
                  flightsNotifier: flightNotifier,
                ),
              if (widget.prices.business != null)
                buildSeatPriceOption(
                  context,
                  seatType: 'Business',
                  prices: widget.prices,
                  flightsNotifier: flightNotifier,
                ),
              if (widget.prices.firstClass != null)
                buildSeatPriceOption(
                  context,
                  seatType: 'First Class',
                  prices: widget.prices,
                  flightsNotifier: flightNotifier,
                ),
            ],
          ),
      ],
    );
  }
}