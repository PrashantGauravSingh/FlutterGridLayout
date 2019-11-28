import 'package:flutter/material.dart';


class DropDownDeviceType extends StatelessWidget {
  final List<String> _dropdownValues = [
    "All Devices",
    "Air Conditioner",
    "Socket",
    "Geyser",
    "Fan"
  ]; //The list of values we want on the dropdown

  @override
  Widget build(BuildContext context) {
    return  DropdownButton(
          items: _dropdownValues
              .map((value) => DropdownMenuItem(
            child: Text(value),
            value: value,
          ))
              .toList(),
          onChanged: (String value) {},
          isExpanded: false,
          hint: Text('All Devices'),
        );
  }
}