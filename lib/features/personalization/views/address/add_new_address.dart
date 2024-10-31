import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xp_store/common/widgets/appbar/appbar.dart';
import 'package:xp_store/features/personalization/controllers/address_controller.dart';
import 'package:xp_store/utils/constants/sizes.dart';
import 'package:xp_store/utils/validators/validation.dart';

class AddNewAddressView extends StatelessWidget {
  const AddNewAddressView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = AddressController.instance;
    return Scaffold(
      appBar: const XPAppBar(
          showBackArrow: true, title: Text('Adicionar Novo Endereço')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(XPSizes.defaultSpace),
          child: Form(
            key: controller.addressFormKey,
            child: Column(
              children: [
                TextFormField(
                    controller: controller.name,
                    validator: (value) =>
                        XPValidator.validadeEmptyText('Name', value),
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.person_2_rounded),
                        labelText: 'Nome')),
                const SizedBox(height: XPSizes.spaceBtwInputFields),
                TextFormField(
                    controller: controller.phoneNumber,
                    validator: XPValidator.validatePhoneNumber,
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.phone_android_outlined),
                        labelText: 'Telefone')),
                const SizedBox(height: XPSizes.spaceBtwInputFields),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                          controller: controller.street,
                          validator: (value) =>
                              XPValidator.validadeEmptyText('Street', value),
                          decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.house_outlined),
                              labelText: 'Endereço')),
                    ),
                    const SizedBox(width: XPSizes.spaceBtwInputFields),
                    Expanded(
                      child: TextFormField(
                          controller: controller.postalCode,
                          validator: (value) => XPValidator.validadeEmptyText(
                              'Postal Code', value),
                          decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.code), labelText: 'CEP')),
                    ),
                  ],
                ),
                const SizedBox(height: XPSizes.spaceBtwInputFields),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                          controller: controller.city,
                          validator: (value) =>
                              XPValidator.validadeEmptyText('City', value),
                          decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.location_city_rounded),
                              labelText: 'Cidade')),
                    ),
                    const SizedBox(width: XPSizes.spaceBtwInputFields),
                    Expanded(
                      child: TextFormField(
                          controller: controller.state,
                          validator: (value) =>
                              XPValidator.validadeEmptyText('State', value),
                          decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.local_post_office_rounded),
                              labelText: 'Estado')),
                    ),
                  ],
                ),
                const SizedBox(height: XPSizes.spaceBtwInputFields),
                TextFormField(
                    controller: controller.country,
                    validator: (value) =>
                        XPValidator.validadeEmptyText('Country', value),
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.where_to_vote_outlined),
                        labelText: 'País')),
                const SizedBox(height: XPSizes.defaultSpace),
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {
                          controller.addNewAddresses();
                        },
                        child: const Text('Salvar')))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
