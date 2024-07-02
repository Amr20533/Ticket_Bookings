import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ticket_booking_app/constants.dart';
import 'package:ticket_booking_app/providers/home_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final homeNotifier = Provider.of<HomeNotifier>(context);

    return ListView(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Good Morning", style:Theme.of(context).textTheme.titleLarge),
                      Text("Book Tickets", style:Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 22, fontWeight: FontWeight.w600)),

                    ],
                  ),
                  Container(
                    width: 50,height: 50,
                    decoration: BoxDecoration(
                      color: kUnselectedItemColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        Container(color: Colors.red,
          child: Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("mfaf", style:Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 22, fontWeight: FontWeight.w600)),
                  TextButton(onPressed: (){
                    homeNotifier.toggleTheme();
                  }, child: Text("See All", style:Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 14))),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
