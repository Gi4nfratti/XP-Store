import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:xp_store/common/widgets/layouts/grid_layout.dart';
import 'package:xp_store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:xp_store/features/shop/controllers/all_products_controller.dart';
import 'package:xp_store/features/shop/models/product_model.dart';
import 'package:xp_store/utils/constants/sizes.dart';

class XPSortableProducts extends StatelessWidget {
  const XPSortableProducts({
    super.key,
    required this.products,
  });

  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductsController());
    controller.assignProducts(products);
    return Column(
      children: [
        DropdownButtonFormField(
          decoration: const InputDecoration(prefixIcon: Icon(Icons.sort)),
          value: controller.selectedSortOption.value,
          items: [
            'Nome',
            'Maior Preco',
            'Menor Preco',
            'Vendidos',
            'Novos',
          ]
              .map((option) =>
                  DropdownMenuItem(value: option, child: Text(option)))
              .toList(),
          onChanged: (value) {
            controller.sortProducts(value!);
          },
        ),
        const SizedBox(height: XPSizes.spaceBtwSections),
        Obx(
          () => XPGridLayout(
              itemCount: controller.products.length,
              itemBuilder: (_, index) => XPProductCardVertical(
                    product: controller.products[index],
                  )),
        )
      ],
    );
  }
}
