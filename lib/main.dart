import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ticket_booking_app/providers/auth/forgot_password_notifier.dart';
import 'package:ticket_booking_app/providers/auth/login_notifier.dart';
import 'package:ticket_booking_app/providers/auth/register_notifier.dart';
import 'package:ticket_booking_app/providers/features/flights_notifier.dart';
import 'package:ticket_booking_app/providers/features/home_provider.dart';
import 'package:ticket_booking_app/providers/hotels_notifier.dart';
import 'package:ticket_booking_app/providers/settings/language_notifier.dart';
import 'package:ticket_booking_app/providers/search/search_notifier.dart';
import 'package:ticket_booking_app/providers/settings/profile_notifier.dart';
import 'package:ticket_booking_app/providers/start/start_page_notifier.dart';
import 'package:ticket_booking_app/utils/helpers/dataService.dart';
import 'package:ticket_booking_app/utils/hero_static/pages.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await DataService.init();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeNotifier()),
        ChangeNotifierProvider(create: (context) => SearchNotifier()),
        ChangeNotifierProvider(create: (context) => HotelsNotifier()),
        ChangeNotifierProvider(create: (context) => LanguageNotifier()),
        ChangeNotifierProvider(create: (context) => FlightsNotifier()),
        ChangeNotifierProvider(create: (context) => LoginNotifier()),
        ChangeNotifierProvider(create: (context) => RegisterNotifier()),
        ChangeNotifierProvider(create: (context) => ForgotPasswordNotifier()),
        ChangeNotifierProvider(create: (context) => StartPageNotifier()),
        ChangeNotifierProvider(create: (context) => ProfileNotifier()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final langNotifier = Provider.of<LanguageNotifier>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ticket App',
      locale: langNotifier.locale,
      localizationsDelegates: langNotifier.delegates,
      supportedLocales: langNotifier.locales,
      theme: langNotifier.currentTheme,
      // home: const MainView(),
      routes: pages,
    );
  }
}

