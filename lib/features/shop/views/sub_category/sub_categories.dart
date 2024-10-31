import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xp_store/common/widgets/appbar/appbar.dart';
import 'package:xp_store/common/widgets/images/rounded_image.dart';
import 'package:xp_store/common/widgets/products/product_cards/product_card_horizontal.dart';
import 'package:xp_store/common/widgets/shimmer/horizontal_product_shimmer.dart';
import 'package:xp_store/common/widgets/texts/section_heading.dart';
import 'package:xp_store/features/shop/controllers/category_controller.dart';
import 'package:xp_store/features/shop/models/category_model.dart';
import 'package:xp_store/features/shop/views/all_products/all_products.dart';
import 'package:xp_store/utils/constants/image_strings.dart';
import 'package:xp_store/utils/constants/sizes.dart';
import 'package:xp_store/utils/helpers/cloud_helper_functions.dart';

class SubCategoriesView extends StatelessWidget {
  const SubCategoriesView({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    return Scaffold(
      appBar: XPAppBar(title: Text(category.name), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(XPSizes.defaultSpace),
          child: Column(
            children: [
              XPRoundedImage(
                  imageUrl: XPImages.promoBanner2,
                  width: double.infinity,
                  applyImageRadius: true),
              const SizedBox(height: XPSizes.spaceBtwSections),
              FutureBuilder(
                  future: controller.getSubCategories(category.id),
                  builder: (context, snapshot) {
                    const loader = XPHorizontalProductShimmer();
                    final widget = XPCloudHelperFunctions.checkMultiRecordState(
                        snapshot: snapshot, loader: loader);
                    if (widget != null) return widget;

                    final subCategories = snapshot.data!;

                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: subCategories.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (_, index) {
                        final subCategory = subCategories[index];
                        return FutureBuilder(
                            future: controller.getCategoryProducts(
                                categoryId: subCategory.id),
                            builder: (context, snapshot) {
                              final widget =
                                  XPCloudHelperFunctions.checkMultiRecordState(
                                      snapshot: snapshot, loader: loader);
                              if (widget != null) return widget;

                              final products = snapshot.data!;

                              return Column(
                                children: [
                                  XPSectionHeading(
                                    title: subCategory.name,
                                    onPressed: () =>
                                        Get.to(() => AllProductsView(
                                              title: subCategory.name,
                                              futureMethod: controller
                                                  .getCategoryProducts(
                                                      categoryId:
                                                          subCategory.id,
                                                      limit: -1),
                                            )),
                                  ),
                                  const SizedBox(
                                      height: XPSizes.spaceBtwItems / 2),
                                  SizedBox(
                                    height: 120,
                                    child: ListView.separated(
                                      separatorBuilder: (context, index) =>
                                          const SizedBox(
                                              width: XPSizes.spaceBtwItems),
                                      itemCount: products.length,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) =>
                                          XPProductCardHorizontal(
                                              product: products[index]),
                                    ),
                                  ),
                                  const SizedBox(
                                      height: XPSizes.spaceBtwSections)
                                ],
                              );
                            });
                      },
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
