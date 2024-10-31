import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xp_store/features/authentication/controllers/login/login_controller.dart';
import 'package:xp_store/features/authentication/views/password_configuration/forget_password.dart';
import 'package:xp_store/features/authentication/views/signup/signup.dart';
import 'package:xp_store/utils/constants/sizes.dart';
import 'package:xp_store/utils/constants/text_strings.dart';
import 'package:xp_store/utils/validators/validation.dart';

class XPLoginForm extends StatelessWidget {
  const XPLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
      key: controller.loginFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: XPSizes.spaceBtwSections),
        child: Column(
          children: [
            TextFormField(
              controller: controller.email,
              validator: (value) => XPValidator.validateEmail(value),
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.turn_right_outlined),
                  labelText: XPTexts.email),
            ),
            const SizedBox(height: XPSizes.spaceBtwInputFields),
            Obx(
              () => TextFormField(
                controller: controller.password,
                validator: (value) => XPValidator.validatePassword(value),
                obscureText: controller.hidePassword.value,
                decoration: InputDecoration(
                    labelText: XPTexts.password,
                    prefixIcon: const Icon(Icons.password_outlined),
                    suffixIcon: IconButton(
                      icon: Icon(controller.hidePassword.value
                          ? Icons.visibility_off_outlined
                          : Icons.visibility),
                      onPressed: () => controller.hidePassword.value =
                          !controller.hidePassword.value,
                    )),
              ),
            ),
            const SizedBox(height: XPSizes.spaceBtwInputFields / 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Obx(
                      () => Checkbox(
                          value: controller.rememberMe.value,
                          onChanged: (value) => controller.rememberMe.value =
                              !controller.rememberMe.value),
                    ),
                    const Text(XPTexts.rememberMe),
                  ],
                ),
                TextButton(
                  onPressed: () => (Get.to(() => const ForgetPasswordScreen())),
                  child: const Text(XPTexts.forgetPassword),
                ),
              ],
            ),
            const SizedBox(height: XPSizes.spaceBtwSections),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => controller.emailAndPasswordSignIn(),
                    child: const Text(XPTexts.signIn))),
            const SizedBox(height: XPSizes.spaceBtwItems),
            SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                    onPressed: () => Get.to(() => const SignupScreen()),
                    child: const Text(XPTexts.createAccount))),
          ],
        ),
      ),
    );
  }
}
