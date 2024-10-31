import 'package:flutter/material.dart';
import 'package:xp_store/utils/constants/colors.dart';

class XPShadowStyle {
  static final verticalProductShadow = BoxShadow(
      color: XPColors.darkGrey.withOpacity(0.1),
      blurRadius: 50,
      spreadRadius: 7,
      offset: const Offset(0, 2));

  static final horizontalProductShadow = BoxShadow(
      color: XPColors.darkGrey.withOpacity(0.1),
      blurRadius: 50,
      spreadRadius: 7,
      offset: const Offset(0, 2));
}
