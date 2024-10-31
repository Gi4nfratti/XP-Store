import 'package:flutter/material.dart';
import 'package:xp_store/utils/constants/colors.dart';

class XPChipTheme {
  XPChipTheme._();

  static ChipThemeData lightChipTheme = ChipThemeData(
    disabledColor: XPColors.grey.withOpacity(0.4),
    labelStyle: const TextStyle(color: Colors.black),
    selectedColor: Colors.green,
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
    checkmarkColor: XPColors.white,
  );

  static ChipThemeData darkChipTheme = const ChipThemeData(
    disabledColor: XPColors.grey,
    labelStyle: TextStyle(color: XPColors.white),
    selectedColor: Colors.green,
    padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
    checkmarkColor: XPColors.white,
  );
}
