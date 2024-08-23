import 'package:flutter/material.dart';
import 'package:ticket_booking_app/constants.dart';
import 'package:ticket_booking_app/core/localization/app_localization.dart';

class ViewAllBar extends StatelessWidget {
  const ViewAllBar({
    super.key,
    required this.title,
    required this.onTap,
  });

  final void Function() onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style:Theme.of(context).textTheme.headlineSmall),
          InkWell(onTap: onTap, child: Text(AppLocalizations.of(context).translate('all'), style:Theme.of(context).textTheme.titleMedium!.copyWith(color: kPrimaryColor))),

        ],
      ),
    );
  }
}
