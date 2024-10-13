import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:ticket_booking_app/constants.dart';
import 'package:ticket_booking_app/core/class/app_layout.dart';
import 'package:ticket_booking_app/core/const/app_assets.dart';
import 'package:ticket_booking_app/core/const/routes.dart';
import 'package:ticket_booking_app/core/localization/app_localization.dart';
import 'package:ticket_booking_app/layout/widgets/hotels/custom_divider.dart';
import 'package:ticket_booking_app/layout/widgets/hotels/custom_feature_tile.dart';
import 'package:ticket_booking_app/layout/widgets/hotels/custom_photos_slider.dart';
import 'package:ticket_booking_app/layout/widgets/hotels/price_and_date_selector.dart';
import 'package:ticket_booking_app/models/Hotels/hotel_response_model.dart';
import 'package:ticket_booking_app/modules/hotels_features.dart';
import 'package:ticket_booking_app/layout/payment/payment_view.dart';
import 'package:ticket_booking_app/providers/hotels_notifier.dart';
import 'package:ticket_booking_app/utils/data/features_list.dart';

class HotelsDetails extends StatelessWidget {
  const HotelsDetails({required this.hotels,super.key});

  final dynamic hotels;
  @override
  Widget build(BuildContext context) {
    final HotelsNotifier hotelsNotifier = Provider.of<HotelsNotifier>(context);

    return hotelsNotifier.paymentGateway.isNotEmpty ?  PaymentView(url: hotelsNotifier.paymentGateway,) : Scaffold(
      backgroundColor: kWhiteColor,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: AppLayout.getScreenWidth(context),
              height: AppLayout.getHeight(context, 300),
              alignment: Alignment.topCenter,
              decoration: BoxDecoration(
                  image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      'assets/image/first.jpg',
                    ),
                  ),
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(AppLayout.getHeight(context, 26)),
                    bottomLeft: Radius.circular(AppLayout.getHeight(context, 26)),
                  )
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: AppLayout.getHeight(context, 35)),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(onPressed: ()=> Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back_ios_rounded, color: Colors.white,
                      ),
                    ),
                    IconButton(
                      onPressed: (){

                      },
                      icon: const Icon(FluentSystemIcons.ic_fluent_heart_regular, color: Colors.white,),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(context, 18),vertical: AppLayout.getHeight(context, 18),),
              child: Row(
                children: [
                  Row(
                    children: List.generate(5, (index) => Icon(FluentSystemIcons.ic_fluent_star_filled, color: kYellowColor, size: AppLayout.getWidth(context, 20),),),
                  ),
                  Gap(AppLayout.getWidth(context, 8)),
                  Text('5.0(120 Reviews)',style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.black, fontSize: 12, fontWeight: FontWeight.normal),),

                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(context, 18),),
              child: Text(hotels['address'],style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Colors.black, fontSize: 24,fontWeight: FontWeight.bold),),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(context, 18),vertical: AppLayout.getHeight(context, 14),),
              child: Row(
                children: [
                  const Icon(FluentSystemIcons.ic_fluent_location_regular, size: 20,),
                  Gap(AppLayout.getWidth(context, 6)),
                  Text(hotels['country'],style: Theme.of(context).textTheme.titleSmall!.copyWith(color: kGreyColor, fontSize: 14, fontWeight: FontWeight.normal),),
                ],
              ),
            ),
            const CustomDivider(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(context, 18),),
              child: Text(AppLocalizations.of(context).translate('ovr')
                ,style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.black, fontSize: 18,fontWeight: FontWeight.w600
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(context, 18),vertical: AppLayout.getHeight(context, 8),),
              child: Text(hotels['description']
                ,style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.black, fontSize: 14,fontWeight: FontWeight.normal),
                maxLines: 3, overflow: TextOverflow.ellipsis,
              ),
            ),
            const CustomDivider(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(context, 18),vertical: AppLayout.getHeight(context, 8),),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(AppLocalizations.of(context).translate('phs'),
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.black, fontSize: 18,fontWeight: FontWeight.w600),),
                  InkWell(onTap: (){
                    Navigator.pushNamed(context, AppRoutes.allPhotos);
                  }, child: Text(AppLocalizations.of(context).translate('all'),
                      style:Theme.of(context).textTheme.titleMedium!.copyWith(color: kPrimaryColor, fontSize: 14))),
                ],
              ),
            ),
            const CustomPhotosSlider(),
            const CustomDivider(),
            ...List.generate(features.length, (index) => Column(
              children: [
                CustomFeatureTile(
                  icon: features[index].icon,
                  title: AppLocalizations.of(context).translate(features[index].title),
                  subTitle: AppLocalizations.of(context).translate(features[index].subTitle),
                ),
                const CustomDivider(),
              ],
            )),
            PriceAndDateSelector(
                room: Room.fromJson(hotels['room'][0]),
                hotelId: hotels['_id'],
            ),


          ],
        ),
      ),
    );
  }
}




