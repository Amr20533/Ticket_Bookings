import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ticket_booking_app/constants.dart';
import 'package:ticket_booking_app/core/class/format_helper.dart';
import 'package:ticket_booking_app/core/localization/app_localization.dart';

class FlightOrangePart extends StatelessWidget {
  const FlightOrangePart({super.key,
    required this.ticket,
  });

  final Map<String, dynamic> ticket;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
          color: kBottomBoxColor,
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(21), bottomRight: Radius.circular(21))
      ),
      child:Column(
        children: [
          Row(
            children: [
              SizedBox(width: 100,
                  child: Text(FormatHelper().getCurrentDate(context), style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16))),
              const Spacer(),
              SizedBox(width: 100,
                  child: Text(FormatHelper().formattedTime(context, ticket['departureDate']), style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16),textAlign: TextAlign.center,)),
              const Spacer(),
              SizedBox(width: 90,
                  child: Text(ticket['flightNumber'].toString(), style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16),textAlign: TextAlign.end,)),
            ],
          ),
          const Gap(1),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: 100,
                  child: Text(AppLocalizations.of(context).translate('home-date'), style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.white),)),
              Text(AppLocalizations.of(context).translate('home-dep-t'), style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.white),),
              SizedBox(width: 90,
                  child: Text(AppLocalizations.of(context).translate('home-number'), style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.white),textAlign: TextAlign.end,)),

            ],
          )
        ],
      ),
    );
  }
}
