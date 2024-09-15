import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ticket_booking_app/core/class/app_layout.dart';
import 'package:ticket_booking_app/core/localization/app_localization.dart';
import 'package:ticket_booking_app/layout/widgets/search/custom_button.dart';
import 'package:ticket_booking_app/models/Booking/room_booking_model.dart';
import 'package:ticket_booking_app/layout/payment/payment_view.dart';
import 'package:ticket_booking_app/providers/hotels_notifier.dart';

class PriceAndDateSelector extends StatelessWidget {
  const PriceAndDateSelector({
    required this.id,
    super.key,
  });
  final String id;

  @override
  Widget build(BuildContext context) {
    final HotelsNotifier hotelsNotifier = Provider.of<HotelsNotifier>(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(context, 18),vertical: AppLayout.getHeight(context, 14),),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RichText(
            text: TextSpan(
                children:[
                  TextSpan(text: '\$120',
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
              _bookRoom(hotelsNotifier: hotelsNotifier);
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
  void _bookRoom({required HotelsNotifier hotelsNotifier}){
    RoomBookingModel roomBookingModel = RoomBookingModel(
      hotelId: id,
      roomType: 'single',
      startDate: '2024-11-24',
      endDate: '2024-11-26',
    );
    hotelsNotifier.userBookARoom(roomBookingModel).then((roomStatus){
      debugPrint("Status:: $roomStatus");
      if(roomStatus['status'] == 'success'){
        debugPrint('created a room success');
        hotelsNotifier.paymentGateway = roomStatus['paymentGateway'];

        print('Payment GateWay --> ${hotelsNotifier.paymentGateway}');
      }else{
        debugPrint('Error While Booking a room :(');
      }
    });
  }
}
