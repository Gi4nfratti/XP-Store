import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xp_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:xp_store/common/widgets/images/circular_image.dart';
import 'package:xp_store/common/widgets/texts/brand_title_text_with_verified_icon.dart';
import 'package:xp_store/features/shop/models/brand_model.dart';
import 'package:xp_store/utils/constants/colors.dart';
import 'package:xp_store/utils/constants/enums.dart';
import 'package:xp_store/utils/constants/image_strings.dart';
import 'package:xp_store/utils/constants/sizes.dart';
import 'package:xp_store/utils/helpers/helper_functions.dart';

class XPBrandCard extends StatelessWidget {
  const XPBrandCard({
    super.key,
    required this.showBorder,
    this.onTap,
    required this.brand,
  });

  final BrandModel brand;
  final bool showBorder;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: XPRoundedContainer(
        padding: const EdgeInsets.all(XPSizes.sm),
        showBorder: showBorder,
        backgroundColor: Colors.transparent,
        child: Row(
          children: [
            Flexible(
              child: XPCircularImage(
                isNetworkImage: true,
                image: brand.image,
                backgroundColor: Colors.transparent,
                overlayColor: XPHelperFunctions.isDarkMode(context)
                    ? XPColors.white
                    : XPColors.black,
              ),
            ),
            const SizedBox(width: XPSizes.spaceBtwItems / 2),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  XPBrandTitleTextWithVerifiedIcon(
                    title: brand.name,
                    brandTextSizes: TextSizes.large,
                  ),
                  Text(
                    '${brand.productsCount ?? 0} produtos',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .apply(color: XPColors.darkGrey),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
