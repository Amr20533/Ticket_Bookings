import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ticket_booking_app/constants.dart';
import 'package:ticket_booking_app/core/class/app_layout.dart';
import 'package:ticket_booking_app/core/const/routes.dart';
import 'package:ticket_booking_app/core/localization/app_localization.dart';
import 'package:ticket_booking_app/layout/widgets/sliders/hotel_slider.dart';
import 'package:ticket_booking_app/layout/widgets/sliders/ticket_slider.dart';
import 'package:ticket_booking_app/layout/widgets/view_all_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
      return ListView(
      children: [
        Gap(AppLayout.getHeight(context, 40)),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(AppLocalizations.of(context).translate('home-greeting'), style:Theme.of(context).textTheme.titleSmall),
                      Text(AppLocalizations.of(context).translate('home-book'), style:Theme.of(context).textTheme.headlineSmall),

                    ],
                  ),
                  Container(
                    width: 50,height: 50,
                    decoration: BoxDecoration(
                      color: kUnselectedItemColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        Gap(AppLayout.getHeight(context, 25)),
        Container(
          height: 45,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          margin: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color(0XFFF4F6FD),
          ),
          child: Row(
            children: [
              const Icon(
                FluentSystemIcons.ic_fluent_search_regular,
                color: Color(0XFFBFC205),
              ),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: AppLocalizations.of(context).translate('home-search'),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.only(left: 10,right: 10, bottom: 8),
                  ),
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
            ],
          ),
        ),

        Gap(AppLayout.getHeight(context, 35)),
        ViewAllBar(onTap: (){
          Navigator.pushNamed(context, AppRoutes.allTickets);

        },title: AppLocalizations.of(context).translate('flights'),),
        TicketSlider(),
        Gap(AppLayout.getHeight(context, 16)),
        ViewAllBar(onTap: (){
          Navigator.pushNamed(context, AppRoutes.allHotels);
        },title: AppLocalizations.of(context).translate('hls'),),
        Gap(AppLayout.getHeight(context, 16)),
        HotelSlider(),



      ],
    );
  }
}


