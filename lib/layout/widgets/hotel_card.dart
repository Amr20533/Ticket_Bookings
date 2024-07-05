import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ticket_booking_app/constants.dart';
import 'package:ticket_booking_app/core/class/app_layout.dart';

class HotelCard extends StatelessWidget {
  const HotelCard({
    required this.price,
    required this.destination,
    required this.place,
    required this.image,
    super.key,
  });
  final int price;
  final String place;
  final String destination;
  final String image;

  @override
  Widget build(BuildContext context) {
    double _width = AppLayout.getSize(context).width;
    double _height = AppLayout.getSize(context).height;
    return Container(
      width: _width * 0.5,
      height: _height * 0.6,
      padding: EdgeInsets.all(_width * 0.03),
      decoration:BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(_width * 0.06),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: _width * 0.5,
            height: _height * 0.2,
            decoration:BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  'assets/image/$image',
                )
              ),
              // color: Colors.redAccent,
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          const Gap(10),
          Text(place, style: kLargeHeading(context),),
          const Gap(5),
          Text(destination, style: kSmallText(context),),
          const Gap(5),
          Text('\$$price/night', style: kLargeHeading(context),),

        ],
      ),
    );
  }
}
