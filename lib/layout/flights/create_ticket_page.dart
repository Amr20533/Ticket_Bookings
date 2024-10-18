import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:ticket_booking_app/layout/flights/flights_exports.dart';
import 'package:ticket_booking_app/layout/payment/payment_view.dart';
import 'package:ticket_booking_app/layout/widgets/common/show_custom_toast.dart';
import 'package:ticket_booking_app/layout/widgets/flight/user_created_ticket.dart';
import 'package:ticket_booking_app/utils/helpers/request_message_helper.dart';
import 'package:ticket_booking_app/utils/hero_static/request_status.dart';

class CreateTicketPage extends StatefulWidget {
  const CreateTicketPage({super.key, required this.flight});
  final dynamic flight;

  @override
  State<CreateTicketPage> createState() => _CreateTicketPageState();
}

class _CreateTicketPageState extends State<CreateTicketPage> with SingleTickerProviderStateMixin{

  late AnimationController _fadeAnimationController;
  late Animation<double> _fadeAnimation;


  @override
  void initState() {
    super.initState();

    _fadeAnimationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _fadeAnimationController,
        curve: Curves.fastLinearToSlowEaseIn,
      ),
    );
    _fadeAnimationController.forward();
  }
  @override
  Widget build(BuildContext context) {
    double _width = AppLayout.getScreenWidth(context);
    double _height = AppLayout.getScreenHeight(context);
    final flightsNotifier = Provider.of<FlightsNotifier>(context);
    return flightsNotifier.paymentGateway.isEmpty ? Scaffold(
      appBar: customDetailsAppBar(context, title: AppLocalizations.of(context).translate("ur-ticket")),
      body: SafeArea(
        child: Column(
          children: [
            Gap(AppLayout.getHeight(context, 12)),
            UserCreatedTicket(width: _width, height: _height, flight: widget.flight),
            const Spacer(flex: 1,),
            Padding(
              padding: EdgeInsets.only(bottom: AppLayout.getHeight(context, 20)),
              child: CustomButton(onPressed: (){
                _payForTicket(context,flightsNotifier: flightsNotifier, opacity: _fadeAnimation);
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

  void _payForTicket(BuildContext context, {required FlightsNotifier flightsNotifier, required Animation<double> opacity}) {
    TicketModel ticketModel = TicketModel(
      flight: flightsNotifier.flightId,
      seatClass: flightsNotifier.selectedSeatClass.toLowerCase(),
      type: flightsNotifier.selectedSeat,
    );
    debugPrint("${ticketModel.toJson()}");

    try {
      flightsNotifier.userTakeFlightTicket(ticketModel).then((ticketStatus) {
        if (ticketStatus.status == 'success') {
          debugPrint('Booked a Flight success');
          showCustomToast(
            context,
            opacity: opacity,
            title: AppLocalizations.of(context).translate('create-ticket'),
            message: AppLocalizations.of(context).translate(RequestMessageHelper().getLoginMessage(RequestStatus.SUCCESS)),
            status: RequestStatus.SUCCESS,
          );
          flightsNotifier.paymentGateway = ticketStatus.paymentGateway;
        } else {
          showCustomToast(
            context,
            opacity: opacity,
            title: AppLocalizations.of(context).translate('create-ticket'),
            message: flightsNotifier.errorMessage,
            status: flightsNotifier.status,
          );
          debugPrint('Error While Booking a Flight :(');
        }
      });
    } catch (e) {
      showCustomToast(
        context,
        opacity: opacity,
        title: AppLocalizations.of(context).translate('create-ticket'),
        message: e.toString(),
        status: RequestStatus.FAILURE,
      );
      debugPrint('Caught error: $e');
    }
  }

  @override
  void dispose() {
    _fadeAnimationController.dispose();
    super.dispose();
  }
}


