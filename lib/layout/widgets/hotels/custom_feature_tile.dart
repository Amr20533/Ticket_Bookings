import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomFeatureTile extends StatelessWidget {
  const CustomFeatureTile({
    required this.icon,
    required this.title,
    required this.subTitle,
    super.key,
  });
  final String icon;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SvgPicture.asset(icon,width: 22,height: 22,),
      title: Text(title,
          style:Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600)),
      subtitle: Text(subTitle,
          style:Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.black, fontSize: 14)),
    );
  }
}
