import 'package:flutter/material.dart';
import 'package:zameen_flutter/constants/app_colors.dart';

AppColors appColors = AppColors();

class InputWidgetDecoration {
  // String labelText;
  // String fontFamily;
  // Color color;
  // double borderRadius;
  // Color fillColor;
  // Color focusedColor;
  // Icon icon;

  // InputWidgetDecoration(
  //     {required this.labelText,
  //     required this.fontFamily,
  //     required this.color,
  //     required this.borderRadius,
  //     required this.fillColor,
  //     required this.focusedColor,
  //     required this.icon});

  var decoration = (
      {labelText,
      fontFamily,
      color,
      icon,
      borderRadius,
      fillColor,
      focusedColor}) {
    return InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(fontFamily: fontFamily, color: color),
        prefixIcon: icon,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius)),
        filled: true,
        fillColor: fillColor,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            color:
                focusedColor, // Outline color when the field is focused (active)
          ),
        ));
  };
}
