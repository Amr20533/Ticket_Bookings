import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:ticket_booking_app/constants.dart';
import 'package:ticket_booking_app/layout/widgets/flight/thick_container.dart';
import 'package:ticket_booking_app/models/Flight/flight_model.dart';
import 'package:ticket_booking_app/providers/settings/language_notifier.dart';
import 'package:ticket_booking_app/utils/helpers/tickets_formatter.dart';

class FlightBluePart extends StatelessWidget {
  const FlightBluePart({
    super.key,
    required this.ticket,
  });

  final Map<String, dynamic> ticket;

  @override
  Widget build(BuildContext context) {
    final langNotifier = Provider.of<LanguageNotifier>(context);
    bool isRTL = langNotifier.locale.languageCode.toLowerCase() == 'ar';
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
          color: kUpperBoxColor,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(21), topRight: Radius.circular(21))
      ),
      child:Column(
        children: [
          Row(
            children: [
              Text(TicketsFormatter().getCityAbbreviation(FlightResponseModel.fromJson(ticket).from!), style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16)),
              Expanded(child: Container()),
              const ThickContainer(),
              Expanded(child: Stack(
                children: [
                  SizedBox(
                      height: 24,
                      child: LayoutBuilder(
                        builder: (context,constraints){
                          return Flex(
                            direction: Axis.horizontal,
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: List.generate((constraints.constrainWidth() / 6).floor(), (_) => const SizedBox(width: 3,height: 1, child: DecoratedBox(decoration: BoxDecoration(color: Colors.white),),)),
                          );
                        },
                      )
                  ),
                  Center(child: Transform.rotate(angle: isRTL ? -1.5 : 1.5, child: const Icon(Icons.local_airport_rounded,color: Colors.white,),)),
                ],
              )),
              const ThickContainer(),
              Expanded(child: Container()),

              Text(TicketsFormatter().getCityAbbreviation(FlightResponseModel.fromJson(ticket).to!), style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16),),

            ],
          ),
          const Gap(1),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: 100,
                  child: Text(ticket['from'], style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.white),)),
              Text(ticket['flyingTime'], style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.white),),
              SizedBox(width: 100,
                  child: Text(ticket['to'], style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.white),textAlign: TextAlign.end,)),


            ],
          )
        ],
      ),
    );
  }
}
