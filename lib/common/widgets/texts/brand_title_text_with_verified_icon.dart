import 'package:flutter/material.dart';
import 'package:xp_store/common/widgets/texts/brand_title_text.dart';
import 'package:xp_store/utils/constants/colors.dart';
import 'package:xp_store/utils/constants/enums.dart';
import 'package:xp_store/utils/constants/sizes.dart';

class XPBrandTitleTextWithVerifiedIcon extends StatelessWidget {
  const XPBrandTitleTextWithVerifiedIcon({
    super.key,
    required this.title,
    this.maxLines = 1,
    this.textColor,
    this.iconColor = XPColors.primary,
    this.textAlign = TextAlign.center,
    this.brandTextSizes = TextSizes.small,
  });

  final String title;
  final int maxLines;
  final Color? textColor, iconColor;
  final TextAlign? textAlign;
  final TextSizes brandTextSizes;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
            child: XPBrandTitleText(
          title: title,
          color: textColor,
          maxLines: maxLines,
          textAlign: textAlign,
          brandTextSize: brandTextSizes,
        )),
        const SizedBox(width: XPSizes.xs),
        const Icon(Icons.verified_rounded,
            color: XPColors.primary, size: XPSizes.iconXs)
      ],
    );
  }
}
