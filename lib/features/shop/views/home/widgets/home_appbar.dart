import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xp_store/common/widgets/appbar/appbar.dart';
import 'package:xp_store/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:xp_store/features/personalization/controllers/user_controller.dart';
import 'package:xp_store/utils/constants/colors.dart';
import 'package:xp_store/utils/constants/text_strings.dart';

class XPHomeAppBar extends StatelessWidget {
  const XPHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return XPAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(XPTexts.homeAppbarTitle,
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .apply(color: XPColors.grey)),
          Obx(
            () {
              return controller.profileLoading.value
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(color: XPColors.white))
                  : Text(controller.user.value.fullName,
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .apply(color: XPColors.white));
            },
          ),
        ],
      ),
      actions: [
        XPCartCounterIcon(
          iconColor: XPColors.white,
        )
      ],
    );
  }
}
