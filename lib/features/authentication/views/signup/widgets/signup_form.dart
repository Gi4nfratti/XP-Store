import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xp_store/features/authentication/controllers/signup/signup_controller.dart';
import 'package:xp_store/features/authentication/views/signup/widgets/terms_checkbox.dart';
import 'package:xp_store/utils/constants/sizes.dart';
import 'package:xp_store/utils/constants/text_strings.dart';
import 'package:xp_store/utils/validators/validation.dart';

class XPSignupForm extends StatelessWidget {
  const XPSignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    return Form(
        key: controller.signupFormKey,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: controller.firstName,
                    validator: (value) =>
                        XPValidator.validadeEmptyText('Primeiro Nome', value),
                    expands: false,
                    decoration: const InputDecoration(
                        labelText: XPTexts.firstName,
                        prefixIcon: Icon(Icons.person)),
                  ),
                ),
                const SizedBox(width: XPSizes.spaceBtwInputFields),
                Expanded(
                  child: TextFormField(
                    controller: controller.lastName,
                    validator: (value) =>
                        XPValidator.validadeEmptyText('Último Nome', value),
                    expands: false,
                    decoration: const InputDecoration(
                        labelText: XPTexts.lastName,
                        prefixIcon: Icon(Icons.person)),
                  ),
                ),
              ],
            ),
            const SizedBox(height: XPSizes.spaceBtwInputFields),
            TextFormField(
              controller: controller.username,
              validator: (value) =>
                  XPValidator.validadeEmptyText('Nome de Usuário', value),
              expands: false,
              decoration: const InputDecoration(
                  labelText: XPTexts.username, prefixIcon: Icon(Icons.edit)),
            ),
            const SizedBox(height: XPSizes.spaceBtwInputFields),
            TextFormField(
              controller: controller.email,
              validator: (value) => XPValidator.validateEmail(value),
              expands: false,
              decoration: const InputDecoration(
                  labelText: XPTexts.email,
                  prefixIcon: Icon(Icons.email_outlined)),
            ),
            const SizedBox(height: XPSizes.spaceBtwInputFields),
            TextFormField(
              controller: controller.phoneNumber,
              validator: (value) => XPValidator.validatePhoneNumber(value),
              expands: false,
              decoration: const InputDecoration(
                  labelText: XPTexts.phoneNo, prefixIcon: Icon(Icons.phone)),
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
            const SizedBox(height: XPSizes.spaceBtwSections),
            const XPTermsCheckbox(),
            const SizedBox(height: XPSizes.spaceBtwSections),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () => controller.signup(),
                  child: const Text(XPTexts.createAccount)),
            )
          ],
        ));
  }
}
