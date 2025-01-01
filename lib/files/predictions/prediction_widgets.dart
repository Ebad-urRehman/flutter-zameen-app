import 'package:flutter/material.dart';
import 'package:zameen_flutter/files/api%20connection/api_functions.dart';

class PredictionUi extends StatefulWidget {
  const PredictionUi({super.key});

  @override
  State<PredictionUi> createState() => _PredictionUiState();
}

class _PredictionUiState extends State<PredictionUi> {
  late Future<Map<String, dynamic>> uniqueValues;
  final TextEditingController areaController = TextEditingController();

  bool validateInputs(Map selectedValuesMap) {
    List<String> validationKeys = [
      'area_type',
      'area',
      'location',
      'property_type',
      'province_name',
      'city',
      'baths',
      'bedrooms'
    ];
    for (var key in validationKeys) {
      if (!selectedValuesMap.containsKey(key)) {
        return false;
      }
    }
    return true;
  }

  Map<String, dynamic> selectedValuesMap = {};
  void updateSelectedValues(
      {required String columnName, required dynamic value}) {
    setState(() {
      selectedValuesMap[columnName] = value;
      print(selectedValuesMap);
    });
  }

  String? errorMessage = '';
  String? predictionResult = '';

  @override
  void initState() {
    super.initState();
    uniqueValues = fetchData();
  }

  @override
  Widget build(BuildContext context) {
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
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 100,
                    child: TextFormField(
                      controller: areaController,
                      decoration:
                          const InputDecoration(label: Text('Enter Area')),
                    ),
                  ),
                  SelectBox(
                    optionList: const ['marlas', 'kanals'],
                    columnName: 'Area Type',
                    onValueChanged: (value) {
                      updateSelectedValues(
                          columnName: 'area_type', value: value);
                    },
                  ),
                ],
              ),
              SizedBox(
                width: MediaQuery.sizeOf(context).width,
                child: SelectBox(
                  optionList: data['location'],
                  columnName: 'Location',
                  onValueChanged: (value) {
                    updateSelectedValues(columnName: 'location', value: value);
                  },
                ),
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SelectBox(
                      optionList: data['province_name'],
                      columnName: 'Province',
                      onValueChanged: (value) {
                        updateSelectedValues(
                            columnName: 'province_name', value: value);
                      },
                    ),
                    SelectBox(
                      optionList: data['city'],
                      columnName: 'City',
                      onValueChanged: (value) {
                        updateSelectedValues(columnName: 'city', value: value);
                      },
                    ),
                  ]),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SelectBox(
                      optionList: data['property_type'],
                      columnName: 'Property Type',
                      onValueChanged: (value) {
                        updateSelectedValues(
                            columnName: 'property_type', value: value);
                      },
                    ),
                    SelectBox(
                      optionList: data['purpose'],
                      columnName: 'Purpose',
                      onValueChanged: (value) {
                        updateSelectedValues(
                            columnName: 'purpose', value: value);
                      },
                    ),
                  ]),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SelectBox(
                      optionList: data['bedrooms'],
                      columnName: 'Bedrooms',
                      onValueChanged: (value) {
                        updateSelectedValues(
                            columnName: 'bedrooms', value: value);
                      },
                    ),
                    SelectBox(
                      optionList: data['baths'],
                      columnName: 'Baths',
                      onValueChanged: (value) {
                        updateSelectedValues(columnName: 'baths', value: value);
                      },
                    ),
                  ]),
              ElevatedButton(
                  onPressed: () async {
                    if (areaController.text == '' ||
                        int.tryParse(areaController.text) == null) {
                      setState(() {
                        errorMessage = 'Enter area(numbers only)';
                      });
                    } else {
                      selectedValuesMap['area'] = areaController.text;
                      if (validateInputs(selectedValuesMap)) {
                        final Map data = await predictPrices(selectedValuesMap);
                        String price = data['success']['predicted_price'];
                        String abbreviateNumber = data['success']['abb'];
                        setState(() {
                          predictionResult =
                              'Estimated price is $price PKR | $abbreviateNumber PKR';
                          errorMessage = '';
                        });
                      } else {
                        setState(() {
                          errorMessage = 'Please select entries for all fields';
                        });
                      }
                    }
                  },
                  child: const Text('Predict Price')),
              Text(
                predictionResult ?? '',
                style: const TextStyle(
                    fontFamily: 'Itim', color: Colors.blue, fontSize: 20),
              ),
              Text(
                errorMessage ?? '',
                style: const TextStyle(
                    fontFamily: 'Itim', color: Colors.red, fontSize: 18),
              )
            ],
          );
        } else {
          return const Text('No data available');
        }
      },
    );
  }
}

class SelectBox extends StatefulWidget {
  final List<dynamic> optionList;
  final String columnName;
  final ValueChanged<String?> onValueChanged;
  const SelectBox(
      {super.key,
      required this.optionList,
      required this.columnName,
      required this.onValueChanged});

  @override
  State<SelectBox> createState() => SelectBoxState();
}

class SelectBoxState extends State<SelectBox> {
  late String? selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = null;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Expanded(
          child: Center(
        child: DropdownButton(
          hint: Center(child: Text('Select ${widget.columnName}')),
          value: selectedValue,
          onChanged: (newValue) {
            if (newValue != null) {
              setState(() {
                selectedValue = newValue
                    .toString(); // Initialize `selectedValue` in `initState`
              });
              widget.onValueChanged(selectedValue);
            }
          },
          items: widget.optionList.map((valueItem) {
            return DropdownMenuItem(value: valueItem, child: Text(valueItem));
          }).toList(),
        ),
      )),
    );
  }
}
