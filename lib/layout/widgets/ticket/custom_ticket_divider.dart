import 'package:flutter/material.dart';

class CustomTicketDivider extends StatelessWidget {
  const CustomTicketDivider({
    super.key,
    required double width,
  }) : _width = width;

  final double _width;

  @override
  Widget build(BuildContext context) {
    return Container(width: _width,
      padding: const EdgeInsets.all(12.0),
      child: LayoutBuilder(
        builder: (context,constraints){
          return Flex(
            direction: Axis.horizontal,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate((constraints.constrainWidth() / 15).floor(), (_) => const SizedBox(width: 3,height: 1, child: DecoratedBox(decoration: BoxDecoration(color: Colors.black26),),)),
          );
        },
      ),
    );
  }
}
