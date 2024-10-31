import 'package:flutter/material.dart';
import 'package:xp_store/common/widgets/icons/circular_icon.dart';
import 'package:xp_store/utils/constants/colors.dart';
import 'package:xp_store/utils/constants/sizes.dart';
import 'package:xp_store/utils/helpers/helper_functions.dart';

class XPProductQtyWithAddRemove extends StatelessWidget {
  const XPProductQtyWithAddRemove({
    super.key,
    required this.quantity,
    required this.add,
    required this.remove,
  });

  final int quantity;
  final VoidCallback add, remove;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            XPCircularIcon(
              icon: Icons.horizontal_rule_rounded,
              width: 32,
              height: 32,
              size: XPSizes.md,
              color: XPHelperFunctions.isDarkMode(context)
                  ? XPColors.white
                  : XPColors.black,
              backgroundColor: XPHelperFunctions.isDarkMode(context)
                  ? XPColors.darkerGrey
                  : XPColors.light,
              onPressed: remove,
            ),
            const SizedBox(width: XPSizes.spaceBtwItems),
            Text(quantity.toString(),
                style: Theme.of(context).textTheme.titleSmall),
            const SizedBox(width: XPSizes.spaceBtwItems),
            XPCircularIcon(
              icon: Icons.add_outlined,
              width: 32,
              height: 32,
              size: XPSizes.md,
              color: XPColors.white,
              backgroundColor: XPColors.primary,
              onPressed: add,
            ),
          ],
        ),
      ],
    );
  }
}
