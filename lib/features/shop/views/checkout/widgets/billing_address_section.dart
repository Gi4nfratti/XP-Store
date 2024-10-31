import 'package:flutter/material.dart';
import 'package:xp_store/common/widgets/texts/section_heading.dart';
import 'package:xp_store/features/personalization/controllers/address_controller.dart';
import 'package:xp_store/utils/constants/sizes.dart';

class XPBillingAddressSection extends StatelessWidget {
  const XPBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    final addressController = AddressController.instance;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        XPSectionHeading(
            title: 'Endereço de Envio',
            buttonTitle: 'Alterar',
            onPressed: () => addressController.selectNewAddressPopup(context)),
        addressController.selectedAddress.value.id.isNotEmpty
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('João de Souza',
                      style: Theme.of(context).textTheme.bodyLarge),
                  Row(
                    children: [
                      const Icon(Icons.phone, color: Colors.grey, size: 16),
                      const SizedBox(width: XPSizes.spaceBtwItems),
                      Text('11 91234-5678',
                          style: Theme.of(context).textTheme.bodyMedium),
                    ],
                  ),
                  const SizedBox(height: XPSizes.spaceBtwItems / 2),
                  Row(
                    children: [
                      const Icon(Icons.location_city_rounded,
                          color: Colors.grey, size: 16),
                      const SizedBox(width: XPSizes.spaceBtwItems),
                      Expanded(
                          child: Text('Av Paulista 123, 035000-100, São Paulo',
                              style: Theme.of(context).textTheme.bodyMedium,
                              softWrap: true)),
                    ],
                  ),
                ],
              )
            : Text('Selecione o Endereço',
                style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}
