import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xp_store/common/styles/shadows.dart';
import 'package:xp_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:xp_store/common/widgets/icons/circular_icon.dart';
import 'package:xp_store/common/widgets/images/rounded_image.dart';
import 'package:xp_store/common/widgets/products/favourite_icon/favourite_icon.dart';
import 'package:xp_store/common/widgets/products/product_cards/add_to_cart_button.dart';
import 'package:xp_store/common/widgets/texts/brand_title_text_with_verified_icon.dart';
import 'package:xp_store/common/widgets/texts/product_price_text.dart';
import 'package:xp_store/common/widgets/texts/product_title_text.dart';
import 'package:xp_store/features/shop/controllers/product/product_controller.dart';
import 'package:xp_store/features/shop/models/product_model.dart';
import 'package:xp_store/features/shop/views/product_details/product_detail.dart';
import 'package:xp_store/utils/constants/colors.dart';
import 'package:xp_store/utils/constants/enums.dart';
import 'package:xp_store/utils/constants/image_strings.dart';
import 'package:xp_store/utils/constants/sizes.dart';
import 'package:xp_store/utils/helpers/helper_functions.dart';

class XPProductCardVertical extends StatelessWidget {
  const XPProductCardVertical({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage =
        controller.calculateSalePercentage(product.price, product.salePrice);
    final isDark = XPHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () => Get.to(() => ProductDetailScreen(product: product)),
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
            boxShadow: [XPShadowStyle.verticalProductShadow],
            borderRadius: BorderRadius.circular(XPSizes.productImageRadius),
            color: isDark ? XPColors.darkerGrey : XPColors.white),
        child: Column(
          children: [
            XPRoundedContainer(
              height: 150,
              padding: const EdgeInsets.all(XPSizes.sm),
              backgroundColor: isDark ? XPColors.dark : XPColors.light,
              child: Stack(
                children: [
                  Center(
                    child: XPRoundedImage(
                      imageUrl: product.thumbnail,
                      applyImageRadius: true,
                      isNetworkImage: true,
                    ),
                  ),
                  if (salePercentage != null)
                    Positioned(
                      top: 12,
                      child: XPRoundedContainer(
                        radius: XPSizes.sm,
                        backgroundColor: XPColors.secondary.withOpacity(0.8),
                        padding: const EdgeInsets.symmetric(
                            horizontal: XPSizes.sm, vertical: XPSizes.sm),
                        child: Text('$salePercentage%',
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .apply(color: XPColors.black)),
                      ),
                    ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: XPFavouriteIcon(productId: product.id),
                  )
                ],
              ),
            ),
            const SizedBox(height: XPSizes.spaceBtwItems / 2),
            Padding(
              padding: const EdgeInsets.only(left: XPSizes.sm),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    XPProductTitleText(
                      title: product.title,
                      smallSize: true,
                    ),
                    const SizedBox(height: XPSizes.spaceBtwItems / 2),
                    XPBrandTitleTextWithVerifiedIcon(
                        title: product.brand!.name),
                  ],
                ),
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Column(
                    children: [
                      if (product.productType ==
                              ProductType.single.toString() &&
                          product.salePrice > 0)
                        Padding(
                            padding: const EdgeInsets.only(left: XPSizes.sm),
                            child: Text(
                              product.price.toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium!
                                  .apply(
                                      decoration: TextDecoration.lineThrough),
                            )),
                    ],
                  ),
                ),
                ProductCardAddToCartButton(product: product),
              ],
            )
          ],
        ),
      ),
    );
  }
}
