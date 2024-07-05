import 'package:flutter/material.dart';
import 'package:ticket_booking_app/core/class/app_layout.dart';

class CustomTicketBox extends StatelessWidget {
  const CustomTicketBox({
    this.isPrice = false,
    required this.title,
    required this.subTitle,
    required this.secSubTitle,
    required this.secTitle,
    super.key,
  });
  final bool isPrice;
  final String title;
  final String secTitle;
  final String subTitle;
  final String secSubTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(context, 16)),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              isPrice ? Row(
                children: [
                  Image.asset('assets/image/visa.jpg',scale: 11,),
                  Text(title, style: Theme.of(context).textTheme.titleMedium),
                ],
              )
                  :
              Text(title, style: Theme.of(context).textTheme.titleMedium),
              Text(subTitle, style: Theme.of(context).textTheme.titleSmall,),

            ],
          ),
          Column(crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(width: 100,
                  child: Text(secTitle, style: Theme.of(context).textTheme.titleMedium,textAlign: TextAlign.end,)),
              Text(secSubTitle, style: Theme.of(context).textTheme.titleSmall,textAlign: TextAlign.end,),
            ],
          ),
        ],
      ),
    );
  }
}
