import 'package:flutter/material.dart';
import 'package:xp_store/common/widgets/images/circular_image.dart';
import 'package:xp_store/utils/constants/colors.dart';
import 'package:xp_store/utils/constants/sizes.dart';
import 'package:xp_store/utils/helpers/helper_functions.dart';

class XPVerticalImageText extends StatelessWidget {
  const XPVerticalImageText({
    super.key,
    required this.image,
    required this.title,
    this.textColor = XPColors.white,
    this.backgroundColor,
    this.isNetworkImage = true,
    this.onTap,
  });

  final String image, title;
  final Color textColor;
  final Color? backgroundColor;
  final void Function()? onTap;
  final bool isNetworkImage;

  @override
  Widget build(BuildContext context) {
    final isDark = XPHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: XPSizes.spaceBtwItems),
        child: Column(
          children: [
            XPCircularImage(
                image: image,
                fit: BoxFit.fitWidth,
                padding: XPSizes.sm * 1.4,
                isNetworkImage: isNetworkImage,
                backgroundColor: backgroundColor,
                overlayColor: isDark ? XPColors.light : XPColors.dark),
            /*
            Container(
              width: 56,
              height: 56,
              padding: const EdgeInsets.all(XPSizes.sm),
              decoration: BoxDecoration(
                  color: backgroundColor ??
                      (isDark ? XPColors.black : XPColors.white),
                  borderRadius: BorderRadius.circular(100)),
              child: Center(
                child: Image(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                  color: isDark ? XPColors.light : XPColors.dark,
                ),
              ),
            ),
            */
            const SizedBox(height: XPSizes.spaceBtwItems / 2),
            SizedBox(
              width: 55,
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .apply(color: textColor),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ),
    );
  }
}
