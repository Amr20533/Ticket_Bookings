import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ticket_booking_app/constants.dart';
import 'package:ticket_booking_app/core/class/app_layout.dart';

class CustomSettingsTile extends StatelessWidget {
  const CustomSettingsTile({
    required this.onTap,
    required this.title,
    required this.icon,
    this.subTitle,
    this.enabled = false,
    super.key,
  });

  final VoidCallback onTap;
  final String title;
  final IconData icon;
  final String? subTitle;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(context, 14)),
        leading: Container(
            width: AppLayout.getWidth(context, 35),
            height: AppLayout.getHeight(context, 35),
            decoration: const BoxDecoration(
                color: Color(0xFFF0F0F8),
                shape: BoxShape.circle
              // borderRadius: BorderRadius.circular(10),
            ),
            // backgroundColor: const Color(0xFFF5F5F5),
            child: Icon(icon, size: AppLayout.getWidth(context, 20), color: kLightIconColor,)),
        title:Text(title, style: Theme.of(context).textTheme.titleMedium),
        trailing: Row(mainAxisSize: MainAxisSize.min,
          children: [
            enabled ? Text(subTitle!, style: Theme.of(context).textTheme.titleSmall,) : const SizedBox(),
            Gap(AppLayout.getWidth(context, 10)),
            Icon(Icons.arrow_forward_ios, size: AppLayout.getWidth(context, 16), color: kLightIconColor),
          ],
        ),
      ),
    );
  }
}
