import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:ticket_booking_app/layout/widgets/hotel_card.dart';
import 'package:ticket_booking_app/modules/hotels.dart';
import 'package:ticket_booking_app/providers/home_provider.dart';

class HotelSlider extends StatelessWidget {
  HotelSlider({super.key});

  final List hotels = hotelList;
  @override
  Widget build(BuildContext context) {
    final homeNotifier = Provider.of<HomeNotifier>(context);
    bool isRTL = homeNotifier.locale.languageCode.toLowerCase() == 'ar';
    return Container(
      height: 300,
      padding: isRTL ? const EdgeInsets.only(right: 16) : const EdgeInsets.only(left: 16),
      child: ListView.separated(
        itemCount: hotels.length,
        scrollDirection: Axis.horizontal,physics: const BouncingScrollPhysics(),
        shrinkWrap: true,itemBuilder: (context, index)=> HotelCard(price: hotels[index]['price'],image: hotels[index]['image'][0] ,destination: hotels[index]['destination'],place: hotels[index]['place'],),
        separatorBuilder: (context, _)=> const Gap(20),),
    );
  }
}
