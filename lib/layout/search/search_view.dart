import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ticket_booking_app/constants.dart';
import 'package:ticket_booking_app/core/localization/app_localization.dart';
import 'package:ticket_booking_app/providers/search/search_notifier.dart';


class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Consumer<SearchNotifier>(builder: (context, search, _){
            return Column(
              children: [
                Container(
                  height: 45,
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0XFFF4F6FD),
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: (){
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: Color(0XFFBFC205),
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          controller: search.searchFlightsController,
                          cursorColor: kPrimaryColor,
                          decoration: InputDecoration(
                            hintText: AppLocalizations.of(context).translate('home-search'),
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.only(left: 10,right: 10, bottom: 8),
                          ),
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ),
                      IconButton(
                        onPressed: (){
                          search.searchFlightsController.clear();
                        },
                        icon: const Icon(
                          Icons.clear,
                          color: Color(0XFFBFC205),
                        ),
                      ),
                    ],
                  ),
                ),

                search.searchFlightsController.text.isNotEmpty
                    ?
                Column(
                  children: List.generate(search.filteredHotels.length, (result){
                    return Container(
                      child: Text(search.filteredHotels[result].hotelName, style: Theme.of(context).textTheme.titleLarge,),
                    );
                  }),
                ) : const SizedBox.shrink(),

                // search.searchFlightsController.text.isNotEmpty
                //     ? FutureBuilder<List<Hotel>>(
                //   future: search.searchForHotels(),
                //   builder: (context, snapshot) {
                //     if (snapshot.connectionState == ConnectionState.waiting) {
                //       return const CircularProgressIndicator();
                //     } else if (snapshot.hasError) {
                //       return Text('Error: ${snapshot.error}');
                //       debugPrint('Error: ${snapshot.error}');
                //     } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                //       return Text('No hotels found.');
                //     } else {
                //       return Column(
                //         children: List.generate(snapshot.data!.length, (index) {
                //           return Container(
                //             child: Text(
                //               snapshot.data![index].hotelName,
                //               style: Theme.of(context).textTheme.titleLarge,
                //             ),
                //           );
                //         }),
                //       );
                //     }
                //   },
                // )
                //     : const SizedBox.shrink(),
              ],
            );
          }),
        ),
      ),
    );
  }
}
