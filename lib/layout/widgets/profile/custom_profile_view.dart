import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:ticket_booking_app/constants.dart';
import 'package:ticket_booking_app/core/class/app_layout.dart';
import 'package:ticket_booking_app/core/const/routes.dart';
import 'package:ticket_booking_app/core/localization/app_localization.dart';
import 'package:ticket_booking_app/layout/widgets/profile/edit_profile_page.dart';
import 'package:ticket_booking_app/layout/widgets/settings/account_manager.dart';
import 'package:ticket_booking_app/layout/widgets/settings/custom_settings_tile.dart';
import 'package:ticket_booking_app/providers/settings/language_notifier.dart';
import 'package:ticket_booking_app/providers/settings/profile_notifier.dart';
import 'package:ticket_booking_app/utils/hero_static/custom_page_transition.dart';
import 'package:ticket_booking_app/utils/hero_static/end_points.dart';

import '../../../models/profile/profile_data.dart';

class CustomProfileView extends StatelessWidget {
  const CustomProfileView({
    super.key,
    required double width,
    required this.data,
    required this.locale,
  }) : _width = width;

  final double _width;
  final dynamic data;
  final LanguageNotifier locale;

  @override
  Widget build(BuildContext context) {
    final profile = Provider.of<ProfileNotifier>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Gap(AppLayout.getHeight(context, 20)),
        // Text(AppLocalizations.of(context).translate("prof")),
        Container(
          width: _width,
          height: AppLayout.getHeight(context, 80),
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          margin: const EdgeInsets.symmetric(horizontal: 18.0),
          decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.circular(AppLayout.getWidth(context, 8))
          ),
        child: Row(
        children: [
          CircleAvatar(
            radius: AppLayout.getWidth(context, 28),
            backgroundColor: Colors.white,
            child: CircleAvatar(
            radius: AppLayout.getWidth(context, 25),
            backgroundColor: Colors.red,
              backgroundImage: NetworkImage(
                '${AppEndPoints.server}/img/${SubData.fromJson(data).photo}',
              ),
          ),
        ),
          Padding(
          padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(context, 8)),
          child: Row(
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start,mainAxisSize: MainAxisSize.min,
            children: [
              Text("${SubData.fromJson(data).firstName} ${SubData.fromJson(data).lastName}", style:Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white, fontSize: 18), maxLines: 1, overflow: TextOverflow.ellipsis,),
              Text("${SubData.fromJson(data).email}", style:Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.white54, fontSize: 12), maxLines: 1, overflow: TextOverflow.ellipsis,),
            ],
          ),
            SizedBox(width: AppLayout.getWidth(context, 85)),
            InkWell(onTap: (){
              Navigator.push(context, customPageTransition(widget: const EditProfilePage()));
            }, child: const Icon(FluentSystemIcons.ic_fluent_edit_regular, color: Colors.white,)),
          ],
        ),
        ),
      ],
      ),
      ),
        Container(
          width: _width,
          // height: AppLayout.getHeight(context, 300),
          margin: EdgeInsets.symmetric(vertical: AppLayout.getHeight(context, 20), horizontal: AppLayout.getWidth(context, 18)),
          padding: EdgeInsets.symmetric(vertical: AppLayout.getHeight(context, 8)),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              Consumer<LanguageNotifier>(builder: (context, lang, _ ){
                return CustomSettingsTile(onTap:(){
                   Navigator.pushNamed(context, AppRoutes.lang);
                },
                title: AppLocalizations.of(context).translate("lang"),
                subTitle: AppLocalizations.of(context).translate(locale.locale.languageCode.toLowerCase()),
                icon: FluentSystemIcons.ic_fluent_local_language_regular,
                enabled: true,
                );
              }),
              CustomSettingsTile(onTap:(){

              },
                title: AppLocalizations.of(context).translate("notify"),
                subTitle: AppLocalizations.of(context).translate("enable"),
                icon: FluentSystemIcons.ic_fluent_alert_regular,
                enabled: true,
              ),
              CustomSettingsTile(onTap:(){
                Navigator.of(context).push(customPageTransition(widget: const AccountManager()));
              },
                title: AppLocalizations.of(context).translate("pass"),
                icon: FluentSystemIcons.ic_fluent_person_accounts_filled,
              ),
              CustomSettingsTile(onTap:(){
                Navigator.pushNamed(context, AppRoutes.tickets);
              },
                title: AppLocalizations.of(context).translate("ticket-settings"),
                icon: FluentSystemIcons.ic_fluent_ticket_regular,
              ),
              CustomSettingsTile(onTap:(){
                Navigator.pushNamed(context, AppRoutes.favorite);
              },
                title: AppLocalizations.of(context).translate("fav"),
                icon: FluentSystemIcons.ic_fluent_heart_regular,
              ),
              CustomSettingsTile(onTap:(){
              Navigator.pushNamed(context, AppRoutes.about);
              },
                title: AppLocalizations.of(context).translate("terms"),
                icon: FluentSystemIcons.ic_fluent_calendar_agenda_regular,
              ),
              CustomSettingsTile(onTap:(){
              Navigator.pushNamed(context, AppRoutes.privacy);
              },
                title: AppLocalizations.of(context).translate("policy"),
                icon: FluentSystemIcons.ic_fluent_shield_regular,
              ),
              CustomSettingsTile(onTap:(){
                profile.userLogout();
              },
                title: AppLocalizations.of(context).translate("log-out"),
                icon: FluentSystemIcons.ic_fluent_sign_out_regular,
              ),
            ],
          ),
        ),
      ],

  );
  }
}
