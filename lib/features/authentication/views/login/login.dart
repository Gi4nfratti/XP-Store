import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xp_store/common/styles/spacing_styles.dart';
import 'package:xp_store/common/widgets/login_signup/form_divider.dart';
import 'package:xp_store/common/widgets/login_signup/social_buttons.dart';
import 'package:xp_store/features/authentication/views/login/widgets/login_form.dart';
import 'package:xp_store/features/authentication/views/login/widgets/login_header.dart';
import 'package:xp_store/utils/constants/sizes.dart';
import 'package:xp_store/utils/constants/text_strings.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: XPSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              const XPLoginHeader(),
              const XPLoginForm(),
              XPFormDivider(dividerText: XPTexts.orSignInWith.capitalize!),
              const SizedBox(height: XPSizes.spaceBtwSections),
              const XPSocialButtons()
            ],
          ),
        ),
      ),
    );
  }
}
