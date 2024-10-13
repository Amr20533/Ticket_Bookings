import 'package:flutter/material.dart';
import 'package:ticket_booking_app/utils/helpers/request_message_helper.dart';
import 'package:ticket_booking_app/utils/hero_static/request_status.dart';
import 'package:toastification/toastification.dart';

void showCustomToast(BuildContext context,{
  required Animation<double> opacity,
  required RequestStatus status,
  required String title,
  required String message,
  Duration autoCloseDuration = const Duration(seconds: 2),
}) {
  toastification.show(
    context: context,
    type: ToastificationType.success,
    style: ToastificationStyle.flat,
    autoCloseDuration: autoCloseDuration,
    title: Text(title, style: Theme.of(context).textTheme.titleLarge,),
    description: RichText(text: TextSpan(text: message, style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 16, fontWeight: FontWeight.normal))),
    alignment: Alignment.bottomCenter,
    direction: TextDirection.ltr,
    animationDuration: const Duration(milliseconds: 300),
    animationBuilder: (context, animation, alignment, child) {
      return FadeTransition(
        opacity: opacity,
        child: child,
      );
    },
    icon: Icon(RequestMessageHelper().getToastIcon(status), color: RequestMessageHelper().getToastIconColor(status)),
    showIcon: true,
    primaryColor: Colors.green,
    backgroundColor: Colors.white,
    foregroundColor: Colors.black,
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
    margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    borderRadius: BorderRadius.circular(12),
    boxShadow: const [
      BoxShadow(
        color: Color(0x07000000),
        blurRadius: 16,
        offset: Offset(0, 16),
        spreadRadius: 0,
      ),
    ],
    showProgressBar: true,
    closeButtonShowType: CloseButtonShowType.onHover,
    closeOnClick: false,
    pauseOnHover: true,
    dragToClose: true,
    applyBlurEffect: false,
    callbacks: ToastificationCallbacks(
      onTap: (toastItem) => print('Toast ${toastItem.id} tapped'),
      onCloseButtonTap: (toastItem) => print('Toast ${toastItem.id} close button tapped'),
      onAutoCompleteCompleted: (toastItem) => print('Toast ${toastItem.id} auto complete completed'),
      onDismissed: (toastItem) => print('Toast ${toastItem.id} dismissed'),
    ),
  );
}
