import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xp_store/features/authentication/controllers/forget_password/forget_password_controller.dart';
import 'package:xp_store/utils/constants/sizes.dart';
import 'package:xp_store/utils/constants/text_strings.dart';
import 'package:xp_store/utils/validators/validation.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(XPSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                XPTexts.forgetPasswordTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: XPSizes.spaceBtwItems),
              Text(
                XPTexts.forgetPasswordSubTitle,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const SizedBox(height: XPSizes.spaceBtwSections * 2),
              Form(
                key: controller.forgetPasswordFormKey,
                child: TextFormField(
                  controller: controller.email,
                  validator: XPValidator.validateEmail,
                  decoration: const InputDecoration(
                      labelText: XPTexts.email,
                      prefixIcon: Icon(Icons.arrow_right_outlined)),
                ),
              ),
              const SizedBox(height: XPSizes.spaceBtwSections),
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () => controller.sendPasswordResetEmail(),
                      child: const Text(XPTexts.submit)))
            ],
          ),
        ),
      ),
    );
  }
}
