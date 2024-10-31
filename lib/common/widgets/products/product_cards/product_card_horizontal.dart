import 'package:flutter/material.dart';
import 'package:xp_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:xp_store/common/widgets/icons/circular_icon.dart';
import 'package:xp_store/common/widgets/images/rounded_image.dart';
import 'package:xp_store/common/widgets/products/favourite_icon/favourite_icon.dart';
import 'package:xp_store/common/widgets/texts/brand_title_text_with_verified_icon.dart';
import 'package:xp_store/common/widgets/texts/product_price_text.dart';
import 'package:xp_store/common/widgets/texts/product_title_text.dart';
import 'package:xp_store/features/shop/controllers/product/product_controller.dart';
import 'package:xp_store/features/shop/models/product_model.dart';
import 'package:xp_store/utils/constants/colors.dart';
import 'package:xp_store/utils/constants/enums.dart';
import 'package:xp_store/utils/constants/image_strings.dart';
import 'package:xp_store/utils/constants/sizes.dart';
import 'package:xp_store/utils/helpers/helper_functions.dart';

class XPProductCardHorizontal extends StatelessWidget {
  const XPProductCardHorizontal({super.key, required this.product});

  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final dark = XPHelperFunctions.isDarkMode(context);
    final controller = ProductController.instance;
    final salePercentage =
        controller.calculateSalePercentage(product.price, product.salePrice);
    return Container(
      width: 310,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(XPSizes.productImageRadius),
          color: dark ? XPColors.darkerGrey : XPColors.softGrey),
      child: Row(
        children: [
          XPRoundedContainer(
            height: 120,
            padding: const EdgeInsets.all(XPSizes.sm),
            backgroundColor: dark ? XPColors.dark : XPColors.light,
            child: Stack(
              children: [
                SizedBox(
                  height: 120,
                  width: 120,
                  child: XPRoundedImage(
                      imageUrl: product.thumbnail,
                      applyImageRadius: true,
                      isNetworkImage: true),
                ),
                if (salePercentage != null)
                  Positioned(
                    top: 12,
                    child: XPRoundedContainer(
                      radius: XPSizes.sm,
                      backgroundColor: XPColors.secondary.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(
                          horizontal: XPSizes.sm, vertical: XPSizes.xs),
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
                    child: XPFavouriteIcon(productId: product.id))
              ],
            ),
          ),
          SizedBox(
            width: 172,
            child: Padding(
              padding: const EdgeInsets.only(top: XPSizes.sm, left: XPSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      XPProductTitleText(title: product.title, smallSize: true),
                      SizedBox(height: XPSizes.spaceBtwItems / 2),
                      XPBrandTitleTextWithVerifiedIcon(
                          title: product.brand!.name)
                    ],
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
                                  padding:
                                      const EdgeInsets.only(left: XPSizes.sm),
                                  child: Text(
                                    product.price.toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelMedium!
                                        .apply(
                                            decoration:
                                                TextDecoration.lineThrough),
                                  )),
                          ],
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                            color: XPColors.dark,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(XPSizes.cardRadiusMd),
                                bottomRight: Radius.circular(
                                    XPSizes.productImageRadius))),
                        child: const SizedBox(
                            width: XPSizes.iconLg * 1.2,
                            height: XPSizes.iconLg * 1.2,
                            child: Center(
                                child: Icon(Icons.add_outlined,
                                    color: XPColors.white))),
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
