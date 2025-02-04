import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xp_store/features/authentication/controllers/forget_password/forget_password_controller.dart';
import 'package:xp_store/features/authentication/views/login/login.dart';
import 'package:xp_store/utils/constants/image_strings.dart';
import 'package:xp_store/utils/constants/sizes.dart';
import 'package:xp_store/utils/constants/text_strings.dart';
import 'package:xp_store/utils/helpers/helper_functions.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(XPSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image(
                image: const AssetImage(XPImages.deliveredEmailAnimation),
                width: XPHelperFunctions.screenWidth() * 0.6,
              ),
              const SizedBox(height: XPSizes.spaceBtwSections),
              Text(
                email,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: XPSizes.spaceBtwItems),
              Text(
                XPTexts.changeYourPasswordTitle,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: XPSizes.spaceBtwItems),
              Text(
                XPTexts.changeYourPasswordSubTitle,
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: XPSizes.spaceBtwSections),
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () => Get.offAll(() => const LoginScreen()),
                      child: const Text(XPTexts.ok))),
              const SizedBox(height: XPSizes.spaceBtwItems),
              SizedBox(
                  width: double.infinity,
                  child: TextButton(
                      onPressed: () => ForgetPasswordController.instance
                          .resendPasswordResetEmail(email),
                      child: const Text(XPTexts.resendEmail)))
            ],
          ),
        ),
      ),
    );
  }
}
