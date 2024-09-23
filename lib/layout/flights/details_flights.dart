import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ticket_booking_app/models/tickets/ticket_model.dart';
import 'package:ticket_booking_app/providers/flights_notifier.dart';

class DetailsFlights extends StatelessWidget {
  const DetailsFlights({super.key});

  @override
  Widget build(BuildContext context) {
    final FlightsNotifier flightsNotifier = Provider.of<FlightsNotifier>(context);
    return Scaffold(
      body: Center(
        child: ElevatedButton(onPressed: (){
          TicketModel ticketModel = TicketModel(
            flight: "66f1431f8472d982d5ad0383",
            seatClass: "business",
            type: "one-way",
          );
          flightsNotifier.userTakeFlightTicket(ticketModel).then((flight){
            print("Heheeeeeeeee ${flight.toJson()}");
            if (flight.status == 'success') {
              print("Successfully Took a flight Ticket!!");
              String paymentGateway = flightsNotifier.paymentGateway;
              print("Payment Gateway Length: ${paymentGateway.length}");

              print("Flight paymentGateway: $paymentGateway");
            } else {
              print("Failed to book a flight Ticket!!");
              // print("The seat you want is not available for this flight!!");
            }
            // flightsNotifier.userTakeFlightTicket(ticketModel).then((response) {
            //   // Log the raw response directly
            //   debugPrint("Response: $response"); // No need to decode here
            //
            //   // Check if response is a Map
            //   if (response is Map<String, dynamic>) {
            //     // Check the status
            //     if (response['status'] == 'success') {
            //       debugPrint("Successfully took a flight ticket!!");
            //       flightsNotifier.paymentGateway = response['paymentGateway'];
            //       debugPrint("Flight paymentGateway: ${flightsNotifier.paymentGateway}");
            //     } else {
            //       debugPrint("Failed to book a flight ticket: ${response['message'] ?? 'Unknown error'}");
            //     }
            //   } else {
            //     debugPrint("Unexpected response type: ${response.runtimeType}");
            //   }
            // });

          });
        },
          child: Text("Book A Ticket")
        ),
      ),
    );
  }
}
