import 'package:flutter/material.dart';
import 'package:xp_store/common/widgets/shimmer/shimmer_effect.dart';
import 'package:xp_store/utils/constants/sizes.dart';

class XPBoxesShimmer extends StatelessWidget {
  const XPBoxesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            Expanded(child: XPShimmerEffect(width: 150, height: 110)),
            SizedBox(width: XPSizes.spaceBtwItems),
            Expanded(child: XPShimmerEffect(width: 150, height: 110)),
            SizedBox(width: XPSizes.spaceBtwItems),
            Expanded(child: XPShimmerEffect(width: 150, height: 110)),
          ],
        )
      ],
    );
  }
}
