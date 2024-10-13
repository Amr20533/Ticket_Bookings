import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ticket_booking_app/core/class/app_layout.dart';
import 'package:ticket_booking_app/layout/widgets/hotels/build_room_type_option.dart';
import 'package:ticket_booking_app/layout/widgets/search/custom_button.dart';
import 'package:ticket_booking_app/models/Booking/room_booking_model.dart';
import 'package:ticket_booking_app/providers/hotels_notifier.dart';

class SelectRoomPage extends StatelessWidget {
  const SelectRoomPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<HotelsNotifier>(
        builder: (context, hotel, _){
          return SizedBox(
            height: 320,
            child: Column(
              children: [

                buildRoomTypeOption(
                  context,
                  onTap: (){
                    hotel.selectedRoom = "Single";
                  },
                    roomType: "Single",
                    hotelsNotifier: hotel
                ),
                buildRoomTypeOption(
                    context,
                    onTap: (){
                    hotel.selectedRoom = "Double";
                  },
                    roomType: "Double", hotelsNotifier: hotel),
                const Spacer(),
                CustomButton(
                  onPressed: () {
                    debugPrint("startDate: ${hotel.startDate}\n endDate: ${hotel.endDate}\n selectedRoom: ${hotel.selectedRoom}");
                    _bookRoom(hotelsNotifier: hotel);
                    Navigator.pop(context);
                  },
                  width: AppLayout.getWidth(context, 350),
                  height: AppLayout.getHeight(context, 50),
                  title: 'Book a room',
                ),
              ],
            ),
          );
        }
    );
  }

  void _bookRoom({required HotelsNotifier hotelsNotifier}){
    RoomBookingModel roomBookingModel = RoomBookingModel(
      hotelId: hotelsNotifier.hotelId,
      roomType: hotelsNotifier.selectedRoom.toLowerCase(),
      startDate: hotelsNotifier.startDate.toString(),
      endDate: hotelsNotifier.endDate.toString(),
    );
    hotelsNotifier.userBookARoom(roomBookingModel).then((roomStatus){
      if(roomStatus.status == 'success'){
        debugPrint('created a room success');
        hotelsNotifier.paymentGateway= roomStatus.paymentGateway;
      }else{
        debugPrint('Error While Booking a room :(');
      }
    });
  }
}
