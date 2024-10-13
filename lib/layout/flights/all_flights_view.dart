import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:ticket_booking_app/core/class/app_layout.dart';
import 'package:ticket_booking_app/core/localization/app_localization.dart';
import 'package:ticket_booking_app/layout/widgets/common/custom_details_app_bar.dart';
import 'package:ticket_booking_app/layout/widgets/flight/ticket_box.dart';
import 'package:ticket_booking_app/modules/hotels.dart';
import 'package:ticket_booking_app/providers/features/flights_notifier.dart';

class AllFlightsView extends StatelessWidget {
  const AllFlightsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customDetailsAppBar(context, title: AppLocalizations.of(context).translate('all-flights')),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(context, 16)),
        child: FutureBuilder<List<dynamic>>(
          future: FlightsNotifier().getAllFlights(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (snapshot.hasData) {
              print(snapshot.data!);
              List<dynamic> _tickets = snapshot.data!;
              return ListView.separated(
                itemCount: _tickets.length,
                scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index)=> TicketBox(ticket: _tickets[index]),
                separatorBuilder: (context, _)=> const Gap(20),);
            } else {
              return const Text('No data available');
            }
          },
        ),
      ),
    );
  }

}
