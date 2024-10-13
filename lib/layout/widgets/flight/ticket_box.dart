import 'package:flutter/material.dart';
import 'package:ticket_booking_app/core/class/app_layout.dart';
import 'package:ticket_booking_app/core/const/routes.dart';
import 'package:ticket_booking_app/layout/widgets/flight/flight_blue_part.dart';
import 'package:ticket_booking_app/layout/widgets/flight/flight_orange_part.dart';
import 'package:ticket_booking_app/layout/widgets/flight/separator_bar.dart';


class TicketBox extends StatelessWidget {
  const TicketBox({required this.ticket,super.key});
  final Map<String, dynamic> ticket;
  @override
  Widget build(BuildContext context) {
    double _width = AppLayout.getSize(context).width;
    double _height = AppLayout.getSize(context).height;

    return GestureDetector(
      onTap: (){
        Navigator.of(context).pushNamed(AppRoutes.ticketsDetails, arguments: ticket);
      },
      child: Container(
        width: _width * 0.84,
        margin: EdgeInsets.only(top: _height * 0.01),
        child: Column(
          children: [
            FlightBluePart(ticket: ticket),
            const SeparatorBar(),
            FlightOrangePart(ticket: ticket),
          ],
        ),
      ),
    );
  }

}


