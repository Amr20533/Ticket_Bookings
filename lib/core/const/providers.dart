import 'package:provider/provider.dart';
import 'package:ticket_booking_app/providers/flights_notifier.dart';
import 'package:ticket_booking_app/providers/home_provider.dart';
import 'package:ticket_booking_app/providers/hotels_notifier.dart';
import 'package:ticket_booking_app/providers/language_notifier.dart';
import 'package:ticket_booking_app/providers/search_notifier.dart';

List<ChangeNotifierProvider> myProviders = [
  ChangeNotifierProvider(create: (context) => HomeNotifier()),
  ChangeNotifierProvider(create: (context) => SearchNotifier()),
  ChangeNotifierProvider(create: (context) => HotelsNotifier()),
  ChangeNotifierProvider(create: (context) => LanguageNotifier()),
  ChangeNotifierProvider(create: (context) => FlightsNotifier()),
];