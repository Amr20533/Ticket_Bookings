import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:ticket_booking_app/core/class/app_layout.dart';
import 'package:ticket_booking_app/core/const/routes.dart';
import 'package:ticket_booking_app/core/localization/app_localization.dart';
import 'package:ticket_booking_app/layout/widgets/search/custom_button.dart';
import 'package:ticket_booking_app/layout/widgets/ticket/bottom_sheet/flight_options.dart';
import 'package:ticket_booking_app/models/Flight/flight_model.dart';
import 'package:ticket_booking_app/providers/features/flights_notifier.dart';

void buildFlightBottomSheet(BuildContext context, {required Map<String,dynamic> flight}) {
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      builder: (BuildContext context) {
        return Container(
          height: 400,
          width: double.infinity,
          padding: EdgeInsets.all(AppLayout.getHeight(context, 16)),
          child: Consumer<FlightsNotifier>(
              builder: (context, flightNotifier, child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Gap(AppLayout.getHeight(context, 12)),
                    Center(child: Text(AppLocalizations.of(context).translate("create-ticket"), style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 18), textAlign: TextAlign.center,)),
                    Gap(AppLayout.getHeight(context, 12)),
                    FlightOptions(prices: FlightResponseModel.fromJson(flight).prices!),
                    const Spacer(flex: 1,),
                    Padding(
                    padding: EdgeInsets.only(bottom: AppLayout.getHeight(context, 16)),
                    child: CustomButton(
                    onPressed: (){
                      flightNotifier.flightId = FlightResponseModel.fromJson(flight).sId!;
                      debugPrint("flight Id: ${flightNotifier.flightId}\nSelected Trip: ${flightNotifier.selectedSeat} \n Selected Seat Class: ${flightNotifier.selectedSeatClass}");
                      Navigator.of(context).pushNamed(AppRoutes.ticketCreate, arguments: flight);
                    }, width: AppLayout.getWidth(context, 350),
                      height: AppLayout.getHeight(context, 50),
                      title: AppLocalizations.of(context).translate("ur-ticket"),
                      // title: AppLocalizations.of(context).translate("view_ticket"),
                    ),),
                  ],
                );
              }
          ),
        );
      }
  );
}





