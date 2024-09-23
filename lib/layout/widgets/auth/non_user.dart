import 'package:flutter/material.dart';
import 'package:ticket_booking_app/core/class/app_layout.dart';
import 'package:ticket_booking_app/core/const/app_assets.dart';
import 'package:ticket_booking_app/core/localization/app_localization.dart';
import 'package:ticket_booking_app/utils/hero_static/custom_page_transition.dart';
import 'package:ticket_booking_app/layout/auth/login_screen.dart';
import 'package:ticket_booking_app/layout/widgets/search/custom_button.dart';

class NonUser extends StatelessWidget {
  const NonUser({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppLayout.getScreenWidth(context),
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      margin: EdgeInsets.symmetric(vertical: AppLayout.getHeight(context, 20)),
      child: Row(
        children: [
          CircleAvatar(
            radius: AppLayout.getWidth(context, 22),
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: AppLayout.getWidth(context, 14),
              backgroundColor: Colors.white,
              backgroundImage: const AssetImage(AppAssets.nonUser),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(context, 8)),
            child: Text("Hello, Please login into your account", style:Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.black, fontSize: 13), maxLines: 1, overflow: TextOverflow.ellipsis,),
          ),
          const Spacer(),
          CustomButton(
            onPressed: (){
              Navigator.of(context).push(customPageTransition(widget: const LoginScreen()));
            },
            width: AppLayout.getWidth(context, 65),
            height: AppLayout.getHeight(context, 30),
            hPadding: 0,
            title: AppLocalizations.of(context).translate('log'),
            fontWeight: FontWeight.normal,
            fontSize: 12,
          )

        ],
      ),
    );
  }
}
