import 'package:flutter/material.dart';
import 'package:xp_store/common/widgets/images/rounded_image.dart';
import 'package:xp_store/common/widgets/texts/brand_title_text_with_verified_icon.dart';
import 'package:xp_store/common/widgets/texts/product_title_text.dart';
import 'package:xp_store/features/shop/models/cart_item_model.dart';
import 'package:xp_store/utils/constants/colors.dart';
import 'package:xp_store/utils/constants/image_strings.dart';
import 'package:xp_store/utils/constants/sizes.dart';
import 'package:xp_store/utils/helpers/helper_functions.dart';

class XPCartItem extends StatelessWidget {
  const XPCartItem({
    super.key,
    required this.cartItem,
  });
  final CartItemModel cartItem;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        XPRoundedImage(
          imageUrl: cartItem.image ?? '',
          width: 60,
          height: 60,
          isNetworkImage: true,
          padding: const EdgeInsets.all(XPSizes.sm),
          backgroundColor: XPHelperFunctions.isDarkMode(context)
              ? XPColors.darkerGrey
              : XPColors.light,
        ),
        const SizedBox(width: XPSizes.spaceBtwItems),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              XPBrandTitleTextWithVerifiedIcon(title: cartItem.brandName ?? ''),
              Flexible(
                  child:
                      XPProductTitleText(title: cartItem.title, maxLines: 1)),
              Text.rich(TextSpan(
                  children: (cartItem.selectedVariation ?? {})
                      .entries
                      .map((e) => TextSpan(children: [
                            TextSpan(
                                text: '${e.key}: ',
                                style: Theme.of(context).textTheme.bodySmall),
                            TextSpan(
                                text: e.value,
                                style: Theme.of(context).textTheme.bodyMedium),
                          ]))
                      .toList()))
            ],
          ),
        )
      ],
    );
  }
}
