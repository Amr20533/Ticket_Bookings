import 'package:ticket_booking_app/core/const/app_assets.dart';
import 'package:ticket_booking_app/core/localization/app_localization.dart';
import 'package:ticket_booking_app/modules/hotels_features.dart';

List<HotelsFeature> features = [
  HotelsFeature(icon: AppAssets.clean,
    title: 'e-cln',
    subTitle: 'cln-des',
  ),
  HotelsFeature(icon: AppAssets.location,
    title: 'grt-loc',
    subTitle: 'loc-des',
  ),
  HotelsFeature(icon: AppAssets.key,
    title: 'chk-exp',
    subTitle: 'chk-exp-des',
  ),
  HotelsFeature(icon: AppAssets.calendar,
    title: 'cnl',
    subTitle: '',
  ),
];