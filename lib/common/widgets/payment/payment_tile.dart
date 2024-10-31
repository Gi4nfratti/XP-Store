import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xp_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:xp_store/features/shop/controllers/product/checkout_controller.dart';
import 'package:xp_store/features/shop/models/payment_method_model.dart';
import 'package:xp_store/utils/constants/colors.dart';
import 'package:xp_store/utils/constants/sizes.dart';
import 'package:xp_store/utils/helpers/helper_functions.dart';

class XPPaymentTile extends StatelessWidget {
  const XPPaymentTile({super.key, required this.paymentMethod});
  final PaymentMethodModel paymentMethod;
  @override
  Widget build(BuildContext context) {
    final controller = CheckoutController.instance;
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      onTap: () {
        controller.selectedPaymentMethod.value = paymentMethod;
        Get.back();
      },
      leading: XPRoundedContainer(
        width: 60,
        height: 40,
        backgroundColor: XPHelperFunctions.isDarkMode(context)
            ? XPColors.light
            : XPColors.white,
        padding: const EdgeInsets.all(XPSizes.sm),
        child:
            Image(image: AssetImage(paymentMethod.image), fit: BoxFit.contain),
      ),
      title: Text(paymentMethod.name),
      trailing: const Icon(Icons.arrow_right_alt_outlined),
    );
  }
}
