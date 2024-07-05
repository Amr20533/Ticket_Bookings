import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:ticket_booking_app/constants.dart';
import 'package:ticket_booking_app/core/class/app_layout.dart';
import 'package:ticket_booking_app/core/localization/app_localization.dart';
import 'package:ticket_booking_app/layout/widgets/profile/accumulated_miles_box.dart';
import 'package:ticket_booking_app/layout/widgets/profile/custom_award_card.dart';
import 'package:ticket_booking_app/providers/home_provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    double _width = AppLayout.getScreenWidth(context);
    double _height = AppLayout.getScreenHeight(context);
    final locale = Provider.of<HomeNotifier>(context);
    return ListView(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(AppLayout.getHeight(context, 20)),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  Container(
                    width: 75,height: 75,
                    decoration: BoxDecoration(
                      color: kUnselectedItemColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(context, 8)),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(width: _width * 0.66,
                          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(AppLocalizations.of(context).translate('home-book'), style:Theme.of(context).textTheme.headlineSmall),
                              InkWell(onTap: (){}, child: Text(AppLocalizations.of(context).translate('edt'), style:Theme.of(context).textTheme.titleMedium!.copyWith(color: kPrimaryColor))),
                            ],
                          ),
                        ),
                        Text("Cairo, Egypt", style:Theme.of(context).textTheme.titleSmall),
                        Container(
                          width: AppLayout.getWidth(context, 160),height: 25,
                          margin: const EdgeInsets.only(top: 6),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                            Container(
                              width: 25,height: 25,
                              decoration: const BoxDecoration(
                                color: kPrimaryColor,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(FluentSystemIcons.ic_fluent_shield_filled,color: Colors.white,size: 16,),
                            ),
                            Gap(AppLayout.getWidth(context, 10)),
                            Text(AppLocalizations.of(context).translate('prof-prem'), style: Theme.of(context).textTheme.titleMedium!.copyWith(color: kPrimaryColor, fontSize: 14),)
                          ],),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            CustomAwardCard(width: _width, height: _height),

            AccumulatedMilesBox(width: _width, height: _height),

            TextButton(
              onPressed: (){
                if (locale.locale.languageCode.toLowerCase() == 'ar') {
                  locale.setLocale(const Locale('en'));
                } else {
                  locale.setLocale(const Locale('ar'));
                }
              },
              child: Text('Lang'),
            ),
          ],

        )
      ],
    );
  }
}


