import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zameen_flutter/files/api%20connection/api_functions.dart';
import 'package:zameen_flutter/files/predictions/prediction_widgets.dart';
import 'package:zameen_flutter/theme_widget.dart';

class SearchFilterExample extends StatefulWidget {
  const SearchFilterExample({super.key});

  @override
  _SearchFilterExampleState createState() => _SearchFilterExampleState();
}

class _SearchFilterExampleState extends State<SearchFilterExample> {
  late Future<Map<String, dynamic>> uniqueValues;

  List<String> data = [
    "For Rent",
    "For Sale",
    "House",
    "Room",
    "Penthouse",
    "Farm House",
    "Lower Portion",
    "Upper Portion"
  ];

  List<String> filters = [
    "Purpose For Rent",
    "Purpose For Sale",
    "Property House",
    "Property Room",
    "Property Penthouse",
    "Property Farm House",
    "Property Lower Portion",
    "Property Upper Portion"
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
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (snapshot.hasData) {
          // Display data here
          final data = snapshot.data!;
          return Scaffold(
            appBar: AppBar(
              title: const Text("Search and Filter"),
              backgroundColor: themeProvider.currentTheme.primaryColor,
            ),
            backgroundColor: themeProvider.currentTheme.secondaryColor,
            body: Column(
              children: [
                Text(
                  'Search by $selectedSearchOption',
                  style: TextStyle(
                      color: themeProvider.currentTheme.white,
                      fontFamily: 'Itim'),
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
                  Slider(
                    label: 'Select Max bedrooms filter $bedroomValue',
                    value: bedroomValue,
                    min: 1,
                    max: 10,
                    divisions: 9,
                    onChanged: (value) {
                      setState(() {
                        bedroomValue = value;
                      });
                    },
                    thumbColor: themeProvider.currentTheme.primaryColor,
                    activeColor: themeProvider.currentTheme.primaryColor,
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
                        });
                      },
                      thumbColor: themeProvider.currentTheme.primaryColor,
                      activeColor: themeProvider.currentTheme.primaryColor,
                    ),
                    SelectBox(
                      optionList: const ['marlas', 'kanals'],
                      columnName: 'Area Type',
                      onValueChanged: (value) {
                        setState(() {
                          updateSelectedValues(
                              columnName: 'area_type', value: value);
                        });
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
                            } else {
                              selectedFilters.remove(filter);
                            }
                          });
                        },
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          );
        } else {
          return const Text('No data available');
        }
      },
    );
  }
}
