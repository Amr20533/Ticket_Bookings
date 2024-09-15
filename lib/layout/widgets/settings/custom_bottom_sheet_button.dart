import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ticket_booking_app/constants.dart';
import 'package:ticket_booking_app/core/class/app_layout.dart';
import 'package:ticket_booking_app/core/const/app_assets.dart';

class CustomBottomSheetButton extends StatelessWidget {
  const CustomBottomSheetButton({
    required this.onPressed,
    required this.text,
    this.size = 22,
    this.image = AppAssets.edit,
    this.isCancel = false,
    super.key,
  });
  final Function()? onPressed;
  final bool isCancel;
  final String image;
  final double size;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppLayout.getWidth(context, 280),height: AppLayout.getWidth(context, 44),
      margin: isCancel ? const EdgeInsets.symmetric(horizontal: 7,vertical: 16) : const EdgeInsets.symmetric(horizontal: 12,vertical: 8),
      child: MaterialButton(
        onPressed: onPressed,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
            side: isCancel ? BorderSide(color: const Color(0XFF0165FC).withOpacity(0.8),width: 2) : BorderSide.none
        ),
        color: isCancel ? Colors.white : kPrimaryColor,
        child: isCancel ? Center(
          child: Text(text,style: TextStyle(color: isCancel ? const Color(0XFF0165FC).withOpacity(0.8) : Colors.white,fontSize: 15,fontWeight: FontWeight.w400),),
        ) : Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SvgPicture.asset(image, color: Colors.white, width: size,height: size,),

            Text(text,style: TextStyle(color: isCancel ? const Color(0XFF0165FC).withOpacity(0.8) : Colors.white,fontSize: 15,fontWeight: FontWeight.w400),),
          ],
        ),
      ),
    );
  }
}
