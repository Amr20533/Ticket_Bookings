import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ticket_booking_app/constants.dart';
import 'package:ticket_booking_app/core/class/app_layout.dart';
import 'package:ticket_booking_app/core/localization/app_localization.dart';
import 'package:ticket_booking_app/layout/widgets/settings/custom_settings_app_bar.dart';
import 'package:ticket_booking_app/providers/language_notifier.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final langNotifier = Provider.of<LanguageNotifier>(context);
    String language = langNotifier.locale.languageCode.toLowerCase();
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: customSettingsAppBar(context, title: AppLocalizations.of(context).translate('lang')),
      body: Consumer<LanguageNotifier>(
        builder: (context, lang, _){
          return SafeArea(
            child: Column(
              children: List.generate(2, (index) {
                bool selected = language == lang.locales[index].languageCode.toLowerCase();
                return GestureDetector(
                onTap: (){
                  lang.setLocale(lang.locales[index]);
                  Future.delayed(const Duration(milliseconds: 700), (){
                    Navigator.pop(context);
                  });
                },
                child: Row(
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 700),
                      curve: Curves.easeInOut,
                      key: ValueKey<bool>(selected),
                      width: AppLayout.getWidth(context, 25),
                      height: AppLayout.getHeight(context, 25),
                      margin: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(context, 20), vertical: AppLayout.getHeight(context, 6)),
                      padding: EdgeInsets.all(AppLayout.getWidth(context, 4)),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(width: 1, color: kUpperBoxColor)
                      ),
                      child: DecoratedBox(
                        key: ValueKey<bool>(selected),
                        decoration: BoxDecoration(
                            color: selected ? kUpperBoxColor : Colors.transparent,
                            shape: BoxShape.circle
                        ),
                      ),
                    ),
                    Text(AppLocalizations.of(context).translate(lang.locales[index].languageCode.toLowerCase()), style: Theme.of(context).textTheme.titleLarge,),
                  ],
                ),
              );
              }),
            ),
          );
        },
      ),
    );
  }


}
