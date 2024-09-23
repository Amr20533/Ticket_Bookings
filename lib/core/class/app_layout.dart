import 'package:flutter/cupertino.dart';

class AppLayout{
  static getSize(BuildContext context){
    return MediaQuery.of(context).size;
  }
  static getScreenWidth(BuildContext context){
    return MediaQuery.of(context).size.width;
  }
  static getScreenHeight(BuildContext context){
    return MediaQuery.of(context).size.height;
  }
  static getHeight(BuildContext context, double pixels){
    double y = getScreenHeight(context) / pixels;
    return getScreenHeight(context) / y;
  }
  static getWidth(BuildContext context, double pixels){
    double x = getScreenWidth(context) / pixels;
    return getScreenWidth(context) / x;
  }
}