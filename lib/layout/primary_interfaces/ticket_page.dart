import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:ticket_booking_app/core/class/app_layout.dart';
import 'package:ticket_booking_app/core/localization/app_localization.dart';
import 'package:ticket_booking_app/layout/widgets/search/custom_filter_box.dart';
import 'package:ticket_booking_app/layout/widgets/ticket/user_ticket_view.dart';
import 'package:ticket_booking_app/models/tickets/retreived_tickets_response_model.dart';
import 'package:ticket_booking_app/providers/features/flights_notifier.dart';
import 'package:ticket_booking_app/providers/search/search_notifier.dart';

class TicketPage extends StatelessWidget {
  const TicketPage({super.key});

  @override
  Widget build(BuildContext context) {
    double _width = AppLayout.getScreenWidth(context);
    double _height = AppLayout.getScreenHeight(context);
    SearchNotifier search = Provider.of<SearchNotifier>(context);

    return FutureBuilder<dynamic>(
      future: FlightsNotifier().getAllFlightTickets(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (snapshot.hasData) {
          List<dynamic> tickets = snapshot.data!;
          return Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(AppLayout.getHeight(context, 16)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(context, 20), ),
                child: Text(AppLocalizations.of(context).translate('tk'), style:Theme.of(context).textTheme.headlineLarge),
              ),
              Gap(AppLayout.getHeight(context, 25)),
              CustomFilterBox(height: _height, width: _width, search: search, title: AppLocalizations.of(context).translate('cm'), subTitle: AppLocalizations.of(context).translate('prv'),),
              Gap(AppLayout.getHeight(context, 25)),

              SizedBox(
                height: AppLayout.getHeight(context, 575),
                child: ListView.separated(
                  itemCount: tickets.length,
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index)=> UserTicketView(
                      height: _height,
                      width: _width,
                      tickets: Ticket.fromJson(tickets[index])),
                  separatorBuilder: (context, _)=> const Gap(20),),
              ),
              // Gap(AppLayout.getHeight(context, 25)),
            ],
          );
        } else {
          return const Text('No data available');
        }
      },
    );

  }
}




