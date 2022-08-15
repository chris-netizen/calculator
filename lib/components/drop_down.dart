import 'package:calculator/apptheme.dart';
import 'package:flutter/material.dart';

Widget customDropDown(List<String> items, String value, void onChange(val)) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
    decoration: BoxDecoration(
      border: Border.all(color: AppTheme.kLightGreyText),
      borderRadius: BorderRadius.circular(5),
    ),
    child: DropdownButton<String>(
      items: items.map<DropdownMenuItem<String>>((String val) {
        return DropdownMenuItem(
          value: val,
          child: Text(val),
        );
      }).toList(),
      value: value,
      onChanged: (val) {
        onChange(val);
      },
    ),
  );
}
