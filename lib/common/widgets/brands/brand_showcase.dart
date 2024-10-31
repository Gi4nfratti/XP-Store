import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xp_store/common/widgets/brands/brand_card.dart';
import 'package:xp_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:xp_store/common/widgets/shimmer/shimmer_effect.dart';
import 'package:xp_store/features/shop/models/brand_model.dart';
import 'package:xp_store/features/shop/views/brand/brand_products.dart';
import 'package:xp_store/utils/constants/colors.dart';
import 'package:xp_store/utils/constants/sizes.dart';
import 'package:xp_store/utils/helpers/helper_functions.dart';

class XPBrandShowcase extends StatelessWidget {
  const XPBrandShowcase({
    super.key,
    required this.images,
    required this.brand,
  });

  final BrandModel brand;
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(() => BrandProducts(brand: brand)),
      child: XPRoundedContainer(
        showBorder: true,
        borderColor: XPColors.darkGrey,
        backgroundColor: Colors.transparent,
        padding: const EdgeInsets.all(XPSizes.md),
        margin: const EdgeInsets.only(bottom: XPSizes.spaceBtwItems),
        child: Column(
          children: [
            XPBrandCard(
              showBorder: false,
              brand: brand,
            ),
            const SizedBox(height: XPSizes.spaceBtwItems),
            Row(
              children: images
                  .map((img) => brandTopProductImageWidget(img, context))
                  .toList(),
            )
          ],
        ),
      ),
    );
  }
}

Widget brandTopProductImageWidget(String image, context) {
  return Expanded(
      child: XPRoundedContainer(
          height: 100,
          backgroundColor: XPHelperFunctions.isDarkMode(context)
              ? XPColors.darkerGrey
              : XPColors.light,
          margin: const EdgeInsets.only(right: XPSizes.sm),
          padding: const EdgeInsets.all(XPSizes.md),
          child: CachedNetworkImage(
            imageUrl: image,
            fit: BoxFit.contain,
            progressIndicatorBuilder: (context, url, progress) =>
                const XPShimmerEffect(width: 100, height: 100),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          )));
}
