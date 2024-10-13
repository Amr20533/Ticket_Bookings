import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:ticket_booking_app/core/class/app_layout.dart';
import 'package:ticket_booking_app/core/class/format_helper.dart';
import 'package:ticket_booking_app/core/localization/app_localization.dart';
import 'package:ticket_booking_app/layout/flights/build_flight_bottom_sheet.dart';
import 'package:ticket_booking_app/layout/widgets/common/custom_details_app_bar.dart';
import 'package:ticket_booking_app/layout/widgets/search/custom_button.dart';
import 'package:ticket_booking_app/layout/widgets/ticket/custom_ticket_divider.dart';
import 'package:ticket_booking_app/layout/widgets/ticket/ticket_upper_part.dart';
import 'package:ticket_booking_app/models/Flight/flight_model.dart';
import 'package:ticket_booking_app/providers/features/flights_notifier.dart';

class DetailsFlights extends StatelessWidget {
  const DetailsFlights({super.key, required this.flight});
  final dynamic flight;

  @override
  Widget build(BuildContext context) {
    double _width = AppLayout.getScreenWidth(context);
    double _height = AppLayout.getScreenHeight(context);
    return Scaffold(
      appBar: customDetailsAppBar(context, title: AppLocalizations.of(context).translate("create-ticket")),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppLayout.getHeight(context, 30)),
            child:   Container(
              width: _width,
              height: _height * 0.21,
              // alignment: Alignment.center,
              // padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                color: Colors.white,
              ),
              child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TicketUpperPart(outboundFlight: flight,),
                  const Gap(1),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(context, 16)),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(width: 100,
                            child: Text(FlightResponseModel.fromJson(flight).from!, style: Theme.of(context).textTheme.titleSmall)),
                        Text(FlightResponseModel.fromJson(flight).flyingTime!, style: Theme.of(context).textTheme.titleSmall),
                        SizedBox(width: 100,
                            child: Text(FlightResponseModel.fromJson(flight).to!, style: Theme.of(context).textTheme.titleSmall,textAlign: TextAlign.end,)),
                      ],
                    ),
                  ),
                  CustomTicketDivider(width: _width),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(context, 16)),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(width: 100,
                                child: Text(FormatHelper().getPrimaryDateFormat(context, FlightResponseModel.fromJson(flight).departureDate!), style: Theme.of(context).textTheme.titleMedium)
                            ),
                            const Spacer(),
                            SizedBox(width: 100,
                                child: Text(FormatHelper().formattedTime(context, FlightResponseModel.fromJson(flight).departureDate!), style: Theme.of(context).textTheme.titleMedium,textAlign: TextAlign.center,)),
                            const Spacer(),
                            SizedBox(width: 90,
                                child: Text("12162", style: Theme.of(context).textTheme.titleMedium,textAlign: TextAlign.end,)),
                          ],
                        ),
                        const Gap(1),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(width: 100,
                                child: Text(AppLocalizations.of(context).translate('home-date'), style: Theme.of(context).textTheme.titleSmall)),
                            Text(AppLocalizations.of(context).translate('home-dep-t'), style: Theme.of(context).textTheme.titleSmall),
                            SizedBox(width: 90,
                                child: Text(AppLocalizations.of(context).translate('home-number'), style: Theme.of(context).textTheme.titleSmall,textAlign: TextAlign.end,)),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 24),
          //   child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       Text('Price', style: Theme.of(context).textTheme.titleLarge),
          //       Gap(AppLayout.getHeight(context, 16)),
          //       Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         children: [
          //           FlightClassDropdown(prices: FlightResponseModel.fromJson(flight).prices!),
          //           Padding(
          //             padding: const EdgeInsets.symmetric(horizontal: 14),
          //             child: Text('\$${flightsNotifier.selectedSeatClassValue}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black),),
          //           )
          //         ],
          //       ),
          //     ],
          //   ),
          // ),
          const Spacer(flex: 1,),
          Padding(
            padding: EdgeInsets.only(bottom: AppLayout.getHeight(context, 20)),
            child: CustomButton(onPressed: (){
              buildFlightBottomSheet(context, flight: flight);
            }, width: AppLayout.getWidth(context, 350),
              height: AppLayout.getHeight(context, 45),
              title: AppLocalizations.of(context).translate("create-ticket"),
            ),
          )


        ],
      ),
    );
  }

}
