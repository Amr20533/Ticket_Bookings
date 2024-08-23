import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:ticket_booking_app/core/class/app_layout.dart';
import 'package:ticket_booking_app/layout/widgets/hotel_card.dart';
import 'package:ticket_booking_app/modules/hotels.dart';
import 'package:ticket_booking_app/providers/hotels_notifier.dart';
import 'package:ticket_booking_app/providers/language_notifier.dart';

class HotelSlider extends StatelessWidget {
  HotelSlider({super.key});

  final List hotels = hotelList;
  @override
  Widget build(BuildContext context) {
    double _height = AppLayout.getSize(context).height;
    double _width = AppLayout.getSize(context).width;
    final langNotifier = Provider.of<LanguageNotifier>(context);
    bool isRTL = langNotifier.locale.languageCode.toLowerCase() == 'ar';
    return FutureBuilder<List<dynamic>>(
      future: HotelsNotifier().getHotelsData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (snapshot.hasData) {
          List<dynamic> _hotels = snapshot.data!;
          return Container(
            height: _height * 0.39,
            padding: isRTL ? const EdgeInsets.only(right: 16) : const EdgeInsets.only(left: 16),
            child: ListView.separated(
              itemCount: _hotels.length,
              scrollDirection: Axis.horizontal,physics: const BouncingScrollPhysics(),
              shrinkWrap: true,itemBuilder: (context, index)=> HotelCard(width:_width * 0.5, price: _hotels[index]['room'][index]['price'],image: hotels[index]['image'][0] ,destination: _hotels[index]['country'],place: _hotels[index]['address'],),
              separatorBuilder: (context, _)=> const Gap(20),),
          );
        } else {
          return Text('No data available');
        }
      },
    );

  }
}
