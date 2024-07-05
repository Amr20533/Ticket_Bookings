import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:ticket_booking_app/constants.dart';
import 'package:ticket_booking_app/core/class/app_layout.dart';
import 'package:ticket_booking_app/core/localization/app_localization.dart';
import 'package:ticket_booking_app/providers/home_provider.dart';

class CustomAwardCard extends StatelessWidget {
  const CustomAwardCard({
    super.key,
    required double width,
    required double height,
  }) : _width = width, _height = height;

  final double _width;
  final double _height;

  @override
  Widget build(BuildContext context) {
    final homeNotifier = Provider.of<HomeNotifier>(context);
    bool isRTL = homeNotifier.locale.languageCode.toLowerCase() == 'ar';
    return Container(
      width: _width,height: _height * 0.12,
      margin: EdgeInsets.symmetric(vertical:_height * 0.03, horizontal:_width * 0.04),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(_width * 0.06),
        color: kPrimaryColor,
      ),
      child: Stack(
        children: [
          isRTL ? Positioned(
            top: -35,left: -35,
            child: Container(
              width: 100,height: 90,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(width: AppLayout.getWidth(context, 18), color: kBlueCircleColor)
              ),
            ),
          ) : Positioned(
            top: -35,right: -35,
            child: Container(
              width: 100,height: 90,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(width: AppLayout.getWidth(context, 18), color: kBlueCircleColor)
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(_width * 0.03),
            child: Row(
              children: [
                Container(
                  width: 55,height: 55,
                  margin: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(context, 16)),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(FluentSystemIcons.ic_fluent_lightbulb_filament_filled,size: 30, color: kPrimaryColor,),
                ),
                Center(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(AppLocalizations.of(context).translate('awards'), style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),),
                      Gap(AppLayout.getHeight(context, 3)),
                      Text(AppLocalizations.of(context).translate('the-award'), style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.white,fontSize: 16),)


                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
