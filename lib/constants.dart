

import 'package:flutter/material.dart';

const Color kPrimaryColor = Color(0xFF687daf);
const Color kLightGreyColor = Color(0xFFBDBDBD);
const Color kUnselectedItemColor = Color(0xFF526480);
const Color kBackgroundColor = Color(0xFFeeedf2);
const Color kOrangeColor = Color(0xFF526799);
const Color kLightThemeTextColor = Color(0xFF3b3b3b);
const Color kUpperBoxColor = Color(0xFF526799);
const Color kBottomBoxColor = Color(0xFFF37B67);
const Color kTitleColor = Color(0xFFd2bdb6);
const Color kButtonColor = Color(0xD91130CE);
const Color kBlueCircleColor = Color(0xFF264CD2);
const Color kCyanColor = Color(0xFF32AFB2);
const Color kRedColor = Color(0xFFDC5538);
const Color kCircleColor = Color(0xFF3AB8B8);
const Color kLightBlueColorColor = Color(0xFF8ACCF7);

TextStyle kLargeHeading(context) => Theme.of(context).textTheme.headlineSmall!.copyWith(color: kTitleColor,fontSize: 24);
TextStyle kSmallText(context) => Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.white,fontSize: 16);