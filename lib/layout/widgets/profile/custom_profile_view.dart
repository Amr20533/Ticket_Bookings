import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:ticket_booking_app/layout/settings/account/profile_exports.dart';


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
                try{
                  profile.userLogout();
                  Navigator.restorablePopAndPushNamed(context, AppRoutes.authDirector);
                }catch(error){
                  debugPrint("Failed to Logout");
                }
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
/*
DioError: {status: fail, message: The seat you want is not available for this flight, error: {statusCode: 400, status: fail, isOperational: true}}
E/flutter (14639): [ERROR:flutter/runtime/dart_vm_initializer.cc(41)] Unhandled Exception: Exception: An unexpected error occurred: Exception: The seat you want is not available for this flight
E/flutter (14639): #0      FlightsNotifier.userTakeFlightTicket (package:ticket_booking_app/providers/features/flights_notifier.dart:96:9)
E/flutter (14639): <asynchronous suspension>
E/flutter (14639): #1      CreateTicketPage._payForTicket.<anonymous closure> (package:ticket_booking_app/layout/flights/create_ticket_page.dart:49:60)
E/flutter (14639): <asynchronous suspension>
E/flutter (14639):

* */