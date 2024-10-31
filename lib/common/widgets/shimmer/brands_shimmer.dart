import 'package:flutter/material.dart';
import 'package:xp_store/common/widgets/layouts/grid_layout.dart';
import 'package:xp_store/common/widgets/shimmer/shimmer_effect.dart';

class XPBrandsShimmer extends StatelessWidget {
  const XPBrandsShimmer({super.key, this.itemCount = 4});

  final int itemCount;
  @override
  Widget build(BuildContext context) {
    return XPGridLayout(
      mainAxisExtent: 80,
      itemCount: itemCount,
      itemBuilder: (_, __) => const XPShimmerEffect(width: 300, height: 80),
    );
  }
}
