import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ticket_booking_app/providers/home_provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = Provider.of<HomeNotifier>(context);
    return ListView(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextButton(
              onPressed: (){
                if (locale.locale.languageCode.toLowerCase() == 'en') {
                  locale.setLocale(const Locale('en'));
                } else {
                  locale.setLocale(const Locale('ar'));
                }
              },
              child: Text('Lang'),
            ),
          ],

        )
      ],
    );
  }
}
