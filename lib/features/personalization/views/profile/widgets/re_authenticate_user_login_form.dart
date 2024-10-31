import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xp_store/features/personalization/controllers/user_controller.dart';
import 'package:xp_store/utils/constants/sizes.dart';
import 'package:xp_store/utils/constants/text_strings.dart';
import 'package:xp_store/utils/validators/validation.dart';

class ReAuthLoginForm extends StatelessWidget {
  const ReAuthLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: AppBar(title: const Text('Reautenticar Usuário')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(XPSizes.defaultSpace),
          child: Form(
            key: controller.reAuthFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: controller.verifyEmail,
                  validator: XPValidator.validateEmail,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.arrow_right_alt_outlined),
                      labelText: XPTexts.email),
                ),
                const SizedBox(height: XPSizes.spaceBtwInputFields),
                Obx(() => TextFormField(
                      obscureText: controller.hidePassword.value,
                      controller: controller.verifyPassword,
                      validator: (value) =>
                          XPValidator.validadeEmptyText('Password', value),
                      decoration: InputDecoration(
                          labelText: XPTexts.password,
                          prefixIcon: const Icon(Icons.password_outlined),
                          suffixIcon: IconButton(
                              onPressed: () => controller.hidePassword.value =
                                  !controller.hidePassword.value,
                              icon: const Icon(Icons.remove_red_eye_outlined))),
                    )),
                const SizedBox(height: XPSizes.spaceBtwSections),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () =>
                          controller.reAuthenticateEmailAndPasswordUser(),
                      child: const Text('Verificar')),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
