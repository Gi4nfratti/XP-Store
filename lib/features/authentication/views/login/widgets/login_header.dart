import 'package:flutter/material.dart';
import 'package:xp_store/utils/constants/image_strings.dart';
import 'package:xp_store/utils/constants/sizes.dart';
import 'package:xp_store/utils/constants/text_strings.dart';
import 'package:xp_store/utils/helpers/helper_functions.dart';

class XPLoginHeader extends StatelessWidget {
  const XPLoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = XPHelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          height: 150,
          image:
              AssetImage(dark ? XPImages.darkAppLogo : XPImages.lightAppLogo),
        ),
        Text(
          XPTexts.loginTitle,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: XPSizes.sm),
        Text(
          XPTexts.loginSubTitle,
          style: Theme.of(context).textTheme.bodyMedium,
        )
      ],
    );
  }
}
