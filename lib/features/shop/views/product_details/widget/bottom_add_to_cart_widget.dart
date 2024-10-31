import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:xp_store/common/widgets/icons/circular_icon.dart';
import 'package:xp_store/features/shop/controllers/product/cart_controller.dart';
import 'package:xp_store/features/shop/models/product_model.dart';
import 'package:xp_store/utils/constants/colors.dart';
import 'package:xp_store/utils/constants/sizes.dart';
import 'package:xp_store/utils/helpers/helper_functions.dart';

class XPBottomAddToCart extends StatelessWidget {
  const XPBottomAddToCart({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    controller.updateAlreadyAddedProductCount(product);
    final dark = XPHelperFunctions.isDarkMode(context);
    return Container(
        padding: const EdgeInsets.symmetric(
            horizontal: XPSizes.defaultSpace,
            vertical: XPSizes.defaultSpace / 2),
        decoration: BoxDecoration(
            color: dark ? XPColors.darkerGrey : XPColors.light,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(XPSizes.cardRadiusLg),
              topRight: Radius.circular(XPSizes.cardRadiusLg),
            )),
        child: Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  XPCircularIcon(
                    icon: Icons.horizontal_rule_rounded,
                    backgroundColor: XPColors.darkGrey,
                    width: 40,
                    height: 40,
                    color: XPColors.white,
                    onPressed: () => controller.productQuantityInCart.value < 1
                        ? null
                        : controller.productQuantityInCart.value -= 1,
                  ),
                  const SizedBox(width: XPSizes.spaceBtwItems),
                  Text(controller.productQuantityInCart.value.toString(),
                      style: Theme.of(context).textTheme.titleSmall),
                  const SizedBox(width: XPSizes.spaceBtwItems),
                  XPCircularIcon(
                    icon: Icons.add_outlined,
                    backgroundColor: XPColors.black,
                    width: 40,
                    height: 40,
                    color: XPColors.white,
                    onPressed: () =>
                        controller.productQuantityInCart.value += 1,
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: controller.productQuantityInCart.value < 1
                    ? null
                    : () => controller.addToCart(product),
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(XPSizes.md),
                    backgroundColor: XPColors.black,
                    side: const BorderSide(color: XPColors.black)),
                child: Text(
                  'Adicionar ao carrinho',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .apply(color: XPColors.white),
                ),
              )
            ],
          ),
        ));
  }
}
