import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xp_store/features/authentication/controllers/signup/signup_controller.dart';
import 'package:xp_store/utils/constants/colors.dart';
import 'package:xp_store/utils/constants/sizes.dart';
import 'package:xp_store/utils/constants/text_strings.dart';
import 'package:xp_store/utils/helpers/helper_functions.dart';

class XPTermsCheckbox extends StatelessWidget {
  const XPTermsCheckbox({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = SignupController.instance;
    final dark = XPHelperFunctions.isDarkMode(context);
    return Row(
      children: [
        SizedBox(
            width: 24,
            height: 24,
            child: Obx(() => Checkbox(
                value: controller.privacyPolicy.value,
                onChanged: (value) => controller.privacyPolicy.value =
                    !controller.privacyPolicy.value))),
        const SizedBox(width: XPSizes.spaceBtwItems),
        Text.rich(TextSpan(children: [
          TextSpan(
              text: '${XPTexts.iAgreeTo} ',
              style: Theme.of(context).textTheme.bodySmall),
          TextSpan(
              text: '${XPTexts.privacyPolicy}\n',
              style: Theme.of(context).textTheme.bodyMedium!.apply(
                    color: dark ? XPColors.white : XPColors.primary,
                    decoration: TextDecoration.underline,
                    decorationColor: dark ? XPColors.white : XPColors.primary,
                  )),
          TextSpan(
              text: '${XPTexts.and} ',
              style: Theme.of(context).textTheme.bodySmall),
          TextSpan(
              text: XPTexts.termsOfUse,
              style: Theme.of(context).textTheme.bodyMedium!.apply(
                    color: dark ? XPColors.white : XPColors.primary,
                    decoration: TextDecoration.underline,
                    decorationColor: dark ? XPColors.white : XPColors.primary,
                  )),
        ]))
      ],
    );
  }
}
