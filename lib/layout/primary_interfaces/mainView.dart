import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ticket_booking_app/providers/features/home_provider.dart';


class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeNotifier>(builder: (context, home, _) {
      return Scaffold(
        body:SafeArea(
          child: home.screens[home.curPage],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: home.curPage,
          onTap: (index) {
            home.curPage = index;
          },
          items: home.items,
        ),
      );
    });
  }
}
