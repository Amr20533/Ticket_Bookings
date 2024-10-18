import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:ticket_booking_app/core/class/app_layout.dart';
import 'package:ticket_booking_app/core/const/app_assets.dart';
import 'package:ticket_booking_app/core/const/routes.dart';
import 'package:ticket_booking_app/layout/widgets/search/custom_button.dart';
import 'package:ticket_booking_app/core/localization/app_localization.dart';
import 'package:ticket_booking_app/utils/helpers/notification_Helper.dart';

class PaymentSuccess extends StatelessWidget {
  const PaymentSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(AppAssets.success, width: AppLayout.getWidth(context, 120),  height: AppLayout.getHeight(context, 120)),
            SizedBox(height: AppLayout.getHeight(context, 35),),
            Text(
              // "Payment Received \nSuccessfully",
              AppLocalizations.of(context).translate('payment-received'),
              style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: AppLayout.getHeight(context, 15),),
            Text(
              // "Congratulations \nYour book has been confirmed",
               AppLocalizations.of(context).translate('confirmed-book'),
              style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: AppLayout.getHeight(context, 45),),
            CustomButton(
                onPressed: (){
              Navigator.of(context).pushReplacementNamed(AppRoutes.main);
              NotificationHelper().showNotification(
                  id: 0,
                  title: AppLocalizations.of(context).translate('payment-received'),
                  body: AppLocalizations.of(context).translate('confirmed-book'),
              );
            },
              width: AppLayout.getWidth(context, 350),
                height: AppLayout.getHeight(context, 45),
                title: AppLocalizations.of(context).translate('back-to-home'))

          ],
        ),
      ),
    );
  }
}
