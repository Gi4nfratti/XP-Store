import 'package:flutter/material.dart';
import 'package:xp_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:xp_store/common/widgets/images/circular_image.dart';
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

class XPProductMetaData extends StatelessWidget {
  const XPProductMetaData({super.key, required this.product});

  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage =
        controller.calculateSalePercentage(product.price, product.salePrice);
    final darkMode = XPHelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            XPRoundedContainer(
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
            const SizedBox(width: XPSizes.spaceBtwItems),
            if (product.productType == ProductType.single.toString() &&
                product.salePrice > 0)
              Text('R\$${product.price}',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .apply(decoration: TextDecoration.lineThrough)),
            if (product.productType == ProductType.single.toString() &&
                product.salePrice > 0)
              const SizedBox(width: XPSizes.spaceBtwItems),
            XPProductPriceText(
                price: controller.getProductPrice(product), isLarge: true),
          ],
        ),
        const SizedBox(height: XPSizes.spaceBtwItems / 1.5),
        XPProductTitleText(title: product.title),
        const SizedBox(height: XPSizes.spaceBtwItems / 1.5),
        Row(
          children: [
            const XPProductTitleText(title: 'Status'),
            const SizedBox(width: XPSizes.spaceBtwItems),
            Text(controller.getProductStockStatus(product.stock),
                style: Theme.of(context).textTheme.titleMedium)
          ],
        ),
        const SizedBox(height: XPSizes.spaceBtwItems / 1.5),
        Row(
          children: [
            XPCircularImage(
                image: product.brand != null ? product.brand!.image : '',
                width: 32,
                height: 32,
                overlayColor: darkMode ? XPColors.white : XPColors.black),
            XPBrandTitleTextWithVerifiedIcon(
                title: product.brand != null ? product.brand!.name : '',
                brandTextSizes: TextSizes.medium),
          ],
        ),
      ],
    );
  }
}
