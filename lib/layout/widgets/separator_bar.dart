import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ticket_booking_app/constants.dart';
import 'package:ticket_booking_app/providers/home_provider.dart';

class SeparatorBar extends StatelessWidget {
  const SeparatorBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final homeNotifier = Provider.of<HomeNotifier>(context);
    bool isRTL = homeNotifier.locale.languageCode.toLowerCase() == 'ar';

    return Container(
      color: kBottomBoxColor,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
           SizedBox(width: 10,height: 20,
            child: DecoratedBox(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: isRTL ? const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10)
                  ) : const BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10)
                  )
              ),
            ),),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: LayoutBuilder(
                builder: (context,constraints){
                  return Flex(
                    direction: Axis.horizontal,
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate((constraints.constrainWidth() / 15).floor(), (_) => const SizedBox(width: 3,height: 1, child: DecoratedBox(decoration: BoxDecoration(color: Colors.white),),)),
                  );
                },
              ),
            ),
          ),
          SizedBox(width: 10,height: 20,
            child: DecoratedBox(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: isRTL ? const BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10)
                  ): const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10)
                  )
              ),
            ),)
        ],
      ),
    );
  }
}
