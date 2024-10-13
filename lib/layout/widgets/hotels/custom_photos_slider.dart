import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ticket_booking_app/core/class/app_layout.dart';
import 'package:ticket_booking_app/providers/settings/language_notifier.dart';

class CustomPhotosSlider extends StatelessWidget {
  const CustomPhotosSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final langNotifier = Provider.of<LanguageNotifier>(context);
    bool isRTL = langNotifier.locale.languageCode.toLowerCase() == 'ar';

    return Container(
      height: AppLayout.getHeight(context, 100),
      margin: isRTL ? EdgeInsets.only(right: AppLayout.getWidth(context, 18)) : EdgeInsets.only(left: AppLayout.getWidth(context, 18)),
      child: ListView.builder(
        itemCount: 6,
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Container(
          width: AppLayout.getWidth(context, 130),
          height: AppLayout.getHeight(context, 100),
          margin: EdgeInsets.only(right: AppLayout.getWidth(context, 12)),
          alignment: Alignment.topCenter,
          decoration: BoxDecoration(
            image: const DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                'assets/image/first.jpg',
              ),
            ),
            borderRadius: BorderRadius.circular(AppLayout.getHeight(context, 12)),
          ),
        ),),
    );
  }
}
