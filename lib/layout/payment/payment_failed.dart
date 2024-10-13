import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:ticket_booking_app/core/class/app_layout.dart';
import 'package:ticket_booking_app/core/const/app_assets.dart';
import 'package:ticket_booking_app/core/const/routes.dart';
import 'package:ticket_booking_app/layout/widgets/search/custom_button.dart';
import 'package:ticket_booking_app/core/localization/app_localization.dart';

class PaymentFailed extends StatelessWidget {
  const PaymentFailed({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(AppAssets.failed, width: AppLayout.getWidth(context, 250),  height: AppLayout.getHeight(context, 250)),
            SizedBox(height: AppLayout.getHeight(context, 35),),
            Text(
              AppLocalizations.of(context).translate('payment-failed'),
              style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: AppLayout.getHeight(context, 15),),
            SizedBox(
              width: AppLayout.getWidth(context, 300),
              child: Text(
                AppLocalizations.of(context).translate('book-failed'),
                style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: AppLayout.getHeight(context, 45),),
            CustomButton(
                onPressed: (){
                  Navigator.of(context).pushReplacementNamed(AppRoutes.main);
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
