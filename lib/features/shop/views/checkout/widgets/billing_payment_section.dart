import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:xp_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:xp_store/common/widgets/texts/section_heading.dart';
import 'package:xp_store/features/shop/controllers/product/checkout_controller.dart';
import 'package:xp_store/utils/constants/colors.dart';
import 'package:xp_store/utils/constants/image_strings.dart';
import 'package:xp_store/utils/constants/sizes.dart';
import 'package:xp_store/utils/helpers/helper_functions.dart';

class XPBillingPaymentSection extends StatelessWidget {
  const XPBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CheckoutController());
    final dark = XPHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        XPSectionHeading(
            title: 'Pagamento',
            buttonTitle: 'Alterar',
            onPressed: () => controller.selectPaymentMethod(context)),
        const SizedBox(height: XPSizes.spaceBtwItems / 2),
        Obx(() => Row(
              children: [
                XPRoundedContainer(
                  width: 60,
                  height: 35,
                  backgroundColor: dark ? XPColors.light : XPColors.white,
                  padding: const EdgeInsets.all(XPSizes.sm),
                  child: Image(
                      image: AssetImage(
                          controller.selectedPaymentMethod.value.image),
                      fit: BoxFit.contain),
                ),
                const SizedBox(width: XPSizes.spaceBtwItems / 2),
                Text(controller.selectedPaymentMethod.value.name,
                    style: Theme.of(context).textTheme.bodyLarge),
              ],
            ))
      ],
    );
  }
}
