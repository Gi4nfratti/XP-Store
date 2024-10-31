import 'package:flutter/material.dart';
import 'package:xp_store/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:xp_store/utils/constants/colors.dart';
import 'package:xp_store/utils/constants/sizes.dart';
import 'package:xp_store/utils/device/device_utility.dart';
import 'package:xp_store/utils/helpers/helper_functions.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = XPHelperFunctions.isDarkMode(context);
    return Positioned(
      right: XPSizes.defaultSpace,
      bottom: XPDeviceUtils.getBottomNavigationBarHeight(),
      child: ElevatedButton(
        onPressed: () => OnBoardingController.instance.nextPage(),
        style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            backgroundColor: dark ? XPColors.primary : Colors.black),
        child: const Icon(Icons.keyboard_arrow_right_outlined),
      ),
    );
  }
}
