import 'package:flutter/material.dart';
import 'package:xp_store/utils/theme/custom_themes/appbar_theme.dart';
import 'package:xp_store/utils/theme/custom_themes/bottom_sheet_theme.dart';
import 'package:xp_store/utils/theme/custom_themes/checkbox_theme.dart';
import 'package:xp_store/utils/theme/custom_themes/chip_theme.dart';
import 'package:xp_store/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:xp_store/utils/theme/custom_themes/outlined_button_theme.dart';
import 'package:xp_store/utils/theme/custom_themes/text_field_theme.dart';
import 'package:xp_store/utils/theme/custom_themes/text_theme.dart';

class XPAppTheme {
  XPAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    textTheme: XPTextTheme.lightTextTheme,
    chipTheme: XPChipTheme.lightChipTheme,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: XPAppBarTheme.lightAppBarTheme,
    checkboxTheme: XPCheckboxTheme.lightCheckboxTheme,
    bottomSheetTheme: XPBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: XPElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: XPOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: XPTextFieldTheme.lightInputDecorationTheme,
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    textTheme: XPTextTheme.darkTextTheme,
    chipTheme: XPChipTheme.darkChipTheme,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: XPAppBarTheme.darkAppBarTheme,
    checkboxTheme: XPCheckboxTheme.darkCheckboxTheme,
    bottomSheetTheme: XPBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: XPElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: XPOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: XPTextFieldTheme.darkInputDecorationTheme,
  );
}
