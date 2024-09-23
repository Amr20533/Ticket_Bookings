import 'package:flutter/material.dart';
import 'package:ticket_booking_app/core/class/app_layout.dart';
import 'package:ticket_booking_app/core/class/format_helper.dart';
import 'package:ticket_booking_app/core/localization/app_localization.dart';
import 'package:ticket_booking_app/providers/settings/profile_notifier.dart';

void showDatePickerBottomSheet(BuildContext context, {required ProfileNotifier profile}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return Container(
        height: 300,
        padding: EdgeInsets.all(AppLayout.getHeight(context, 16)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              AppLocalizations.of(context).translate("select-date"),
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: AppLayout.getHeight(context, 10)),
            SizedBox(
              height: 200,
              child: CalendarDatePicker(
                initialDate: profile.selectedDate,
                firstDate: DateTime(2000),
                lastDate: DateTime(2101),
                onDateChanged: (DateTime date) {
                  profile.selectedDate = date;
                  profile.dateOfBirthController.text = FormatHelper().formattedDate(context,date.toString());
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      );
    },
  );
}
