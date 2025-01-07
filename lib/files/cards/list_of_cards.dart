import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:zameen_flutter/files/api%20connection/api_functions.dart';
import 'package:zameen_flutter/files/cards/cards_widget.dart';
import 'package:zameen_flutter/files/store%20data/manage_share_preferences.dart';

class ListOfCards extends StatefulWidget {
  String headerText;
  double widthRatio;
  double height;
  ListOfCards(
      {super.key,
      required this.headerText,
      required this.widthRatio,
      required this.height});

  @override
  State<ListOfCards> createState() => _ListOfCardsState();
}

class _ListOfCardsState extends State<ListOfCards> {
  late Future<Map<String, dynamic>> combinedData;
  Future<Map<String, dynamic>> fetchCombinedData() async {
    try {
      List favourites = await getFavourites(); // Fetch favourites
      Map<String, dynamic> recommendations =
          await fetchRecommendations(); // Fetch recommendations
      return {
        'favourites': favourites,
        'recommendations': recommendations,
      };
    } catch (e) {
      throw Exception("Error fetching data: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    combinedData = fetchCombinedData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: combinedData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            print(snapshot.error);
            return const Text(
                "Either the server is not availible or you are offline");
          } else if (snapshot.hasData) {
            Map<String, dynamic> result = snapshot.data!;
            List<dynamic> data;
            if (widget.headerText == '  ➡️  Favorites') {
              data = result['favourites'];
            } else {
              data = result['recommendations']['success'];
            }
            List<dynamic> favouritesList = result['favourites'];
            return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.headerText.toString(),
                    style: const TextStyle(fontFamily: 'Itim', fontSize: 20),
                  ),
                  data.length > 0
                      ? SizedBox(
                          height: widget.height,
                          child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: data.length,
                              itemBuilder: (context, index) {
                                var record = data[index];
                                bool isFavourite = favouritesList.any((fav) =>
                                    jsonEncode(fav) == jsonEncode(record));
                                return EstateCard(
                                  propertyName: record[3] ?? 'Unknown',
                                  purpose: record[12] ?? 'Unknown',
                                  area: record[11] ?? 'Unknown',
                                  province: record[7] ?? 'Unknown',
                                  city: record[6] ?? 'Unknown',
                                  location: record[5] ?? 'Unknown',
                                  latitude: record[8] ?? 'Unknown',
                                  longitude: record[9] ?? 'Unknown',
                                  pageUrl: record[2] ?? 'Unknown',
                                  bedrooms: record[13] ?? 'Unknown',
                                  baths: record[10] ?? 'Unknown',
                                  agency:
                                      record[15] == '' ? 'Unknown' : record[15],
                                  agent:
                                      record[16] == '' ? 'Unknown' : record[16],
                                  price: record[4] ?? 'Unknown',
                                  widthRatio: widget.widthRatio,
                                  height: widget.height,
                                  record: record,
                                  isFavourite: isFavourite ? 'on' : 'off',
                                );
                              }),
                        )
                      : const Text(
                          'No Favouties found Try adding some in browse estates')
                ]);
          } else {
            return const Center(child: Text('No data available'));
          }
        });
  }
}
