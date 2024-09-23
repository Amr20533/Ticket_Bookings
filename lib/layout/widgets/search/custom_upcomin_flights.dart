import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ticket_booking_app/constants.dart';
import 'package:ticket_booking_app/core/class/app_layout.dart';
import 'package:ticket_booking_app/core/localization/app_localization.dart';

class CustomUpcomingFlights extends StatelessWidget {
  const CustomUpcomingFlights({
    super.key,
    required double height,
    required this.isRTL,
    required double width,
  }) : _height = height, _width = width;

  final double _height;
  final bool isRTL;
  final double _width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _height * 0.5,
      margin: EdgeInsets.symmetric(vertical: AppLayout.getHeight(context, 12)),
      // color: Colors.black12,
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: _height * 0.5,
              margin: isRTL ? EdgeInsets.only(right: AppLayout.getWidth(context, 12),) : EdgeInsets.only(left: AppLayout.getWidth(context, 12),),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppLayout.getWidth(context, 20)),
                color: Colors.white,
              ),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: _width,
                    height: _height * 0.2,
                    margin: EdgeInsets.symmetric(vertical: AppLayout.getHeight(context, 16),horizontal: AppLayout.getWidth(context, 12),),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AppLayout.getWidth(context, 20)),
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/image/second_1.jpg'),
                        )
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: AppLayout.getHeight(context, 16),horizontal: AppLayout.getWidth(context, 10),),
                    child: Text(AppLocalizations.of(context).translate('dis'), style: Theme.of(context).textTheme.titleMedium!.copyWith(color: kLightThemeTextColor, fontSize: 22, fontWeight: FontWeight.w700),),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Expanded(flex: 8,
                  child: Container(
                    width: _width * 0.44,
                    margin: EdgeInsets.symmetric(vertical:_height * 0.01),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(_width * 0.06),
                      color: kCyanColor,
                    ),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(_width * 0.03),
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(AppLocalizations.of(context).translate('srv'), style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
                              Gap(AppLayout.getHeight(context, 14)),
                              SizedBox(width: AppLayout.getWidth(context, 140),
                                  child: Text(AppLocalizations.of(context).translate('srv-part'), style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white,),))


                            ],
                          ),
                        ),
                        if (isRTL) Positioned(
                          top: -35,left: -35,
                          child: Container(
                            // padding: EdgeInsets.all(16),
                            width: 100,height: 90,
                            decoration: BoxDecoration(
                              // color: kCircleColor,
                                shape: BoxShape.circle,
                                border: Border.all(width: AppLayout.getWidth(context, 18), color: Colors.black38.withOpacity(0.2))
                            ),
                          ),
                        ) else Positioned(
                          top: -35,right: -35,
                          child: Container(
                            // padding: EdgeInsets.all(16),
                            width: 100,height: 90,
                            decoration: BoxDecoration(
                              // color: kCircleColor,
                                shape: BoxShape.circle,
                                border: Border.all(width: AppLayout.getWidth(context, 18), color: Colors.black38.withOpacity(0.2))
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
                Expanded(flex: 9,
                  child: Container(alignment: Alignment.center,
                    margin: EdgeInsets.all(_width * 0.02),
                    padding: EdgeInsets.symmetric(vertical: _width * 0.04),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(_width * 0.06),
                      color: kRedColor,
                    ),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(AppLocalizations.of(context).translate('tk-lv'), style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),),
                        Gap(AppLayout.getHeight(context, 15)),
                        RichText(text: const TextSpan(children: [
                          TextSpan(
                              text: "😍",style: TextStyle(fontSize: 34)
                          ),TextSpan(
                              text: "🥰",style: TextStyle(fontSize: 45)
                          ),TextSpan(
                              text: "😘",style: TextStyle(fontSize: 34)
                          ),
                        ]))

                      ],
                    ),
                  ),
                ),


              ],
            ),
          ),
        ],
      ),
    );
  }
}
