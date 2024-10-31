import 'package:flutter/material.dart';
import 'package:xp_store/common/widgets/shimmer/shimmer_effect.dart';
import 'package:xp_store/utils/constants/sizes.dart';

class XPHorizontalProductShimmer extends StatelessWidget {
  const XPHorizontalProductShimmer({super.key, this.itemCount = 4});
  final int itemCount;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: XPSizes.spaceBtwSections),
      height: 120,
      child: ListView.separated(
          separatorBuilder: (context, index) => SizedBox(
                width: XPSizes.spaceBtwItems,
              ),
          itemCount: itemCount,
          itemBuilder: (_, __) => const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  XPShimmerEffect(width: 120, height: 120),
                  SizedBox(width: XPSizes.spaceBtwItems),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: XPSizes.spaceBtwItems / 2),
                      XPShimmerEffect(width: 160, height: 15),
                      SizedBox(height: XPSizes.spaceBtwItems / 2),
                      XPShimmerEffect(width: 110, height: 15),
                      SizedBox(height: XPSizes.spaceBtwItems / 2),
                      XPShimmerEffect(width: 80, height: 15),
                      Spacer()
                    ],
                  )
                ],
              )),
    );
  }
}
