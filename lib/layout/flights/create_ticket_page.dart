import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:ticket_booking_app/layout/flights/flights_exports.dart';
import 'package:ticket_booking_app/layout/payment/payment_view.dart';
import 'package:ticket_booking_app/layout/widgets/flight/user_created_ticket.dart';


class CreateTicketPage extends StatelessWidget {
  const CreateTicketPage({super.key, required this.flight});
  final dynamic flight;

  @override
  Widget build(BuildContext context) {
    double _width = AppLayout.getScreenWidth(context);
    double _height = AppLayout.getScreenHeight(context);
    final profileNotifier = Provider.of<ProfileNotifier>(context);
    final flightsNotifier = Provider.of<FlightsNotifier>(context);
    return flightsNotifier.paymentGateway.isEmpty ? Scaffold(
      appBar: customDetailsAppBar(context, title: AppLocalizations.of(context).translate("ur-ticket")),
      body: SafeArea(
        child: Column(
          children: [
            UserCreatedTicket(width: _width, height: _height, flight: flight, profileNotifier: profileNotifier),
            const Spacer(flex: 1,),
            Padding(
              padding: EdgeInsets.only(bottom: AppLayout.getHeight(context, 20)),
              child: CustomButton(onPressed: (){
                _payForTicket(flightsNotifier: flight);
              }, width: AppLayout.getWidth(context, 350),
                  height: AppLayout.getHeight(context, 45),
                  title: AppLocalizations.of(context).translate("pay-now"),
              ),
            )

          ],
        ),
      ),
    ) : PaymentView(url: flightsNotifier.paymentGateway);
  }

  void _payForTicket({required FlightsNotifier flightsNotifier}){
    TicketModel ticketModel = TicketModel(
      flight: flightsNotifier.flightId,
      seatClass: flightsNotifier.selectedSeatClass,
      type: flightsNotifier.selectedSeat
    );
    flightsNotifier.userTakeFlightTicket(ticketModel).then((ticketStatus){
      if(ticketStatus.status == 'success'){
        debugPrint('Booked a Flight success');
        flightsNotifier.paymentGateway = ticketStatus.paymentGateway;
      }else{
        debugPrint('Error While Booking a Flight :(');
      }
    });
  }
}


