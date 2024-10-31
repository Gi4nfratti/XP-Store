import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xp_store/features/shop/controllers/product/cart_controller.dart';
import 'package:xp_store/features/shop/views/cart/cart.dart';
import 'package:xp_store/utils/constants/colors.dart';
import 'package:xp_store/utils/helpers/helper_functions.dart';

class XPCartCounterIcon extends StatelessWidget {
  const XPCartCounterIcon({
    super.key,
    this.iconColor,
    this.counterBgColor,
    this.counterTextColor,
  });

  final Color? iconColor, counterBgColor, counterTextColor;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CartController());
    final dark = XPHelperFunctions.isDarkMode(context);
    return Stack(
      children: [
        IconButton(
            onPressed: () => Get.to(() => const CartView()),
            icon: Icon(Icons.shopping_bag_outlined, color: iconColor)),
        Positioned(
          right: 0,
          child: Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
                color:
                    counterBgColor ?? (dark ? XPColors.white : XPColors.black),
                borderRadius: BorderRadius.circular(100)),
            child: Center(
              child: Obx(() => Text(
                    controller.noOfCartItems.value.toString(),
                    style: Theme.of(context).textTheme.labelLarge!.apply(
                        color: counterTextColor ??
                            (dark ? XPColors.black : XPColors.white),
                        fontSizeFactor: 0.8),
                  )),
            ),
          ),
        )
      ],
    );
  }
}
