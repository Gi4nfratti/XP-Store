import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xp_store/common/widgets/login_signup/form_divider.dart';
import 'package:xp_store/common/widgets/login_signup/social_buttons.dart';
import 'package:xp_store/features/authentication/views/signup/widgets/signup_form.dart';
import 'package:xp_store/utils/constants/sizes.dart';
import 'package:xp_store/utils/constants/text_strings.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(XPSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(XPTexts.signupTitle,
                  style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: XPSizes.spaceBtwSections),
              const XPSignupForm(),
              const SizedBox(height: XPSizes.spaceBtwSections),
              XPFormDivider(dividerText: XPTexts.orSignUpWith.capitalize!),
              const SizedBox(height: XPSizes.spaceBtwSections),
              const XPSocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
