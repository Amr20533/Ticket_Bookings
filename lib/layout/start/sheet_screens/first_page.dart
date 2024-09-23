import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ticket_booking_app/constants.dart';
import 'package:ticket_booking_app/core/class/app_layout.dart';
import 'package:ticket_booking_app/core/localization/app_localization.dart';

class FirstSheetPage extends StatelessWidget {
  const FirstSheetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: AppLayout.getWidth(context, 290),
          child: Text(AppLocalizations.of(context).translate('easy-book'),
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Colors.black, fontFamily: 'DMSerif', fontWeight: FontWeight.w500, fontSize: 32),
            textAlign: TextAlign.center,
          ),
        ),
        Gap(AppLayout.getHeight(context, 10)),
        SizedBox(
          width: AppLayout.getWidth(context, 360),
          height: AppLayout.getHeight(context, 65),
          child: Text(AppLocalizations.of(context).translate('start-desc'),
            style: Theme.of(context).textTheme.titleSmall!.copyWith(color: kGreyColor.withOpacity(0.7), fontSize: 14, fontFamily: 'DMSerif'),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
