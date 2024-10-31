import 'package:flutter/material.dart';
import 'package:xp_store/common/widgets/brands/brand_showcase.dart';
import 'package:xp_store/common/widgets/shimmer/boxes_shimmer.dart';
import 'package:xp_store/common/widgets/shimmer/list_tile_shimmer.dart';
import 'package:xp_store/features/shop/controllers/brand_controller.dart';
import 'package:xp_store/features/shop/models/category_model.dart';
import 'package:xp_store/utils/constants/image_strings.dart';
import 'package:xp_store/utils/constants/sizes.dart';
import 'package:xp_store/utils/helpers/cloud_helper_functions.dart';

class CategoryBrands extends StatelessWidget {
  const CategoryBrands({super.key, required this.category});

  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return FutureBuilder(
        future: controller.getBrandsForCategory(category.id),
        builder: (context, snapshot) {
          const loader = Column(
            children: [
              XPListTileShimmer(),
              SizedBox(height: XPSizes.spaceBtwItems),
              XPBoxesShimmer(),
              SizedBox(height: XPSizes.spaceBtwItems),
            ],
          );

          final widget = XPCloudHelperFunctions.checkMultiRecordState(
              snapshot: snapshot, loader: loader);
          if (widget != null) return widget;

          final brands = snapshot.data!;

          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: brands.length,
            itemBuilder: (_, index) {
              final brand = brands[index];
              return FutureBuilder(
                  future:
                      controller.getBrandProducts(brandId: brand.id, limit: 3),
                  builder: (context, snapshot) {
                    final widget = XPCloudHelperFunctions.checkMultiRecordState(
                        snapshot: snapshot, loader: loader);
                    if (widget != null) return widget;

                    final products = snapshot.data!;

                    return XPBrandShowcase(
                      images: products.map((e) => e.thumbnail).toList(),
                      brand: brand,
                    );
                  });
            },
          );
        });
  }
}
