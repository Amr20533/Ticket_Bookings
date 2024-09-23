import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ticket_booking_app/core/class/app_layout.dart';
import 'package:ticket_booking_app/layout/widgets/ticket/user_ticket_view.dart';
import 'package:ticket_booking_app/providers/flights_notifier.dart';

class TicketPage extends StatelessWidget {
  const TicketPage({super.key});

  @override
  Widget build(BuildContext context) {
    double _width = AppLayout.getScreenWidth(context);
    double _height = AppLayout.getScreenHeight(context);

    return FutureBuilder<dynamic>(
      future: FlightsNotifier().getAllFlightTickets(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (snapshot.hasData) {
          List<dynamic> tickets = snapshot.data!;
          return ListView.separated(
            itemCount: tickets.length,
            scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index)=> UserTicketView(height: _height, width: _width, tickets: tickets[index]),
            separatorBuilder: (context, _)=> const Gap(20),);
        } else {
          return const Text('No data available');
        }
      },
    );

  }
}




