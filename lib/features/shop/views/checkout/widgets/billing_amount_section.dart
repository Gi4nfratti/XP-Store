import 'package:flutter/material.dart';
import 'package:xp_store/features/shop/controllers/product/cart_controller.dart';
import 'package:xp_store/utils/constants/sizes.dart';
import 'package:xp_store/utils/helpers/pricing_calculator.dart';

class XPBillingAmountSection extends StatelessWidget {
  const XPBillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    final subTotal = cartController.totalCartPrice.value;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Subtotal', style: Theme.of(context).textTheme.bodyMedium),
            Text('R\$$subTotal', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: XPSizes.spaceBtwItems / 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Valor do Frete',
                style: Theme.of(context).textTheme.bodyMedium),
            Text(
                'R\$${XPPricingCalculator.calculateShippingCost(subTotal, 'BR')}',
                style: Theme.of(context).textTheme.labelLarge),
          ],
        ),
        const SizedBox(height: XPSizes.spaceBtwItems / 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Valor de Taxa',
                style: Theme.of(context).textTheme.bodyMedium),
            Text('R\$${XPPricingCalculator.calculateTax(subTotal, 'BR')}',
                style: Theme.of(context).textTheme.labelLarge),
          ],
        ),
        const SizedBox(height: XPSizes.spaceBtwItems / 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Valor Total', style: Theme.of(context).textTheme.bodyMedium),
            Text(
                'R\$${XPPricingCalculator.calculateTotalPrice(subTotal, 'BR')}',
                style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
      ],
    );
  }
}
