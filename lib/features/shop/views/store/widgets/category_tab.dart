import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xp_store/common/widgets/brands/brand_showcase.dart';
import 'package:xp_store/common/widgets/layouts/grid_layout.dart';
import 'package:xp_store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:xp_store/common/widgets/shimmer/vertical_product_shimmer.dart';
import 'package:xp_store/common/widgets/texts/section_heading.dart';
import 'package:xp_store/features/shop/controllers/category_controller.dart';
import 'package:xp_store/features/shop/models/category_model.dart';
import 'package:xp_store/features/shop/models/product_model.dart';
import 'package:xp_store/features/shop/views/all_products/all_products.dart';
import 'package:xp_store/features/shop/views/store/widgets/category_brands.dart';
import 'package:xp_store/utils/constants/image_strings.dart';
import 'package:xp_store/utils/constants/sizes.dart';
import 'package:xp_store/utils/helpers/cloud_helper_functions.dart';

class XPCategoryTab extends StatelessWidget {
  const XPCategoryTab({super.key, required this.category});
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    return ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.all(XPSizes.defaultSpace),
            child: Column(
              children: [
                CategoryBrands(category: category),
                const SizedBox(height: XPSizes.spaceBtwItems),
                FutureBuilder(
                    future:
                        controller.getCategoryProducts(categoryId: category.id),
                    builder: (context, snapshot) {
                      final response =
                          XPCloudHelperFunctions.checkMultiRecordState(
                              snapshot: snapshot,
                              loader: const XPVerticalProductShimmer());

                      if (response != null) return response;

                      final products = snapshot.data!;

                      return Column(
                        children: [
                          XPSectionHeading(
                              title: 'Você deve gostar',
                              showActionButton: true,
                              onPressed: () => Get.to(AllProductsView(
                                    title: category.name,
                                    futureMethod:
                                        controller.getCategoryProducts(
                                            categoryId: category.id, limit: -1),
                                  ))),
                          const SizedBox(height: XPSizes.spaceBtwItems),
                          XPGridLayout(
                              itemCount: products.length,
                              itemBuilder: (_, index) => XPProductCardVertical(
                                    product: products[index],
                                  )),
                        ],
                      );
                    }),
              ],
            ),
          ),
        ]);
  }
}
