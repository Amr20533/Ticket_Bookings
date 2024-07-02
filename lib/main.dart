import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ticket_booking_app/core/localizarion/app_localization.dart';
import 'package:ticket_booking_app/layout/mainView.dart';
import 'package:ticket_booking_app/providers/home_provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeNotifier()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final homeNotifier = Provider.of<HomeNotifier>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ticket App',
      locale: homeNotifier.locale,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: homeNotifier.locales,
      theme: homeNotifier.currentTheme,
      home: const MainView(),
    );
  }
}

