import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zameen_flutter/constants/custom_widgets.dart';
import 'package:zameen_flutter/files/Helpers/helper.dart';
import 'package:zameen_flutter/files/api%20connection/api_functions.dart';
import 'package:zameen_flutter/files/predictions/prediction_widgets.dart';
import 'package:zameen_flutter/files/search/simple_query_result.dart';
import 'package:zameen_flutter/theme_widget.dart';

class SearchFilterExample extends StatefulWidget {
  const SearchFilterExample({super.key});

  @override
  _SearchFilterExampleState createState() => _SearchFilterExampleState();
}

class _SearchFilterExampleState extends State<SearchFilterExample> {
  late Future<Map<String, dynamic>> uniqueValues;
  Map queryParams = {};

  List<String> filters = [
    "Purpose For Rent",
    "Purpose For Sale",
    "Property_Type House",
    "Property_Type Room",
    "Property_Type Penthouse",
    "Property_Type Farm House",
    "Property_Type Lower Portion",
    "Property_Type Upper Portion"
  ];
  List<String> selectedFilters = [];
  String searchQuery = "";
  List filteredData = [];

  String selectedSearchOption = 'City';
  List<String> searchOptions = ['Location', 'City', 'Province Name'];

  double bedroomValue = 3;
  double bathsValue = 3;
  double areaValue = 5;

  @override
  void initState() {
    super.initState();
    uniqueValues = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeManager>(context);

    Map<String, dynamic> selectedValuesMap = {};
    void updateSelectedValues(
        {required String columnName, required dynamic value}) {
      setState(() {
        selectedValuesMap[columnName] = value;
        print(selectedValuesMap);
      });
    }

    return FutureBuilder<Map<String, dynamic>>(
      future: uniqueValues,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: const CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (snapshot.hasData) {
          // Display data here
          final data = snapshot.data!;
          return Scaffold(
            appBar: AppBar(
              title: AppBarText(text: 'Search and Filter'),
              backgroundColor: themeProvider.currentTheme.primaryColor,
            ),
            backgroundColor: themeProvider.currentTheme.secondaryColor,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    'Search by $selectedSearchOption',
                    style: const TextStyle(
                        color: Colors.black, fontFamily: 'Itim'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          searchQuery = value;
                          List<dynamic> cityData = data[selectedSearchOption
                              .toLowerCase()
                              .replaceAll(' ', '_')];
                          filteredData = cityData
                              .where((item) =>
                                  item.startsWith(value)) // Returns a bool
                              .toList();
                          print(filteredData);
                        });
                      },
                      decoration: InputDecoration(
                        hintText: "Search ...",
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        fillColor: themeProvider.currentTheme.secondaryColor,
                        suffixIcon: PopupMenuButton<String>(
                          icon: const Icon(Icons.arrow_drop_down),
                          onSelected: (String value) {
                            setState(() {
                              selectedSearchOption = value;
                            });
                          },
                          itemBuilder: (BuildContext context) {
                            return searchOptions.map((String option) {
                              return PopupMenuItem(
                                value: option,
                                child: Text(option),
                              );
                            }).toList();
                          },
                        ),
                      ),
                    ),
                  ),
                  if (searchQuery.isNotEmpty) // Show only when there is input
                    SizedBox(
                      height: 200, // Adjust as needed
                      child: ListView.builder(
                        itemCount: filteredData.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(filteredData[index]),
                            onTap: () {
                              setState(() {
                                filters.add(
                                    '$selectedSearchOption ${filteredData[index]}');
                                filteredData = [];
                              });
                            },
                          );
                        },
                      ),
                    ),
                  Row(children: [
                    Flexible(
                      flex: 1,
                      child: Slider(
                        label: 'Select Max bedrooms filter $bedroomValue',
                        value: bedroomValue,
                        min: 1,
                        max: 10,
                        divisions: 9,
                        onChanged: (value) {
                          setState(() {
                            bedroomValue = value;
                            queryParams = updateQueryParamsValue(
                                queryColumn: 'bedrooms',
                                queryParams: queryParams,
                                queryValue: value);
                          });
                        },
                        thumbColor: themeProvider.currentTheme.primaryColor,
                        activeColor: themeProvider.currentTheme.primaryColor,
                      ),
                    ),
                    Slider(
                      label: 'Select Max baths filter $bathsValue',
                      value: bathsValue,
                      min: 1,
                      max: 10,
                      divisions: 9,
                      onChanged: (value) {
                        setState(() {
                          bathsValue = value;
                          queryParams = updateQueryParamsValue(
                              queryColumn: 'baths',
                              queryParams: queryParams,
                              queryValue: value);
                        });
                      },
                      thumbColor: themeProvider.currentTheme.primaryColor,
                      activeColor: themeProvider.currentTheme.primaryColor,
                    ),
                  ]),
                  Row(
                    children: [
                      Slider(
                        label: 'Select Max Area $areaValue units',
                        value: areaValue,
                        min: 3,
                        max: 15,
                        divisions: 12,
                        onChanged: (value) {
                          setState(() {
                            areaValue = value;
                            queryParams = updateQueryParamsValue(
                                queryColumn: 'area',
                                queryParams: queryParams,
                                queryValue: value);
                          });
                        },
                        thumbColor: themeProvider.currentTheme.primaryColor,
                        activeColor: themeProvider.currentTheme.primaryColor,
                      ),
                      SelectBox(
                        optionList: const ['Marla', 'Kanal'],
                        columnName: 'Area Type',
                        onValueChanged: (value) {
                          setState(() {
                            updateSelectedValues(
                                columnName: 'area_type', value: value);
                          });
                          queryParams = updateQueryParamsValue(
                              queryColumn: 'area_type',
                              queryParams: queryParams,
                              queryValue: value);
                        },
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Wrap(
                      spacing: 8.0,
                      runSpacing: 8.0,
                      children: filters.map((filter) {
                        return FilterChip(
                          label: Text(filter),
                          selected: selectedFilters.contains(filter),
                          onSelected: (bool selected) {
                            setState(() {
                              if (selected) {
                                selectedFilters.add(filter);

                                queryParams = addQueryParams(
                                    queryParams: queryParams, filter: filter);
                                // seperating column name and values
                              } else {
                                selectedFilters.remove(filter);
                                queryParams = removeQueryParams(
                                    queryParams: queryParams, filter: filter);
                              }
                            });
                          },
                        );
                      }).toList(),
                    ),
                  ),
                  SimpleQueryResult(
                      headerText: 'Query Results',
                      widthRatio: 1.3,
                      height: 350,
                      queryParams: queryParams)
                ],
              ),
            ),
          );
        } else {
          return const Text('No data available');
        }
      },
    );
  }
}
