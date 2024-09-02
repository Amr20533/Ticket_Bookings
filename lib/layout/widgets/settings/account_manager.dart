import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:ticket_booking_app/core/class/app_layout.dart';
import 'package:ticket_booking_app/core/localization/app_localization.dart';
import 'package:ticket_booking_app/layout/widgets/profile/custom_animated_popup_card.dart';
import 'package:ticket_booking_app/layout/widgets/profile/delete_account_card.dart';
import 'package:ticket_booking_app/layout/widgets/settings/custom_settings_app_bar.dart';
import 'package:ticket_booking_app/layout/widgets/settings/custom_settings_tile.dart';
import 'package:ticket_booking_app/layout/widgets/settings/password_manager.dart';
import 'package:ticket_booking_app/utils/hero_static/custom_page_transition.dart';

class AccountManager extends StatelessWidget {
  const AccountManager({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customSettingsAppBar(context, title: AppLocalizations.of(context).translate("terms")),
      body: Column(
        children: [
          Container(
            width: AppLayout.getScreenWidth(context),
            // height: AppLayout.getHeight(context, 300),
            margin: EdgeInsets.symmetric(vertical: AppLayout.getHeight(context, 20), horizontal: AppLayout.getWidth(context, 18)),
            padding: EdgeInsets.symmetric(vertical: AppLayout.getHeight(context, 8)),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                CustomSettingsTile(
                  onTap:(){
                    Navigator.of(context).push(customPageTransition(widget: const UpdatePasswordScreen()));
                },
                  title: AppLocalizations.of(context).translate("pass"),
                  icon: FluentSystemIcons.ic_fluent_person_accounts_filled,
                ),
                CustomSettingsTile(
                  onTap:(){
                    customAnimatedPopupCard(context,
                        content: const DeleteAccountCard());
                },
                  iconColor: Colors.red,
                  title: AppLocalizations.of(context).translate("acc"),
                  icon: FluentSystemIcons.ic_fluent_person_delete_regular,
                ),

              ],
            ),
          ),

        ],
      ),
    );
  }
}
