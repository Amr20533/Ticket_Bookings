import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:ticket_booking_app/constants.dart';
import 'package:ticket_booking_app/core/class/app_layout.dart';
import 'package:ticket_booking_app/core/class/format_helper.dart';
import 'package:ticket_booking_app/core/localization/app_localization.dart';
import 'package:ticket_booking_app/layout/widgets/search/custom_filter_box.dart';
import 'package:ticket_booking_app/layout/widgets/ticket/custom_ticket_box.dart';
import 'package:ticket_booking_app/layout/widgets/ticket/custom_ticket_divider.dart';
import 'package:ticket_booking_app/layout/widgets/ticket/side_black_handles.dart';
import 'package:ticket_booking_app/layout/widgets/ticket/ticket_upper_part.dart';
import 'package:ticket_booking_app/layout/widgets/flight/ticket_box.dart';
import 'package:ticket_booking_app/models/Flight/flight_model.dart';
import 'package:ticket_booking_app/models/profile/profile_data.dart';
import 'package:ticket_booking_app/models/tickets/retreived_tickets_response_model.dart';
import 'package:ticket_booking_app/providers/features/flights_notifier.dart';
import 'package:ticket_booking_app/providers/search/search_notifier.dart';
import 'package:ticket_booking_app/providers/settings/profile_notifier.dart';
import 'package:ticket_booking_app/utils/helpers/tickets_formatter.dart';

class UserTicketView extends StatelessWidget {
  const UserTicketView({
    super.key,
    required double height,
    required double width,
    required Ticket tickets,
  }) : _height = height, _width = width, _tickets = tickets;

  final double _height;
  final double _width;
  final Ticket _tickets;

  @override
  Widget build(BuildContext context) {
    final flightsNotifier = Provider.of<FlightsNotifier>(context);
    final profileNotifier = Provider.of<ProfileNotifier>(context);
    final outboundFlight = flightsNotifier.flights.firstWhere((flight) => flight['_id'] == _tickets.outboundFlight);
    return Stack(alignment: Alignment.center,
      children: [
        Container(
          width: _width,
          height: _height * 0.60,
          margin: EdgeInsets.symmetric(horizontal: AppLayout.getHeight(context, 30)),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            color: Colors.white,
          ),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: AppLayout.getHeight(context, 16)),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(21), topRight: Radius.circular(21))
                ),
                child:Column(
                  children: [
                    TicketUpperPart(outboundFlight: outboundFlight,),
                    const Gap(1),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(context, 16)),
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(width: 100,
                              child: Text(FlightResponseModel.fromJson(outboundFlight).from!, style: Theme.of(context).textTheme.titleSmall)),
                          Text(FlightResponseModel.fromJson(outboundFlight).flyingTime!, style: Theme.of(context).textTheme.titleSmall),
                          SizedBox(width: 100,
                              child: Text(FlightResponseModel.fromJson(outboundFlight).to!, style: Theme.of(context).textTheme.titleSmall,textAlign: TextAlign.end,)),
                        ],
                      ),
                    ),
                    CustomTicketDivider(width: _width),
                    Container(
                      padding: const EdgeInsets.all(16),
                      child:Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(width: 100,
                                  child: Text(FormatHelper().getPrimaryDateFormat(context, FlightResponseModel.fromJson(outboundFlight).departureDate!), style: Theme.of(context).textTheme.titleMedium)),
                                  // child: Text(FormatHelper().departureDateFormat(context, date: _tickets['outboundDate']), style: Theme.of(context).textTheme.titleMedium)),
                              const Spacer(),
                              SizedBox(width: 100,
                                  child: Text(FormatHelper().formattedTime(context, FlightResponseModel.fromJson(outboundFlight).departureDate!), style: Theme.of(context).textTheme.titleMedium,textAlign: TextAlign.center,)),
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
                    CustomTicketBox(title: '${SubData.fromJson(profileNotifier.myProfile).firstName} ${SubData.fromJson(profileNotifier.myProfile).lastName}',
                        secTitle: "0531698745",
                        subTitle:AppLocalizations.of(context).translate('psr') ,
                        secSubTitle: AppLocalizations.of(context).translate('pst')
                    ),
                    CustomTicketDivider(width: _width),

                    CustomTicketBox(title: TicketsFormatter().formatTicketId(_tickets.id),secTitle: "B2SG2B",subTitle:AppLocalizations.of(context).translate('n-f-tk') ,secSubTitle: AppLocalizations.of(context).translate('bk-cd')),
                    CustomTicketDivider(width: _width),

                    CustomTicketBox(title: " *** 2462",secTitle: "\$${_tickets.price}",subTitle:AppLocalizations.of(context).translate('pt-mtd') ,secSubTitle: AppLocalizations.of(context).translate('pr'), isPrice: true),
                    Gap(AppLayout.getHeight(context, 16)),
                    Divider(height:1, color: kLightGreyColor.withOpacity(0.3),),
                    Gap(AppLayout.getHeight(context, 16)),

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(context, 16)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(AppLayout.getWidth(context, 16)),
                        child: BarcodeWidget(
                          barcode: Barcode.code128(),
                          data: 'https://github.com/Amr20533',
                          drawText: false,
                          color: kLightThemeTextColor,
                          width: _width,
                          height: _height * 0.1,
                        ),
                      ),
                    ),



                  ],
                ),
              ),

            ],
          ),
        ),
        const SideBlackHandles(),

      ],
    );
  }
}

