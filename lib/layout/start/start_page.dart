import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ticket_booking_app/core/class/app_layout.dart';
import 'package:ticket_booking_app/layout/widgets/start/custom_start_bottom_sheet.dart';
import 'package:ticket_booking_app/providers/start/start_page_notifier.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<StartPageNotifier>(builder: (context, start, _){
      return Scaffold(
        body: Container(
          height: AppLayout.getScreenHeight(context) - 300,
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(start.screens[start.selectedImage])
              )
          ),
        ),
        bottomSheet: CustomStartBottomSheet(startPageNotifier: start),
      );
    });
  }
}


