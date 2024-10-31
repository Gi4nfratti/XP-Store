import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xp_store/common/widgets/appbar/appbar.dart';
import 'package:xp_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:xp_store/common/widgets/products/cart/coupon_widget.dart';
import 'package:xp_store/common/widgets/success_screen/success_screen.dart';
import 'package:xp_store/features/shop/controllers/product/cart_controller.dart';
import 'package:xp_store/features/shop/controllers/product/order_controller.dart';
import 'package:xp_store/features/shop/views/cart/widgets/cart_items.dart';
import 'package:xp_store/features/shop/views/checkout/widgets/billing_address_section.dart';
import 'package:xp_store/features/shop/views/checkout/widgets/billing_amount_section.dart';
import 'package:xp_store/features/shop/views/checkout/widgets/billing_payment_section.dart';
import 'package:xp_store/navigation_menu.dart';
import 'package:xp_store/utils/constants/colors.dart';
import 'package:xp_store/utils/constants/image_strings.dart';
import 'package:xp_store/utils/constants/sizes.dart';
import 'package:xp_store/utils/helpers/helper_functions.dart';
import 'package:xp_store/utils/helpers/pricing_calculator.dart';
import 'package:xp_store/utils/popups/loaders.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    final subTotal = cartController.totalCartPrice.value;
    final dark = XPHelperFunctions.isDarkMode(context);
    final orderController = Get.put(OrderController());
    final totalAmount = XPPricingCalculator.calculateTotalPrice(subTotal, 'BR');
    return Scaffold(
      appBar: XPAppBar(
          showBackArrow: true,
          title: Text('Revisar Pedido',
              style: Theme.of(context).textTheme.headlineSmall)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(XPSizes.defaultSpace),
          child: Column(
            children: [
              const XPCartItems(showAddRemoveButtons: false),
              const SizedBox(height: XPSizes.spaceBtwSections),
              const XPCouponCode(),
              const SizedBox(height: XPSizes.spaceBtwSections),
              XPRoundedContainer(
                padding: const EdgeInsets.all(XPSizes.md),
                showBorder: true,
                backgroundColor: dark ? XPColors.black : XPColors.white,
                child: const Column(
                  children: [
                    XPBillingAmountSection(),
                    SizedBox(height: XPSizes.spaceBtwItems),
                    Divider(),
                    SizedBox(height: XPSizes.spaceBtwItems),
                    XPBillingPaymentSection(),
                    SizedBox(height: XPSizes.spaceBtwItems),
                    XPBillingAddressSection()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(XPSizes.defaultSpace),
        child: ElevatedButton(
            onPressed: subTotal > 0
                ? () => orderController.processOrder(totalAmount)
                : () => XPLoaders.warningSnackBar(
                    title: 'Carrinho Vazio',
                    message:
                        'Adicione itens ao carrinho antes de finalizar o pedido.'),
            child: Text('Finalizar R\$$totalAmount')),
      ),
    );
  }
}
