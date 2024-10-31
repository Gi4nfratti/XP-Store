import 'package:flutter/material.dart';
import 'package:xp_store/common/widgets/shimmer/shimmer_effect.dart';
import 'package:xp_store/utils/constants/sizes.dart';

class XPListTileShimmer extends StatelessWidget {
  const XPListTileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            XPShimmerEffect(width: 50, height: 50, radius: 50),
            SizedBox(width: XPSizes.spaceBtwItems),
            Column(
              children: [
                XPShimmerEffect(width: 100, height: 15),
                SizedBox(width: XPSizes.spaceBtwItems / 2),
                XPShimmerEffect(width: 80, height: 12),
              ],
            )
          ],
        )
      ],
    );
  }
}
