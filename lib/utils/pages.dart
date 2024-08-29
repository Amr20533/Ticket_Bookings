import 'package:flutter/material.dart';
import 'package:ticket_booking_app/core/const/routes.dart';
import 'package:ticket_booking_app/layout/auth/login_screen.dart';
import 'package:ticket_booking_app/layout/auth/register_screen.dart';
import 'package:ticket_booking_app/layout/favorites_page.dart';
import 'package:ticket_booking_app/layout/flights/all_flights_view.dart';
import 'package:ticket_booking_app/layout/hotels/all_hotels_view.dart';
import 'package:ticket_booking_app/layout/hotels/all_photos.dart';
import 'package:ticket_booking_app/layout/hotels/hotels_details.dart';
import 'package:ticket_booking_app/layout/mainView.dart';
import 'package:ticket_booking_app/layout/settings/language_screen.dart';
import 'package:ticket_booking_app/layout/settings/password_settings.dart';
import 'package:ticket_booking_app/layout/settings/ticket_settings_page.dart';
import 'package:ticket_booking_app/layout/ticket_page.dart';
import 'package:ticket_booking_app/layout/widgets/settings/about_screen.dart';
import 'package:ticket_booking_app/layout/widgets/settings/help_center.dart';
import 'package:ticket_booking_app/layout/widgets/settings/privacy_screen.dart';


Map<String, Widget Function(BuildContext)> pages = {
  AppRoutes.main : (context) => const MainView(),
  AppRoutes.lang : (context) => const LanguageScreen(),
  AppRoutes.ticketSettings : (context) => const TicketSettingsPage(),

  ///  ---------------------------  Authentication Routes ------------------------------
  AppRoutes.login : (context) =>  const LoginScreen(),
  AppRoutes.register : (context) =>  const RegisterScreen(),


  ///  ---------------------------  Profile Routes ------------------------------
  AppRoutes.helpCenter : (context) => const HelpScreen(),
  AppRoutes.about : (context) => const AboutScreen(),
  AppRoutes.favorite : (context) => const FavoritesPage(),
  AppRoutes.tickets : (context) => TicketPage(),
  AppRoutes.privacy : (context) => const PrivacyScreen(),
  AppRoutes.pass : (context) => const PasswordSettings(),

  AppRoutes.allTickets : (context) => const AllFlightsView(),
  AppRoutes.allHotels : (context) => AllHotelsView(),
  AppRoutes.allPhotos : (context) => const AllPhotosView(),
  AppRoutes.hotelsDetails : (context) => const HotelsDetails()
};