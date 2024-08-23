import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:ticket_booking_app/constants.dart';
import 'package:ticket_booking_app/core/class/app_layout.dart';
import 'package:ticket_booking_app/core/localization/app_localization.dart';
import 'package:ticket_booking_app/layout/widgets/search/custom_card.dart';
import 'package:ticket_booking_app/layout/widgets/search/custom_filter_box.dart';
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
            Container(width: _width,height: _height * 0.057,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16)
              ),
              child: MaterialButton(
              onPressed: (){},
              color: kButtonColor,
              elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0), ),
              child: Text(AppLocalizations.of(context).translate('fd-tk'), style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.white),),
            ),),
            Gap(AppLayout.getHeight(context, 35)),
            ViewAllBar(onTap: (){},title: AppLocalizations.of(context).translate('flights')),
            Container(
              height: _height * 0.5,
              margin: EdgeInsets.symmetric(vertical: AppLayout.getHeight(context, 12)),
              // color: Colors.black12,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: _height * 0.5,
                      margin: isRTL ? EdgeInsets.only(right: AppLayout.getWidth(context, 12),) : EdgeInsets.only(left: AppLayout.getWidth(context, 12),),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AppLayout.getWidth(context, 20)),
                        color: Colors.white,
                      ),
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: _width,
                            height: _height * 0.2,
                            margin: EdgeInsets.symmetric(vertical: AppLayout.getHeight(context, 16),horizontal: AppLayout.getWidth(context, 12),),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(AppLayout.getWidth(context, 20)),
                                image: const DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage('assets/image/second_1.jpg'),
                              )
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: AppLayout.getHeight(context, 16),horizontal: AppLayout.getWidth(context, 10),),
                            child: Text(AppLocalizations.of(context).translate('dis'), style: Theme.of(context).textTheme.titleMedium!.copyWith(color: kLightThemeTextColor, fontSize: 22, fontWeight: FontWeight.w700),),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Expanded(flex: 8,
                          child: Container(
                            width: _width * 0.44,
                            margin: EdgeInsets.symmetric(vertical:_height * 0.01),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(_width * 0.06),
                              color: kCyanColor,
                            ),
                            child: Stack(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(_width * 0.03),
                                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                        Text(AppLocalizations.of(context).translate('srv'), style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
                                        Gap(AppLayout.getHeight(context, 14)),
                                      SizedBox(width: AppLayout.getWidth(context, 140),
                                            child: Text(AppLocalizations.of(context).translate('srv-part'), style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white,),))


                                    ],
                                  ),
                                ),
                                if (isRTL) Positioned(
                                  top: -35,left: -35,
                                  child: Container(
                                    // padding: EdgeInsets.all(16),
                                    width: 100,height: 90,
                                    decoration: BoxDecoration(
                                      // color: kCircleColor,
                                        shape: BoxShape.circle,
                                        border: Border.all(width: AppLayout.getWidth(context, 18), color: Colors.black38.withOpacity(0.2))
                                    ),
                                  ),
                                ) else Positioned(
                                  top: -35,right: -35,
                                  child: Container(
                                    // padding: EdgeInsets.all(16),
                                    width: 100,height: 90,
                                    decoration: BoxDecoration(
                                      // color: kCircleColor,
                                        shape: BoxShape.circle,
                                        border: Border.all(width: AppLayout.getWidth(context, 18), color: Colors.black38.withOpacity(0.2))
                                    ),
                                  ),
                                ),

                              ],
                            ),
                          ),
                        ),
                        Expanded(flex: 9,
                          child: Container(alignment: Alignment.center,
                            margin: EdgeInsets.all(_width * 0.02),
                            padding: EdgeInsets.symmetric(vertical: _width * 0.04),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(_width * 0.06),
                              color: kRedColor,
                            ),
                            child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                  Text(AppLocalizations.of(context).translate('tk-lv'), style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),),
                                  Gap(AppLayout.getHeight(context, 15)),
                                  RichText(text: const TextSpan(children: [
                                    TextSpan(
                                        text: "😍",style: TextStyle(fontSize: 34)
                                    ),TextSpan(
                                        text: "🥰",style: TextStyle(fontSize: 45)
                                    ),TextSpan(
                                        text: "😘",style: TextStyle(fontSize: 34)
                                    ),
                                  ]))

                              ],
                            ),
                          ),
                        ),


                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}


