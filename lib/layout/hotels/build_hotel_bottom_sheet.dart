import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ticket_booking_app/core/class/app_layout.dart';
import 'package:ticket_booking_app/providers/hotels_notifier.dart';

void buildHotelBottomSheet(BuildContext context,) {
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      builder: (BuildContext context) {
        return Container(
          height: 400,
          padding: EdgeInsets.all(AppLayout.getHeight(context, 16)),
          child: Consumer<HotelsNotifier>(
              builder: (context, hotelNotifier, child) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      hotelNotifier.titles[hotelNotifier.currentPage],
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: AppLayout.getHeight(context, 10)),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: AppLayout.getHeight(context, 10)),
                        child: PageView(
                          controller: hotelNotifier.pageController,
                          physics: const NeverScrollableScrollPhysics(),
                          onPageChanged: (int page) {
                            hotelNotifier.changeCurrentPage(page);
                          },
                          children: hotelNotifier.screens,
                        ),
                      ),
                    ),
                  ],
                );
              }
          ),
        );
      }
  );
}
