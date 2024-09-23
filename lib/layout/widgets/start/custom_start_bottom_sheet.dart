import 'package:flutter/material.dart';
import 'package:ticket_booking_app/core/class/app_layout.dart';
import 'package:ticket_booking_app/core/const/routes.dart';
import 'package:ticket_booking_app/core/localization/app_localization.dart';
import 'package:ticket_booking_app/layout/auth/auth_director.dart';
import 'package:ticket_booking_app/layout/widgets/search/custom_button.dart';
import 'package:ticket_booking_app/layout/widgets/start/custom_start_indicator.dart';
import 'package:ticket_booking_app/providers/start/start_page_notifier.dart';

class CustomStartBottomSheet extends StatelessWidget {
  const CustomStartBottomSheet({
    required this.startPageNotifier,
    super.key,
  });
  final StartPageNotifier startPageNotifier;

  @override
  Widget build(BuildContext context) {
    return BottomSheet(onClosing: (){}, builder: (context){
      return Container(
        height: AppLayout.getHeight(context, 320),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(AppLayout.getWidth(context, 25)),
            topLeft: Radius.circular(AppLayout.getWidth(context, 25)),
          ),
        ),
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomStartIndicator(startPageNotifier: startPageNotifier,),
              Container(
                height: 170,
                margin: EdgeInsets.only(top: AppLayout.getHeight(context, 16)),
                child: PageView(
                  controller: startPageNotifier.pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  onPageChanged: (int newIndex){
                    startPageNotifier.selectedImage = newIndex;
                  },
                  children: startPageNotifier.bottomSheetScreens,
                ),
              ),
              startPageNotifier.selectedImage < 2 ? Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: (){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const AuthDirector()));
                      },
                      child: Text(AppLocalizations.of(context).translate('skip'), style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.black),)
                  ),
                  CustomButton(
                    onPressed: (){
                      startPageNotifier.nextPage();
                    },
                    width: AppLayout.getWidth(context, 190),
                    height: AppLayout.getHeight(context, 55),
                    fontSize: 16,
                    title: '${AppLocalizations.of(context).translate('next')} →',
                  ),
                ],
              )
                  : CustomButton(
                onPressed: (){
                  Navigator.pushReplacementNamed(context, AppRoutes.authDirector);
                },
                width: AppLayout.getWidth(context, 390),
                height: AppLayout.getHeight(context, 55),
                title: AppLocalizations.of(context).translate('get-started'),
              ),
            ],
          ),
        ),
      );
    });
  }
}
