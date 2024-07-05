import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:ticket_booking_app/layout/widgets/ticket_box.dart';
import 'package:ticket_booking_app/modules/hotels.dart';
import 'package:ticket_booking_app/providers/home_provider.dart';

class TicketSlider extends StatelessWidget {
  TicketSlider({super.key});
  final List _tickets = tickets;
  @override
  Widget build(BuildContext context) {
    final homeNotifier = Provider.of<HomeNotifier>(context);
    bool isRTL = homeNotifier.locale.languageCode.toLowerCase() == 'ar';
    return Container(
          padding: isRTL ? const EdgeInsets.only(right: 16) : const EdgeInsets.only(left: 16),
          height: 200,
          child: ListView.separated(
            itemCount: _tickets.length,
              scrollDirection: Axis.horizontal,physics: const BouncingScrollPhysics(),
              shrinkWrap: true,itemBuilder: (context, index)=> TicketBox(ticket: _tickets[index],),separatorBuilder: (context, _)=> const Gap(20),),
        );
  }
}
