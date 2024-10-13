import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ticket_booking_app/core/class/app_layout.dart';
import 'package:ticket_booking_app/core/localization/app_localization.dart';
import 'package:ticket_booking_app/layout/widgets/search/custom_button.dart';
import 'package:ticket_booking_app/models/Hotels/hotel_response_model.dart';
import 'package:ticket_booking_app/providers/hotels_notifier.dart';

class PriceAndDateSelector extends StatelessWidget {
  const PriceAndDateSelector({
    required this.room,
    required this.hotelId,
    super.key,
  });
  final Room room;
  final String hotelId;

  @override
  Widget build(BuildContext context) {
    final hotelsNotifier = Provider.of<HotelsNotifier>(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(context, 18),vertical: AppLayout.getHeight(context, 14),),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RichText(
            text: TextSpan(
                children:[
                  TextSpan(text: '\$${room.price}',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.black, fontSize: 18,fontWeight: FontWeight.bold),
                  ),
                  TextSpan(text: '/${AppLocalizations.of(context).translate('ngt')}',
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.black, fontSize: 14,fontWeight: FontWeight.normal),
                  ),
                ]
            ),
          ),
          CustomButton(
            onPressed: (){
              showBottomDate(context);
              hotelsNotifier.hotelId = hotelId;
            },
            width: AppLayout.getWidth(context, 160),
            height: AppLayout.getHeight(context, 60),
            fontSize: 16,fontWeight: FontWeight.w400,hPadding: 0,
            title: AppLocalizations.of(context).translate('slc-dte'),

          ),
        ],
      ),
    );

  }

  void showBottomDate(BuildContext context,) {
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
}

