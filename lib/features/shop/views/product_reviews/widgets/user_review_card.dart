import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:xp_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:xp_store/common/widgets/products/ratings/rating_indicator.dart';
import 'package:xp_store/utils/constants/colors.dart';
import 'package:xp_store/utils/constants/image_strings.dart';
import 'package:xp_store/utils/constants/sizes.dart';
import 'package:xp_store/utils/helpers/helper_functions.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = XPHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(backgroundImage: AssetImage(XPImages.user)),
                const SizedBox(width: XPSizes.spaceBtwItems),
                Text('João de Souza',
                    style: Theme.of(context).textTheme.titleLarge),
              ],
            ),
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.more_vert_rounded))
          ],
        ),
        const SizedBox(width: XPSizes.spaceBtwItems),
        Row(
          children: [
            const XPRatingBarIndicator(rating: 4),
            const SizedBox(width: XPSizes.spaceBtwItems),
            Text('28 Aug, 2024', style: Theme.of(context).textTheme.bodyMedium)
          ],
        ),
        const SizedBox(width: XPSizes.spaceBtwItems),
        const ReadMoreText(
            "Gostei muito do aplicativo. Consegui navegar por todo ele e fiz as compras. Bom trabalho!",
            trimLines: 1,
            trimExpandedText: ' Ver menos',
            trimCollapsedText: ' Ver mais',
            moreStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: XPColors.primary),
            lessStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: XPColors.primary),
            trimMode: TrimMode.Line),
        const SizedBox(height: XPSizes.spaceBtwItems),
        XPRoundedContainer(
          backgroundColor: dark ? XPColors.darkerGrey : XPColors.grey,
          child: Padding(
              padding: const EdgeInsets.all(XPSizes.md),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Loja XP',
                          style: Theme.of(context).textTheme.titleMedium),
                      Text('28 Aug, 2024',
                          style: Theme.of(context).textTheme.bodyMedium),
                    ],
                  ),
                  const SizedBox(width: XPSizes.spaceBtwItems),
                  const ReadMoreText(
                      "Gostei muito do aplicativo. Consegui navegar por todo ele e fiz as compras. Bom trabalho!",
                      trimLines: 1,
                      trimExpandedText: ' Ver menos',
                      trimCollapsedText: ' Ver mais',
                      moreStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: XPColors.primary),
                      lessStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: XPColors.primary),
                      trimMode: TrimMode.Line),
                ],
              )),
        ),
        const SizedBox(height: XPSizes.spaceBtwSections)
      ],
    );
  }
}
