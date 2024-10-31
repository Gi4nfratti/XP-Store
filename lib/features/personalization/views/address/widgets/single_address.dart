import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:xp_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:xp_store/features/personalization/controllers/address_controller.dart';
import 'package:xp_store/features/personalization/models/address_model.dart';
import 'package:xp_store/utils/constants/colors.dart';
import 'package:xp_store/utils/constants/sizes.dart';
import 'package:xp_store/utils/helpers/helper_functions.dart';

class XPSingleAddress extends StatelessWidget {
  const XPSingleAddress({
    super.key,
    required this.address,
    required this.onTap,
  });

  final AddressModel address;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final controller = AddressController.instance;
    final dark = XPHelperFunctions.isDarkMode(context);
    return Obx(() {
      final selectedAddressId = controller.selectedAddress.value.id;
      final selectedAddress = selectedAddressId == address.id;
      return InkWell(
        onTap: onTap,
        child: XPRoundedContainer(
          width: double.infinity,
          padding: const EdgeInsets.all(XPSizes.md),
          showBorder: true,
          backgroundColor: selectedAddress
              ? XPColors.primary.withOpacity(0.5)
              : Colors.transparent,
          borderColor: selectedAddress
              ? Colors.transparent
              : dark
                  ? XPColors.darkerGrey
                  : XPColors.grey,
          margin: const EdgeInsets.only(bottom: XPSizes.spaceBtwItems),
          child: Stack(
            children: [
              Positioned(
                right: 5,
                top: 0,
                child: Icon(
                  selectedAddress ? Icons.domain_verification_outlined : null,
                  color: selectedAddress
                      ? dark
                          ? XPColors.light
                          : XPColors.dark.withOpacity(0.6)
                      : null,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    address.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: XPSizes.sm / 2),
                  Text(address.formattedPhoneNo,
                      maxLines: 1, overflow: TextOverflow.ellipsis),
                  const SizedBox(height: XPSizes.sm / 2),
                  Text(address.toString(), softWrap: true),
                ],
              )
            ],
          ),
        ),
      );
    });
  }
}
