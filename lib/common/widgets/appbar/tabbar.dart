import 'package:flutter/material.dart';
import 'package:xp_store/utils/constants/colors.dart';
import 'package:xp_store/utils/device/device_utility.dart';
import 'package:xp_store/utils/helpers/helper_functions.dart';

class XPTabbar extends StatelessWidget implements PreferredSizeWidget {
  const XPTabbar({super.key, required this.tabs});

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    final dark = XPHelperFunctions.isDarkMode(context);
    return Material(
      color: dark ? XPColors.black : XPColors.white,
      child: TabBar(
        tabs: tabs,
        isScrollable: true,
        indicatorColor: XPColors.primary,
        labelColor: dark ? XPColors.white : XPColors.primary,
        unselectedLabelColor: XPColors.darkGrey,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(XPDeviceUtils.getAppBarHeight());
}
