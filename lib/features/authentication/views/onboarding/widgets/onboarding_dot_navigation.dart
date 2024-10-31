import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:xp_store/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:xp_store/utils/constants/colors.dart';
import 'package:xp_store/utils/constants/sizes.dart';
import 'package:xp_store/utils/device/device_utility.dart';
import 'package:xp_store/utils/helpers/helper_functions.dart';

class OnBoardingDotNavigation extends StatelessWidget {
  const OnBoardingDotNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;
    final bool dark = XPHelperFunctions.isDarkMode(context);
    return Positioned(
      bottom: XPDeviceUtils.getBottomNavigationBarHeight() + 25,
      left: XPSizes.defaultSpace,
      child: SmoothPageIndicator(
        controller: controller.pageController,
        onDotClicked: controller.dotNavigationClick,
        count: 3,
        effect: ExpandingDotsEffect(
            activeDotColor: dark ? XPColors.light : XPColors.dark,
            dotHeight: 6),
      ),
    );
  }
}
