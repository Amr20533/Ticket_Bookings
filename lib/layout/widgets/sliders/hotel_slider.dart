import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:ticket_booking_app/core/class/app_layout.dart';
import 'package:ticket_booking_app/layout/widgets/hotels/hotel_card.dart';
import 'package:ticket_booking_app/modules/hotels.dart';
import 'package:ticket_booking_app/providers/hotels_notifier.dart';
import 'package:ticket_booking_app/providers/settings/language_notifier.dart';
import 'package:ticket_booking_app/utils/hero_static/end_points.dart';

class HotelSlider extends StatelessWidget {
  const HotelSlider({super.key});

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
          debugPrint('Length --> ${_hotels.length}');
          return Container(
            height: AppLayout.getHeight(context, 320),
            padding: isRTL ? const EdgeInsets.only(right: 16) : const EdgeInsets.only(left: 16),
            child: ListView.separated(
              itemCount: _hotels.length,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                // Ensure that the room list exists and has at least one item
                final roomList = _hotels[index]['room'];
                final price = (roomList.isNotEmpty) ? roomList[0]['price'] : 0;
                final image = (_hotels[index]['images'].isNotEmpty) ? _hotels[index]['images'][0] : '';

                return HotelCard(
                  width: _width * 0.5,
                  price: price,
                  hotels: _hotels[index],
                  image: image,
                );
              },
              separatorBuilder: (context, _) => const Gap(20),
            ),
          );

        } else {
          return const Text('No data available');
        }
      },
    );

  }
}
