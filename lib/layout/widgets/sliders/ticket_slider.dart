import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:ticket_booking_app/core/class/app_layout.dart';
import 'package:ticket_booking_app/layout/widgets/ticket_box.dart';
import 'package:ticket_booking_app/modules/hotels.dart';
import 'package:ticket_booking_app/providers/flights_notifier.dart';
import 'package:ticket_booking_app/providers/home_provider.dart';
import 'package:ticket_booking_app/providers/language_notifier.dart';

class TicketSlider extends StatelessWidget {
  TicketSlider({super.key});
  // final List _tickets = tickets;
  @override
  Widget build(BuildContext context) {
    final langNotifier = Provider.of<LanguageNotifier>(context);
  bool isRTL = langNotifier.locale.languageCode.toLowerCase() == 'ar';
  return Container(
          padding: isRTL ? const EdgeInsets.only(right: 16) : const EdgeInsets.only(left: 16),
          height: 200,
          child: FutureBuilder<List<dynamic>>(
            future: FlightsNotifier().getAllFlights(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (snapshot.hasData) {
                List<dynamic> _tickets = snapshot.data!;
                return ListView.separated(
                  itemCount: _tickets.length,
                  scrollDirection: Axis.horizontal,physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,itemBuilder: (context, index)=> TicketBox(ticket: _tickets[index],),
                  separatorBuilder: (context, _)=> const Gap(20),);
              } else {
                return const Text('No data available');
              }
            },
          )
        );
  }
}
