import 'package:flutter/material.dart';
import 'package:zameen_flutter/files/api%20connection/api_functions.dart';
import 'package:zameen_flutter/files/cards/cards_widget.dart';

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
  late Future<Map<String, dynamic>> recommendations;
  @override
  void initState() {
    super.initState();
    recommendations = fetchRecommendations();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: recommendations,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            print(snapshot.error);
            return Text("Error : ${snapshot.error}");
          } else if (snapshot.hasData) {
            Map<String, dynamic> result = snapshot.data!;
            print(snapshot.data);
            List<dynamic>? data = result['success'];
            print('result is ${result['success']}');
            return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.headerText.toString(),
                    style: const TextStyle(fontFamily: 'Itim', fontSize: 20),
                  ),
                  SizedBox(
                    height: widget.height,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: data!.length,
                        itemBuilder: (context, index) {
                          var record = data[index];
                          print(record);
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
                              agency: record[15] == '' ? 'Unknown' : record[15],
                              agent: record[16] == '' ? 'Unknown' : record[16],
                              price: record[4] ?? 'Unknown',
                              widthRatio: widget.widthRatio,
                              height: widget.height);
                        }),
                  )
                ]);
          } else {
            return const Center(child: Text('No data available'));
          }
        });
  }
}
