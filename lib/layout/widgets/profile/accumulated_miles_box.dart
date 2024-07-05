import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ticket_booking_app/constants.dart';
import 'package:ticket_booking_app/core/class/app_layout.dart';
import 'package:ticket_booking_app/core/class/format_helper.dart';
import 'package:ticket_booking_app/core/localization/app_localization.dart';
import 'package:ticket_booking_app/layout/widgets/profile/accumulated_miles_read.dart';
import 'package:ticket_booking_app/layout/widgets/ticket/custom_ticket_box.dart';

class AccumulatedMilesBox extends StatelessWidget {
  const AccumulatedMilesBox({
    super.key,
    required double width,
    required double height,
  }) : _width = width, _height = height;

  final double _width;
  final double _height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _width,height: _height * 0.5,
      padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(context, 16)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(AppLocalizations.of(context).translate('acc-ml'), style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontSize: 24),),
          Gap(AppLayout.getHeight(context, 16)),
          Center(child: Text("192802", style: Theme.of(context).textTheme.headlineLarge!.copyWith(fontWeight: FontWeight.w500, fontSize: 45),)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(context, 16),vertical: AppLayout.getHeight(context, 16),),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(AppLocalizations.of(context).translate('ml-oc'), style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 16),),
                Text(FormatHelper().getSecondaryDate(context), style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 16),),
              ],
            ),
          ),
          AccumulatedMilesRead(title: "23 042",secTitle: "Airplane CO",subTitle:AppLocalizations.of(context).translate('ml') ,secSubTitle: AppLocalizations.of(context).translate('rec')),
          Gap(AppLayout.getHeight(context, 16)),
          AccumulatedMilesRead(title: "24",secTitle: "Shabrawi",subTitle:AppLocalizations.of(context).translate('ml') ,secSubTitle: AppLocalizations.of(context).translate('rec')),
          Gap(AppLayout.getHeight(context, 16)),
          AccumulatedMilesRead(title: "52 340",secTitle: "Exuma",subTitle:AppLocalizations.of(context).translate('ml') ,secSubTitle: AppLocalizations.of(context).translate('rec')),
          Gap(AppLayout.getHeight(context, 16)),
          Center(child: InkWell(onTap: (){},child: Text(AppLocalizations.of(context).translate('mr-ml'), style: Theme.of(context).textTheme.titleMedium!.copyWith(color: kPrimaryColor),))),


        ],
      ),
    );
  }
}
