import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:ticket_booking_app/constants.dart';
import 'package:ticket_booking_app/core/class/app_layout.dart';
import 'package:ticket_booking_app/core/localization/app_localization.dart';
import 'package:ticket_booking_app/layout/widgets/search/custom_button.dart';
import 'package:ticket_booking_app/layout/widgets/search/custom_card.dart';
import 'package:ticket_booking_app/layout/widgets/search/custom_filter_box.dart';
import 'package:ticket_booking_app/layout/widgets/search/custom_upcomin_flights.dart';
import 'package:ticket_booking_app/layout/widgets/view_all_bar.dart';
import 'package:ticket_booking_app/providers/language_notifier.dart';
import 'package:ticket_booking_app/providers/search_notifier.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    double _width = AppLayout.getScreenWidth(context);
    double _height = AppLayout.getScreenHeight(context);
    final search = Provider.of<SearchNotifier>(context);
    final langNotifier = Provider.of<LanguageNotifier>(context);
    bool isRTL = langNotifier.locale.languageCode.toLowerCase() == 'ar';

    return ListView(
      children: [
        Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(AppLayout.getHeight(context, 16)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(context, 20), ),
              child: Text(AppLocalizations.of(context).translate('search-title'), style:Theme.of(context).textTheme.headlineLarge),
            ),
            Gap(AppLayout.getHeight(context, 25)),
            CustomFilterBox(height: _height, width: _width, search: search, title: AppLocalizations.of(context).translate('pln-tk'), subTitle: AppLocalizations.of(context).translate('hls'),),
            Gap(AppLayout.getHeight(context, 25)),
            CustomCard(title: AppLocalizations.of(context).translate('dept'),icon: Icons.flight_takeoff_rounded,height: _height, width: _width),
            Gap(AppLayout.getHeight(context, 25)),
            CustomCard(title:AppLocalizations.of(context).translate('arr') ,icon: Icons.flight_land_rounded,height: _height, width: _width),
            Gap(AppLayout.getHeight(context, 25)),
            CustomButton(
              onPressed: (){

              },
              width: _width,
              height: _height * 0.057,
              title: AppLocalizations.of(context).translate('fd-tk'),

            ),
            Gap(AppLayout.getHeight(context, 35)),
            ViewAllBar(onTap: (){},title: AppLocalizations.of(context).translate('flights')),
            CustomUpcomingFlights(height: _height, isRTL: isRTL, width: _width)
          ],
        )
      ],
    );
  }
}




