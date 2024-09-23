import 'package:flutter/material.dart';
import 'package:ticket_booking_app/core/class/app_layout.dart';

class SideBlackHandles extends StatelessWidget {
  const SideBlackHandles({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(context, 16)),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(width: 18,height: 18,
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
                border: Border.all(width: 2.5,color: Colors.black),
                shape: BoxShape.circle
            ),
            child: const DecoratedBox(
              decoration: BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.circle
              ),
            ),
          ),
          Container(width: 18,height: 18,
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
                border: Border.all(width: 2.5,color: Colors.black),
                shape: BoxShape.circle
            ),
            child: const DecoratedBox(
              decoration: BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.circle
              ),
            ),
          ),
        ],
      ),
    );
  }
}
