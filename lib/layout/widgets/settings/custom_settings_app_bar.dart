import 'package:flutter/material.dart';

AppBar customSettingsAppBar(BuildContext context, {required String title}) {
  return AppBar(
    leading: IconButton(
      onPressed: ()=> Navigator.pop(context),
      icon: const Icon(Icons.arrow_back_ios_rounded),
    ),
    centerTitle: true,
    title: Text(title),
  );
}