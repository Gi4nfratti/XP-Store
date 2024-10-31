import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xp_store/features/shop/controllers/product/cart_controller.dart';
import 'package:xp_store/features/shop/models/product_model.dart';
import 'package:xp_store/features/shop/views/product_details/product_detail.dart';
import 'package:xp_store/utils/constants/colors.dart';
import 'package:xp_store/utils/constants/enums.dart';
import 'package:xp_store/utils/constants/sizes.dart';

class ProductCardAddToCartButton extends StatelessWidget {
  const ProductCardAddToCartButton({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    return InkWell(onTap: () {
      if (product.productType == ProductType.single.toString()) {
        final cartItem = cartController.convertToCartItem(product, 1);
        cartController.addOneToCart(cartItem);
      } else {
        Get.to(() => ProductDetailScreen(product: product));
      }
    }, child: Obx(() {
      final productQuantityInCart =
          cartController.getProductQuantityInCart(product.id);
      return Container(
        decoration: BoxDecoration(
            color: productQuantityInCart > 0 ? XPColors.primary : XPColors.dark,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(XPSizes.cardRadiusMd),
                bottomRight: Radius.circular(XPSizes.productImageRadius))),
        child: SizedBox(
            width: XPSizes.iconLg * 1.2,
            height: XPSizes.iconLg * 1.2,
            child: Center(
                child: productQuantityInCart > 0
                    ? Text(productQuantityInCart.toString(),
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .apply(color: XPColors.white))
                    : Icon(Icons.add_outlined, color: XPColors.white))),
      );
    }));
  }
}
