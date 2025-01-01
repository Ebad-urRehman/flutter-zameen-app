import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zameen_flutter/files/api%20connection/api_functions.dart';
import 'package:zameen_flutter/files/cards/cards_widget.dart';
import 'package:zameen_flutter/theme_widget.dart';

class SimpleQueryResultScreen extends StatefulWidget {
  Map queryParams;

  SimpleQueryResultScreen({super.key, required this.queryParams});

  @override
  State<SimpleQueryResultScreen> createState() =>
      _SimpleQueryResultScreenState();
}

class _SimpleQueryResultScreenState extends State<SimpleQueryResultScreen> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeManager>(context);
    return MaterialApp(
        home: Scaffold(
            backgroundColor: themeProvider.currentTheme.secondaryColor,
            appBar: AppBar(
              title: const Text('Query Result'),
              backgroundColor: themeProvider.currentTheme.primaryColor,
            ),
            body: SimpleQueryResult(
              headerText: 'Houses for sale',
              widthRatio: 1.2,
              height: 450,
              queryParams: widget.queryParams,
            )));
  }
}

class SimpleQueryResult extends StatefulWidget {
  String headerText;
  double widthRatio;
  double height;
  Map queryParams;
  SimpleQueryResult(
      {super.key,
      required this.headerText,
      required this.widthRatio,
      required this.height,
      required this.queryParams});

  @override
  State<SimpleQueryResult> createState() => _SimpleQueryResultState();
}

class _SimpleQueryResultState extends State<SimpleQueryResult> {
  late Future<Map<String, dynamic>> recommendations;
  int pageNo = 1;
  int totalPages = 0;
  int totalResults = 0;
  @override
  void initState() {
    super.initState();
    recommendations = applyQuery(dataMap: widget.queryParams, pageNo: pageNo);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: applyQuery(dataMap: widget.queryParams, pageNo: pageNo),
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
            totalResults = result['total_results'];
            totalPages = result['total_pages'];
            print('result is ${result['success']}');
            return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${widget.headerText.toString()} $totalResults Results',
                      style: const TextStyle(fontFamily: 'Itim', fontSize: 20),
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height / 1.23,
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: data!.length,
                          itemBuilder: (context, index) {
                            var record = data[index];
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
                                agency: record[15] ?? 'Unknown',
                                agent: record[16] ?? 'Unknown',
                                price: record[4] ?? 'Unknown',
                                widthRatio: widget.widthRatio,
                                height: widget.height);
                          }),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              if (pageNo > 1) {
                                setState(() {
                                  pageNo = pageNo - 1;
                                });
                              }
                            },
                            child: const Icon(Icons.skip_previous)),
                        ElevatedButton(
                            onPressed: () {
                              if (pageNo < 100) {
                                setState(() {
                                  pageNo = pageNo + 1;
                                });
                              }
                            },
                            child: const Icon(Icons.skip_next)),
                        Text('Page $pageNo / $totalPages')
                      ],
                    )
                  ]),
            );
          } else {
            return const Center(child: Text('No data available'));
          }
        });
  }
}
