import 'package:flutter/material.dart';
import 'package:xp_store/utils/constants/colors.dart';
import 'package:xp_store/utils/constants/sizes.dart';
import 'package:xp_store/utils/device/device_utility.dart';
import 'package:xp_store/utils/helpers/helper_functions.dart';

class XPSearchContainer extends StatelessWidget {
  const XPSearchContainer({
    super.key,
    required this.text,
    this.icon = Icons.search_outlined,
    this.showBackground = true,
    this.showBorder = true,
    this.onTap,
    this.padding = const EdgeInsets.symmetric(horizontal: XPSizes.defaultSpace),
  });

  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final dark = XPHelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: padding,
        child: Container(
          width: XPDeviceUtils.getScreenWidth(context),
          padding: const EdgeInsets.all(XPSizes.md),
          decoration: BoxDecoration(
            color: showBackground
                ? dark
                    ? XPColors.dark
                    : XPColors.white
                : Colors.transparent,
            borderRadius: BorderRadius.circular(XPSizes.cardRadiusLg),
            border: showBorder ? Border.all(color: XPColors.grey) : null,
          ),
          child: Row(
            children: [
              Icon(icon, color: XPColors.darkerGrey),
              const SizedBox(width: XPSizes.spaceBtwItems),
              Text(text, style: Theme.of(context).textTheme.bodySmall)
            ],
          ),
        ),
      ),
    );
  }
}
