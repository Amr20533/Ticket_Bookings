import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ticket_booking_app/core/class/app_layout.dart';
import 'package:ticket_booking_app/layout/widgets/profile/custom_profile_view.dart';
import 'package:ticket_booking_app/providers/settings/language_notifier.dart';
import 'package:ticket_booking_app/providers/settings/profile_notifier.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = Provider.of<LanguageNotifier>(context);

    return Consumer<ProfileNotifier>(builder: (context, profile, _){
      return FutureBuilder<dynamic>(
        future: profile.getUserData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (snapshot.hasData) {
            var data = snapshot.data!;
            return CustomProfileView(
                width: AppLayout.getScreenWidth(context),
                data: data,
                locale: locale
            );
          } else {
            return const Text('No data available');
          }
        },
      );
    });

  }
}





