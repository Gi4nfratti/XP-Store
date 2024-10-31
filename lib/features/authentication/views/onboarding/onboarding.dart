import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xp_store/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:xp_store/features/authentication/views/onboarding/widgets/onboarding_dot_navigation.dart';
import 'package:xp_store/features/authentication/views/onboarding/widgets/onboarding_next_button.dart';
import 'package:xp_store/features/authentication/views/onboarding/widgets/onboarding_page.dart';
import 'package:xp_store/features/authentication/views/onboarding/widgets/onboarding_skip.dart';
import 'package:xp_store/utils/constants/image_strings.dart';
import 'package:xp_store/utils/constants/text_strings.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());

    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardingPage(
                image: XPImages.onBoardingImage1,
                title: XPTexts.onBoardingTitle1,
                subTitle: XPTexts.onBoardingSubTitle1,
              ),
              OnBoardingPage(
                image: XPImages.onBoardingImage2,
                title: XPTexts.onBoardingTitle2,
                subTitle: XPTexts.onBoardingSubTitle2,
              ),
              OnBoardingPage(
                image: XPImages.onBoardingImage3,
                title: XPTexts.onBoardingTitle3,
                subTitle: XPTexts.onBoardingSubTitle3,
              ),
            ],
          ),
          const OnBoardingSkip(),
          const OnBoardingDotNavigation(),
          const OnBoardingNextButton()
        ],
      ),
    );
  }
}
