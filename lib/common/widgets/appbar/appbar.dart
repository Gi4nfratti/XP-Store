import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xp_store/utils/constants/sizes.dart';
import 'package:xp_store/utils/device/device_utility.dart';

class XPAppBar extends StatelessWidget implements PreferredSizeWidget {
  const XPAppBar(
      {super.key,
      this.title,
      this.showBackArrow = false,
      this.leadingIcon,
      this.actions,
      this.leadingOnPressed});

  final Widget? title;
  final bool showBackArrow;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: XPSizes.md),
      child: AppBar(
        automaticallyImplyLeading: false,
        leading: showBackArrow
            ? IconButton(
                onPressed: () => Get.back(),
                icon: const Icon(Icons.arrow_back_outlined))
            : leadingIcon != null
                ? IconButton(
                    onPressed: () => leadingOnPressed, icon: Icon(leadingIcon))
                : null,
        title: title,
        actions: actions,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(XPDeviceUtils.getAppBarHeight());
}
