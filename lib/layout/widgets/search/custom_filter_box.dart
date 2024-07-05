import 'package:flutter/material.dart';
import 'package:ticket_booking_app/core/localization/app_localization.dart';
import 'package:ticket_booking_app/providers/search_notifier.dart';

class CustomFilterBox extends StatelessWidget {
  const CustomFilterBox({
    super.key,
    required double height,
    required double width,
    required this.title,
    required this.subTitle,
    required this.search,
  }) : _height = height, _width = width;

  final double _height;
  final double _width;
  final SearchNotifier search;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _height * 0.042,width: _width * 0.9,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(_width * 0.08),
        color: const Color(0XFFF4F6FD),
      ),
      child: Row(
        children: [
          InkWell(
            onTap:(){
              search.selectedIndex = 0;
            },
            child: Container(alignment: Alignment.center,
              width: _width * 0.44,
              decoration: search.selectedIndex == 0 ? BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(_width * 0.04), bottomLeft: Radius.circular(_width * 0.04)),
                color: Colors.white,
              ) : const BoxDecoration(),
              child: Text(title),
            ),
          ),
          InkWell(
            onTap:(){
              search.selectedIndex = 1;
            },
            child: Container(alignment: Alignment.center,
              width: _width * 0.45,
              decoration: search.selectedIndex == 1 ? BoxDecoration(
                borderRadius: BorderRadius.only(topRight: Radius.circular(_width * 0.04), bottomRight: Radius.circular(_width * 0.04)),
                color: Colors.white,
              ) : const BoxDecoration(),
              child: Text(subTitle),
            ),
          ),
        ],
      ),
    );
  }
}
