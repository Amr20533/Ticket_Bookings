import 'package:flutter/material.dart';
import 'package:ticket_booking_app/core/localization/app_localization.dart';
import 'package:ticket_booking_app/layout/widgets/settings/custom_settings_app_bar.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customSettingsAppBar(context, title: AppLocalizations.of(context).translate("help")),
    );
  }
}
