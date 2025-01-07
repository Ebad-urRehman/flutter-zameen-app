import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zameen_flutter/constants/custom_widgets.dart';
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
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            backgroundColor: themeProvider.currentTheme.secondaryColor,
            appBar: AppBar(
              title: AppBarText(text: 'Query Result'),
              backgroundColor: themeProvider.currentTheme.primaryColor,
            ),
            body: SimpleQueryResult(
              headerText: 'Query Results',
              widthRatio: 1.2,
              height: 350,
              queryParams: widget.queryParams,
            )));
  }
}

class SimpleQueryResult extends StatefulWidget {
  String headerText;
  double widthRatio;
  double height;
  Map queryParams;
  String isFavourite = 'off';
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
  double pageNo = 1;
  int totalPages = 0;
  int totalResults = 0;
  @override
  void initState() {
    super.initState();
    recommendations = applyQuery(dataMap: widget.queryParams, pageNo: pageNo);
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeManager>(context);
    return FutureBuilder(
        future: applyQuery(dataMap: widget.queryParams, pageNo: pageNo),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            print(snapshot.error);
            return const Text('No Results or offline');
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
                      height: MediaQuery.sizeOf(context).height / 1.4,
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
                              height: widget.height,
                              record: record,
                              isFavourite: widget.isFavourite,
                            );
                          }),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          child: ElevatedButton(
                              onPressed: () {
                                if (pageNo > 1.0) {
                                  setState(() {
                                    pageNo = pageNo - 1;
                                  });
                                }
                              },
                              child: const Icon(Icons.skip_previous)),
                        ),
                        ElevatedButton(
                            onPressed: () {
                              if (pageNo < totalPages) {
                                setState(() {
                                  pageNo = pageNo + 1;
                                });
                              }
                            },
                            child: const Icon(Icons.skip_next)),
                        Text('Page $pageNo / $totalPages      '),
                        Flexible(
                          flex: 1,
                          child: Slider(
                            label: 'Select Page no $pageNo',
                            value: pageNo,
                            min: 1.0,
                            max: totalPages.toDouble(),
                            divisions: totalPages - 1,
                            onChanged: (value) {
                              setState(() {
                                pageNo = value;
                              });
                            },
                            thumbColor: themeProvider.currentTheme.primaryColor,
                            activeColor:
                                themeProvider.currentTheme.primaryColor,
                          ),
                        ),
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
