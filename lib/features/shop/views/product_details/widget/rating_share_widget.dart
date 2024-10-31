import 'package:flutter/material.dart';
import 'package:xp_store/utils/constants/sizes.dart';
class XPRatingAndShare extends StatelessWidget {
  const XPRatingAndShare({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Icon(Icons.star_rounded,
                color: Colors.amber, size: 24),
            const SizedBox(width: XPSizes.spaceBtwItems / 2),
            Text.rich(TextSpan(children: [
              TextSpan(
                  text: '5.0',
                  style: Theme.of(context).textTheme.bodyLarge),
              const TextSpan(text: '(199)'),
            ]))
          ],
        ),
        IconButton(
            onPressed: () {},
            icon: const Icon(Icons.share_outlined,
                size: XPSizes.iconMd)),
      ],
    );
  }
}
