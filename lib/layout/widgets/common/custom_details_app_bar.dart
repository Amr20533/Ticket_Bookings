import 'package:flutter/material.dart';

AppBar customDetailsAppBar(BuildContext context, {required String title}) {
  return AppBar(
    title: Text(title, style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 22, color: Colors.black, fontWeight: FontWeight.w600),),
    centerTitle: true,
    leading: IconButton(onPressed: ()=> Navigator.pop(context),icon: const Icon(Icons.arrow_back_ios_rounded),),
  );
}
