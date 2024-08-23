import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ticket_booking_app/constants.dart';
import 'package:ticket_booking_app/core/class/app_layout.dart';
import 'package:ticket_booking_app/layout/widgets/thick_container.dart';

import '../../../providers/language_notifier.dart';


class TicketUpperPart extends StatelessWidget {
  const TicketUpperPart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final langNotifier = Provider.of<LanguageNotifier>(context);
    bool isRTL = langNotifier.locale.languageCode.toLowerCase() == 'ar';
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(context, 16)),
      child: Row(
        children: [
          Text('NYC', style: Theme.of(context).textTheme.titleMedium),
          Expanded(child: Container()),
          const ThickContainer(color: kLightBlueColorColor,),
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
                        children: List.generate((constraints.constrainWidth() / 6).floor(), (_) => const SizedBox(width: 3,height: 1, child: DecoratedBox(decoration: BoxDecoration(color: kLightBlueColorColor),),)),
                      );
                    },
                  )
              ),
              Center(child: Transform.rotate(angle: isRTL ? -1.5 : 1.5, child: const Icon(Icons.local_airport_rounded,color: kLightBlueColorColor),)),
            ],
          )),
          const ThickContainer(color: kLightBlueColorColor,),
          Expanded(child: Container()),

          Text("LDN", style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 16),),

        ],
      ),
    );
  }
}
