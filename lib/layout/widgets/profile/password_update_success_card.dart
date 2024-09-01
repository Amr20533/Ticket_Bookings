import 'package:flutter/material.dart';
import 'package:ticket_booking_app/core/class/app_layout.dart';
import 'package:ticket_booking_app/core/const/routes.dart';
import 'package:ticket_booking_app/core/localization/app_localization.dart';
import 'package:ticket_booking_app/layout/widgets/search/custom_button.dart';

class PasswordUpdateSuccessCard extends StatelessWidget {
  const PasswordUpdateSuccessCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: 300,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(AppLayout.getWidth(context, 16))
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // mainAxisSize: MainAxisSize.min,
        children: [
          // Container(
          //   width: AppLayout.getWidth(context, 100),
          //   height: AppLayout.getWidth(context, 100),
          //   // padding: EdgeInsets.all(16),
          //   margin: EdgeInsets.symmetric(vertical: AppLayout.getHeight(context, 20)),
          //   decoration: const BoxDecoration(
          //     color: kPrimaryColor,
          //     // image: DecorationImage(
          //     //   image: AssetImage(AppAssets.done1,)
          //     // ),
          //     shape: BoxShape.circle,
          //   ),
          //   child: Image.asset(AppAssets.done, repeat: ImageRepeat.noRepeat,),
          // ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: AppLayout.getHeight(context, 22)),
            child: Text('${AppLocalizations.of(context).translate('update-pass-scc')}!',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(fontFamily: 'DMSerif', fontSize: 26,),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
              width: AppLayout.getWidth(context, 170),
              child: Text(AppLocalizations.of(context).translate('suc-update-pass'),textAlign: TextAlign.center,)),
          Padding(
            padding: EdgeInsets.only(
              top: AppLayout.getHeight(context, 22),
              right: AppLayout.getHeight(context, 22),
              left: AppLayout.getHeight(context, 22),
            ),
            child: CustomButton(
              onPressed: (){
                Navigator.of(context).pushReplacementNamed(AppRoutes.main);
              },
              width: AppLayout.getScreenWidth(context),
              height: AppLayout.getHeight(context, 60),
              fontSize: 16,
              fontWeight: FontWeight.w400,
              hPadding: 0,
              title: AppLocalizations.of(context).translate('back-to-home'),

            ),
          )
        ],
      ),
    );
  }
}
