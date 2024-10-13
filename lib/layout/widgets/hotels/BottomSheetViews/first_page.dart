import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ticket_booking_app/core/class/app_layout.dart';
import 'package:ticket_booking_app/layout/widgets/search/custom_button.dart';
import 'package:ticket_booking_app/providers/hotels_notifier.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // final HotelsNotifier hotelNotifier = Provider.of<HotelsNotifier>(context);
    return Consumer<HotelsNotifier>(builder: (context, hotelNotifier, _){
      return Column(
        children: [
          SizedBox(
            height: 220,
            child: CalendarDatePicker(
              initialDate: hotelNotifier.startDate,
              firstDate: DateTime(2000),
              lastDate: DateTime(2101),
              onDateChanged: (DateTime date) {
                hotelNotifier.startDate = date;
                debugPrint("Selected Date --> ${hotelNotifier.startDate}");
              },
            ),
          ),
          SizedBox(height: AppLayout.getHeight(context, 10)),
          CustomButton(
            onPressed: () {
              hotelNotifier.nextPage();
            },
            width: AppLayout.getWidth(context, 350),
            height: AppLayout.getHeight(context, 50),
            title: 'Select End Date',
          ),
        ],
      );
    });
  }
}
