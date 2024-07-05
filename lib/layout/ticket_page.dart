import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:ticket_booking_app/constants.dart';
import 'package:ticket_booking_app/core/class/app_layout.dart';
import 'package:ticket_booking_app/core/class/format_helper.dart';
import 'package:ticket_booking_app/core/localization/app_localization.dart';
import 'package:ticket_booking_app/layout/widgets/search/custom_filter_box.dart';
import 'package:ticket_booking_app/layout/widgets/thick_container.dart';
import 'package:ticket_booking_app/layout/widgets/ticket/custom_ticket_box.dart';
import 'package:ticket_booking_app/layout/widgets/ticket/custom_ticket_divider.dart';
import 'package:ticket_booking_app/layout/widgets/ticket/ticket_upper_part.dart';
import 'package:ticket_booking_app/layout/widgets/ticket_box.dart';
import 'package:ticket_booking_app/modules/hotels.dart';
import 'package:ticket_booking_app/providers/search_notifier.dart';

class TicketPage extends StatelessWidget {
  TicketPage({super.key});
  final List _tickets = tickets;

  @override
  Widget build(BuildContext context) {
    double _width = AppLayout.getScreenWidth(context);
    double _height = AppLayout.getScreenHeight(context);
    final search = Provider.of<SearchNotifier>(context);

    return ListView(
        children: [
        Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Gap(AppLayout.getHeight(context, 16)),
        Padding(
        padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(context, 20), ),
        child: Text(AppLocalizations.of(context).translate('tk'), style:Theme.of(context).textTheme.headlineLarge),
        ),
        Gap(AppLayout.getHeight(context, 25)),
        CustomFilterBox(height: _height, width: _width, search: search, title: AppLocalizations.of(context).translate('cm'), subTitle: AppLocalizations.of(context).translate('prv'),),
          Gap(AppLayout.getHeight(context, 25)),


        Stack(alignment: Alignment.center,
          children: [
            Container(
              width: _width,
              height: _height * 0.6,
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
                        const TicketUpperPart(),
                        const Gap(1),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(context, 16)),
                          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(width: 100,
                                  child: Text("New York", style: Theme.of(context).textTheme.titleSmall)),
                              Text("08H 30M", style: Theme.of(context).textTheme.titleSmall),
                              SizedBox(width: 100,
                                  child: Text("London", style: Theme.of(context).textTheme.titleSmall,textAlign: TextAlign.end,)),


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
                                      child: Text(FormatHelper().getCurrentDate(context), style: Theme.of(context).textTheme.titleMedium)),
                                  const Spacer(),
                                  SizedBox(width: 100,
                                      child: Text(FormatHelper().getCurrentTime(context), style: Theme.of(context).textTheme.titleMedium,textAlign: TextAlign.center,)),
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
                        CustomTicketBox(title: "Flutter DB",secTitle: "0531698745",subTitle:AppLocalizations.of(context).translate('psr') ,secSubTitle: AppLocalizations.of(context).translate('pst')),
                        CustomTicketDivider(width: _width),

                        CustomTicketBox(title: "0005 444 7714",secTitle: "B2SG2B",subTitle:AppLocalizations.of(context).translate('n-f-tk') ,secSubTitle: AppLocalizations.of(context).translate('bk-cd')),
                        CustomTicketDivider(width: _width),

                        CustomTicketBox(title: " *** 2462",secTitle: "\$299.94",subTitle:AppLocalizations.of(context).translate('pt-mtd') ,secSubTitle: AppLocalizations.of(context).translate('pr'), isPrice: true),
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
            Container(
              margin: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(context, 16)),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(width: 18,height: 18,
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                        border: Border.all(width: 2.5,color: Colors.black),
                        shape: BoxShape.circle
                    ),
                    child: const DecoratedBox(
                      decoration: BoxDecoration(
                          color: Colors.black,
                          shape: BoxShape.circle
                      ),
                    ),
                  ),
                  Container(width: 18,height: 18,
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                        border: Border.all(width: 2.5,color: Colors.black),
                        shape: BoxShape.circle
                    ),
                    child: const DecoratedBox(
                      decoration: BoxDecoration(
                          color: Colors.black,
                          shape: BoxShape.circle
                      ),
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
          Gap(AppLayout.getHeight(context, 25)),

          Center(child: TicketBox(ticket: _tickets[0],)),

        ]
                  ),
   ]
  );

  }
}



