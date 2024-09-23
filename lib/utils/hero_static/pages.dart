import 'package:flutter/material.dart';
import 'package:ticket_booking_app/core/const/routes.dart';
import 'package:ticket_booking_app/layout/auth/auth_director.dart';
import 'package:ticket_booking_app/layout/auth/forgot_password.dart';
import 'package:ticket_booking_app/layout/auth/login_screen.dart';
import 'package:ticket_booking_app/layout/auth/register_screen.dart';
import 'package:ticket_booking_app/layout/auth/reset_password.dart';
import 'package:ticket_booking_app/layout/auth/verify_code_screen.dart';
import 'package:ticket_booking_app/layout/favorites_page.dart';
import 'package:ticket_booking_app/layout/flights/all_flights_view.dart';
import 'package:ticket_booking_app/layout/flights/details_flights.dart';
import 'package:ticket_booking_app/layout/hotels/all_hotels_view.dart';
import 'package:ticket_booking_app/layout/hotels/all_photos.dart';
import 'package:ticket_booking_app/layout/hotels/hotels_details.dart';
import 'package:ticket_booking_app/layout/mainView.dart';
import 'package:ticket_booking_app/layout/settings/language_screen.dart';
import 'package:ticket_booking_app/layout/settings/password_settings.dart';
import 'package:ticket_booking_app/layout/settings/ticket_settings_page.dart';
import 'package:ticket_booking_app/layout/start/start_page.dart';
import 'package:ticket_booking_app/layout/ticket_page.dart';
import 'package:ticket_booking_app/layout/widgets/settings/about_screen.dart';
import 'package:ticket_booking_app/layout/widgets/settings/account_manager.dart';
import 'package:ticket_booking_app/layout/widgets/settings/help_center.dart';
import 'package:ticket_booking_app/layout/widgets/settings/privacy_screen.dart';
import 'package:ticket_booking_app/modules/hotels.dart';


Map<String, Widget Function(BuildContext)> pages = {
  AppRoutes.start : (context) => const StartPage(),
  AppRoutes.main : (context) => const MainView(),
  AppRoutes.lang : (context) => const LanguageScreen(),
  AppRoutes.ticketSettings : (context) => const TicketSettingsPage(),

  ///  ---------------------------  Authentication Routes ------------------------------
  AppRoutes.authDirector : (context) =>  const AuthDirector(),
  AppRoutes.login : (context) =>  const LoginScreen(),
  AppRoutes.register : (context) =>  const RegisterScreen(),
  AppRoutes.forgotPassword : (context) =>  const ForgotPasswordScreen(),
  AppRoutes.verifyCode : (context) =>  const VerifyCodeScreen(),
  AppRoutes.resetPassword : (context) =>  const ResetPasswordScreen(),


  ///  ---------------------------  Profile Routes ------------------------------
  AppRoutes.helpCenter : (context) => const HelpScreen(),
  AppRoutes.about : (context) => const AboutScreen(),
  AppRoutes.favorite : (context) => const FavoritesPage(),
  AppRoutes.tickets : (context) => TicketPage(),
  AppRoutes.privacy : (context) => const PrivacyScreen(),
  AppRoutes.pass : (context) => const PasswordSettings(),
  AppRoutes.account : (context) => const AccountManager(),

  AppRoutes.allTickets : (context) => const AllFlightsView(),
  AppRoutes.ticketsDetails : (context) => const DetailsFlights(),
  // {
  //   final Object flights = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
  //   return DetailsFlights();
  // },

  AppRoutes.allHotels : (context) => AllHotelsView(),
  AppRoutes.allPhotos : (context) => const AllPhotosView(),
  AppRoutes.hotelsDetails : (context) {
    final Object hotels = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return HotelsDetails(hotels: hotels);
  }



};