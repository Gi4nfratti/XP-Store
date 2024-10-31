import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xp_store/common/widgets/chips/choice_chip.dart';
import 'package:xp_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:xp_store/common/widgets/texts/product_price_text.dart';
import 'package:xp_store/common/widgets/texts/product_title_text.dart';
import 'package:xp_store/common/widgets/texts/section_heading.dart';
import 'package:xp_store/features/shop/controllers/product/variation_controller.dart';
import 'package:xp_store/features/shop/models/product_model.dart';
import 'package:xp_store/utils/constants/colors.dart';
import 'package:xp_store/utils/constants/sizes.dart';
import 'package:xp_store/utils/helpers/helper_functions.dart';

class XPProductAttributes extends StatelessWidget {
  const XPProductAttributes({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VariationController());
    final dark = XPHelperFunctions.isDarkMode(context);

    return Obx(
      () => Column(
        children: [
          if (controller.selectedVariation.value.id.isNotEmpty)
            XPRoundedContainer(
              padding: const EdgeInsets.all(XPSizes.md),
              backgroundColor: dark ? XPColors.darkerGrey : XPColors.grey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const XPSectionHeading(
                          title: 'Variação', showActionButton: false),
                      const SizedBox(width: XPSizes.spaceBtwItems),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const XPProductTitleText(
                                  title: 'Preço: ', smallSize: true),
                              if (controller.selectedVariation.value.salePrice >
                                  0)
                                Text(
                                    'R\$${controller.selectedVariation.value.price}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .apply(
                                            decoration:
                                                TextDecoration.lineThrough)),
                              const SizedBox(width: XPSizes.spaceBtwItems),
                              XPProductPriceText(
                                  price: controller.getVariationPrice()),
                            ],
                          ),
                          Row(
                            children: [
                              XPProductTitleText(
                                  title: controller.variationStockStatus.value,
                                  smallSize: true),
                              const SizedBox(width: XPSizes.spaceBtwItems),
                              Text('Em Estoque',
                                  style:
                                      Theme.of(context).textTheme.titleSmall),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  XPProductTitleText(
                      title:
                          controller.selectedVariation.value.description ?? '',
                      smallSize: true,
                      maxLines: 4)
                ],
              ),
            ),
          const SizedBox(height: XPSizes.spaceBtwItems),
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: product.productAttributes!
                  .map(
                    (attribute) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        XPSectionHeading(
                            title: attribute.name ?? '',
                            showActionButton: false),
                        SizedBox(height: XPSizes.spaceBtwItems / 2),
                        Obx(
                          () => Wrap(
                              spacing: 8,
                              children: attribute.values!.map((attributeValue) {
                                final isSelected = controller
                                        .selectedAttributes[attribute.name] ==
                                    attributeValue;

                                final available = controller
                                    .getAttributesAvailabilityInVariation(
                                        product.productVariations!,
                                        attribute.name!)
                                    .contains(attributeValue);

                                return XPChoiceChip(
                                    text: attributeValue,
                                    selected: isSelected,
                                    onSelected: available
                                        ? (selected) {
                                            if (selected && available) {
                                              controller.onAttributeSelected(
                                                  product,
                                                  attribute.name ?? '',
                                                  attributeValue);
                                            }
                                          }
                                        : null);
                              }).toList()),
                        )
                      ],
                    ),
                  )
                  .toList()),
        ],
      ),
    );
  }
}
