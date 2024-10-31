import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xp_store/common/widgets/appbar/appbar.dart';
import 'package:xp_store/features/authentication/views/profile/update_name_controller.dart';
import 'package:xp_store/utils/constants/sizes.dart';
import 'package:xp_store/utils/constants/text_strings.dart';
import 'package:xp_store/utils/validators/validation.dart';

class ChangeName extends StatelessWidget {
  const ChangeName({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateNameController());
    return Scaffold(
      appBar: XPAppBar(
        showBackArrow: true,
        title: Text('Alterar nome',
            style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: Padding(
        padding: const EdgeInsets.all(XPSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Use seu nome verdadeiro para uma verificação mais eficiente.',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(height: XPSizes.spaceBtwSections),
            Form(
                key: controller.updateUserNameFormKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: controller.firstName,
                      validator: (value) =>
                          XPValidator.validadeEmptyText('Primeiro Nome', value),
                      expands: false,
                      decoration: const InputDecoration(
                          labelText: XPTexts.firstName,
                          prefixIcon: Icon(Icons.person_outline)),
                    ),
                    const SizedBox(height: XPSizes.spaceBtwInputFields),
                    TextFormField(
                      controller: controller.lastName,
                      validator: (value) =>
                          XPValidator.validadeEmptyText('Último Nome', value),
                      expands: false,
                      decoration: const InputDecoration(
                          labelText: XPTexts.lastName,
                          prefixIcon: Icon(Icons.person_outline)),
                    ),
                  ],
                )),
            const SizedBox(height: XPSizes.spaceBtwSections),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () => controller.updateUserName(),
                  child: const Text('Salvar')),
            )
          ],
        ),
      ),
    );
  }
}
