import 'package:flutter/material.dart';

class SelectBox extends StatefulWidget {
  final List<String> optionList;
  SelectBox({super.key, required this.optionList});

  @override
  State<SelectBox> createState() => SelectBoxState();
}

class SelectBoxState extends State<SelectBox> {
  String selectedValue = 'Flats';
  SelectBoxState();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Expanded(
          child: Center(
        child: DropdownButton(
          hint: const Text('Select Items'),
          value: selectedValue,
          onChanged: (newValue) {
            if (newValue != null) {
              setState(() {
                selectedValue = newValue;
              });
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
