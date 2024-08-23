import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ticket_booking_app/providers/flights_notifier.dart';
import 'package:ticket_booking_app/providers/home_provider.dart';
import 'package:ticket_booking_app/providers/hotels_notifier.dart';
import 'package:ticket_booking_app/providers/language_notifier.dart';
import 'package:ticket_booking_app/providers/search_notifier.dart';
import 'package:ticket_booking_app/utils/pages.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeNotifier()),
        ChangeNotifierProvider(create: (context) => SearchNotifier()),
        ChangeNotifierProvider(create: (context) => HotelsNotifier()),
        ChangeNotifierProvider(create: (context) => LanguageNotifier()),
        ChangeNotifierProvider(create: (context) => FlightsNotifier()),
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

