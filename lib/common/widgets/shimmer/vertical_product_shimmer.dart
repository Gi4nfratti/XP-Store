import 'package:flutter/material.dart';
import 'package:xp_store/common/widgets/layouts/grid_layout.dart';
import 'package:xp_store/common/widgets/shimmer/shimmer_effect.dart';
import 'package:xp_store/utils/constants/sizes.dart';

class XPVerticalProductShimmer extends StatelessWidget {
  const XPVerticalProductShimmer({super.key, this.itemCount = 4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return XPGridLayout(
        itemCount: itemCount,
        itemBuilder: (_, __) => const SizedBox(
              width: 180,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  XPShimmerEffect(width: 180, height: 180),
                  SizedBox(height: XPSizes.spaceBtwItems),
                  XPShimmerEffect(width: 160, height: 15),
                  SizedBox(height: XPSizes.spaceBtwItems / 2),
                  XPShimmerEffect(width: 110, height: 15),
                ],
              ),
            ));
  }
}
