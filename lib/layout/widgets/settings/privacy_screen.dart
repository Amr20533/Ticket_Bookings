import 'package:flutter/material.dart';
import 'package:ticket_booking_app/constants.dart';
import 'package:ticket_booking_app/core/class/app_layout.dart';
import 'package:ticket_booking_app/core/localization/app_localization.dart';
import 'package:ticket_booking_app/layout/widgets/settings/custom_settings_app_bar.dart';

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customSettingsAppBar(context, title: AppLocalizations.of(context).translate("policy")),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(context, 22)),
        child: SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: AppLayout.getHeight(context, 8)),
                child: Text('Last update: 1/9/2024', style: Theme.of(context).textTheme.titleSmall!.copyWith(color: kGreyColor, fontSize: 16),),
              ),
              Text(AppLocalizations.of(context).translate('read-privacy'),
                style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w400),),
              Padding(
                padding: EdgeInsets.symmetric(vertical: AppLayout.getHeight(context, 12)),
                child: Text(AppLocalizations.of(context).translate('policy'),
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(color: kPrimaryColor, fontWeight: FontWeight.bold, fontSize: 18),),
              ),
              Text(AppLocalizations.of(context).translate('privacy-policy'),
                style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w400),),
            ],
          ),
        ),
      ),

    );
  }
}
