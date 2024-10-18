import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ticket_booking_app/constants.dart';
import 'package:ticket_booking_app/core/class/app_layout.dart';
import 'package:ticket_booking_app/core/const/routes.dart';
import 'package:ticket_booking_app/models/Hotels/hotel_response_model.dart';
import 'package:ticket_booking_app/utils/hero_static/end_points.dart';

class HotelCard extends StatelessWidget {
  const HotelCard({
    required this.price,
    required this.hotel,
    required this.width,
    required this.image,
    super.key,
  });
  final Hotel hotel;
  final double width;
  final int price;
  final String image;

  @override
  Widget build(BuildContext context) {
    double _width = AppLayout.getSize(context).width;
    double _height = AppLayout.getSize(context).height;
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, AppRoutes.hotelsDetails,
          arguments: hotel,
        );
      },
      child: Container(
        width: width,
        // height: AppLayout.getHeight(context, 140),
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
                  image: NetworkImage(
                    '${AppEndPoints.server}/img/$image',
                  )
                ),
                // color: Colors.redAccent,
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            const Gap(10),
            Text(hotel.address, style: kLargeHeading(context).copyWith(fontSize: 22),maxLines: 2, overflow: TextOverflow.ellipsis,),
            const Gap(5),
            Text(hotel.country, style: kSmallText(context),),
            const Gap(5),
            Text('\$$price/night', style: kLargeHeading(context),),

          ],
        ),
      ),
    );
  }
}
