import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:ticket_booking_app/layout/flights/flights_exports.dart';

class UserCreatedTicket extends StatelessWidget {
  const UserCreatedTicket({
    super.key,
    required double width,
    required double height,
    required this.flight,
  }) : _width = width, _height = height;

  final double _width;
  final double _height;
  final dynamic flight;

  @override
  Widget build(BuildContext context) {
    final profile = Provider.of<ProfileNotifier>(context);
    final flightNotifier = Provider.of<FlightsNotifier>(context);
    return Container(
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
                Container(
                  padding: const EdgeInsets.all(16),
                  child:Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(width: 100,
                              child: Text(FormatHelper().getPrimaryDateFormat(context, FlightResponseModel.fromJson(flight).departureDate!), style: Theme.of(context).textTheme.titleMedium)),
                          // child: Text(FormatHelper().departureDateFormat(context, date: _tickets['outboundDate']), style: Theme.of(context).textTheme.titleMedium)),
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
                FutureBuilder<Map<String, dynamic>?>(
                  future: profile.getUserData(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else if (!snapshot.hasData || snapshot.data == null) {
                      return Text('No user data found.');
                    }
                    final profile = SubData.fromJson(snapshot.data!);
                    final fullName = '${profile.firstName} ${profile.lastName}';

                    return CustomTicketBox(
                      title: fullName,
                      secTitle: "0531698745",
                      subTitle: AppLocalizations.of(context).translate('psr'),
                      secSubTitle: AppLocalizations.of(context).translate('pst'),
                    );
                  },
                ),

                CustomTicketDivider(width: _width),

                CustomTicketBox(title: TicketsFormatter().formatTicketId(FlightResponseModel.fromJson(flight).plane!),secTitle: "B2SG2B",subTitle:AppLocalizations.of(context).translate('n-f-tk') ,secSubTitle: AppLocalizations.of(context).translate('bk-cd')),
                CustomTicketDivider(width: _width),

                CustomTicketBox(title: " *** 2462",secTitle: "\$${_getPrice(flightNotifier.selectedSeatClass.toLowerCase(), FlightResponseModel.fromJson(flight).prices!)}",subTitle:AppLocalizations.of(context).translate('pt-mtd') ,secSubTitle: AppLocalizations.of(context).translate('pr'), isPrice: true),
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
    );
  }
  int? _getPrice(String priceValue, Prices prices){
    if(priceValue == "economy"){
      return prices.economy!;
  }
    else if(priceValue == "business"){
      return prices.economy!;
  }
    else if(priceValue == "first class"){
      return prices.firstClass!;
  }
    else {
      return 0;
  }
    }
  }
