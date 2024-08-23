import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FormatHelper{

  String getCurrentTime(BuildContext context) {
    final now = DateTime.now();
    final locale = Localizations.localeOf(context).toString();
    final formatter = DateFormat.jm(locale);
    return formatter.format(now);
  }

  String formattedTime(BuildContext context, String time) {
    final locale = Localizations.localeOf(context).toString();
    final formatter = DateFormat.jm(locale);
    return formatter.format(DateTime.parse(time));
  }


  String getCurrentDate(BuildContext context) {
    final now = DateTime.now();
    final locale = Localizations.localeOf(context).toString();
    final formatter = DateFormat('d MMMM', locale);
    return formatter.format(now);
  }
  String getSecondaryDate(BuildContext context) {
    final now = DateTime.now();
    final locale = Localizations.localeOf(context).toString();
    final formatter = DateFormat('d MMMM yyyy', locale);
    return formatter.format(now);
  }
}