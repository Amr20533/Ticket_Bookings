import 'package:flutter/material.dart';
import 'package:ticket_booking_app/models/Hotels/hotel_response_model.dart';
import 'package:ticket_booking_app/utils/hero_static/page_exports.dart';



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

  ///  ---------------------------  Search Routes ------------------------------
  AppRoutes.search : (context) => const SearchView(),


  ///  ---------------------------  Profile Routes ------------------------------
  AppRoutes.helpCenter : (context) => const HelpScreen(),
  AppRoutes.about : (context) => const AboutScreen(),
  AppRoutes.favorite : (context) => const FavoritesPage(),
  AppRoutes.tickets : (context) => TicketPage(),
  AppRoutes.privacy : (context) => const PrivacyScreen(),
  AppRoutes.pass : (context) => const PasswordSettings(),
  AppRoutes.account : (context) => const AccountManager(),
  AppRoutes.successBooking : (context) => const PaymentSuccess(),
  AppRoutes.failedBooking : (context) => const PaymentFailed(),

  AppRoutes.allTickets : (context) => const AllFlightsView(),
  AppRoutes.ticketsDetails : (context) {
    final Object flights = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return DetailsFlights(flight: flights,);
  },

  AppRoutes.ticketCreate : (context) {
    final Object flights = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return CreateTicketPage(flight: flights,);
  },

  AppRoutes.allHotels : (context) => AllHotelsView(),
  AppRoutes.allPhotos : (context) => const AllPhotosView(),
  AppRoutes.hotelsDetails : (context) {
    final Object? hotel = ModalRoute.of(context)!.settings.arguments;
    return HotelsDetails(hotel: hotel);
  }



};