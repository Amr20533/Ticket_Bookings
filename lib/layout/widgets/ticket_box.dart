import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:ticket_booking_app/constants.dart';
import 'package:ticket_booking_app/core/class/app_layout.dart';
import 'package:ticket_booking_app/core/class/format_helper.dart';
import 'package:ticket_booking_app/core/localization/app_localization.dart';
import 'package:ticket_booking_app/layout/widgets/thick_container.dart';
import 'package:ticket_booking_app/layout/widgets/separator_bar.dart';
import 'package:ticket_booking_app/providers/home_provider.dart';


class TicketBox extends StatelessWidget {
  const TicketBox({required this.ticket,super.key});
  final Map<String, dynamic> ticket;
  @override
  Widget build(BuildContext context) {
    double _width = AppLayout.getSize(context).width;
    double _height = AppLayout.getSize(context).height;
    final homeNotifier = Provider.of<HomeNotifier>(context);
    bool isRTL = homeNotifier.locale.languageCode.toLowerCase() == 'ar';

    return Container(
      width: AppLayout.getSize(context).width * 0.82,
      height: 200,
      margin: EdgeInsets.only(top: _height * 0.01),
      child: Column(
        children: [
          /// The Blue Part of the Card
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: kUpperBoxColor,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(21), topRight: Radius.circular(21))
            ),
            child:Column(
              children: [
                Row(
                  children: [
                    Text(ticket['from']['code'], style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16)),
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

                    Text(ticket['to']['code'], style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16),),

                  ],
                ),
                const Gap(1),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(width: 100,
                        child: Text(ticket['from']['name'], style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.white),)),
                    Text(ticket['flying-time'], style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.white),),
                    SizedBox(width: 100,
                        child: Text(ticket['to']['name'], style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.white),textAlign: TextAlign.end,)),


                  ],
                )
                // Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Column(crossAxisAlignment: CrossAxisAlignment.start,
                //       children: [
                //       Text("NYC", style: Theme.of(context).textTheme.titleSmall,),
                //       const SizedBox(height: 5,),
                //       Text("New-York", style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.white),),
                //     ],),
                //     ThickContainer(),
                //     Column(crossAxisAlignment: CrossAxisAlignment.start,
                //       children: [
                //         Text("NYC", style: Theme.of(context).textTheme.titleSmall,),
                //         const SizedBox(height: 5,),
                //         Text("New-York", style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.white),),
                //       ],),
                //
                //   ],
                // )
              ],
            ),
          ),

          /// The Orange Part of the Card
          const SeparatorBar(),
          Container(
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
                        child: Text(FormatHelper().getCurrentTime(context), style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16),textAlign: TextAlign.center,)),
                    const Spacer(),
                    SizedBox(width: 90,
                        child: Text(ticket['number'].toString(), style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16),textAlign: TextAlign.end,)),
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
                // Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Column(crossAxisAlignment: CrossAxisAlignment.start,
                //       children: [
                //       Text("NYC", style: Theme.of(context).textTheme.titleSmall,),
                //       const SizedBox(height: 5,),
                //       Text("New-York", style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.white),),
                //     ],),
                //     ThickContainer(),
                //     Column(crossAxisAlignment: CrossAxisAlignment.start,
                //       children: [
                //         Text("NYC", style: Theme.of(context).textTheme.titleSmall,),
                //         const SizedBox(height: 5,),
                //         Text("New-York", style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.white),),
                //       ],),
                //
                //   ],
                // )
              ],
            ),
          ),

        ],
      ),
    );
  }

}

