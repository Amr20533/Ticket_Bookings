import 'package:flutter/material.dart';
import 'package:ticket_booking_app/core/class/app_layout.dart';
import 'package:ticket_booking_app/core/localization/app_localization.dart';
import 'package:ticket_booking_app/layout/widgets/custom_details_app_bar.dart';
import 'package:ticket_booking_app/layout/widgets/hotel_card.dart';
import 'package:ticket_booking_app/modules/hotels.dart';
import 'package:ticket_booking_app/providers/hotels_notifier.dart';


class AllHotelsView extends StatelessWidget {
  AllHotelsView({super.key});
  final List hotels = hotelList;

  @override
  Widget build(BuildContext context) {
    double _width = AppLayout.getSize(context).width;
    return Scaffold(
      appBar: customDetailsAppBar(context, title: AppLocalizations.of(context).translate('all-hls')),
      body: FutureBuilder<List<dynamic>>(
        future: HotelsNotifier().getHotelsData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (snapshot.hasData) {
            List<dynamic> _hotels = snapshot.data!;
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(context, 14)),
              child: Wrap(
                direction: Axis.horizontal,
                children: List.generate(_hotels.length, (index) => Container(
                    margin: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(context, 6), vertical: AppLayout.getHeight(context, 6)),
                    child: HotelCard(width:_width * 0.43,
                      price: _hotels[index]['room'][index]['price'],
                      hotels: _hotels[index]
                    )),
                ),
              ),
            );
          } else {
            return const Text('No data available');
          }
        },
      ),
    );

  }

}

