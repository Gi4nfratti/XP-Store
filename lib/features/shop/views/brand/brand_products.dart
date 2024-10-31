import 'package:flutter/material.dart';
import 'package:xp_store/common/widgets/appbar/appbar.dart';
import 'package:xp_store/common/widgets/brands/brand_card.dart';
import 'package:xp_store/common/widgets/products/sortable/sortable_products.dart';
import 'package:xp_store/common/widgets/shimmer/vertical_product_shimmer.dart';
import 'package:xp_store/features/shop/controllers/brand_controller.dart';
import 'package:xp_store/features/shop/models/brand_model.dart';
import 'package:xp_store/utils/constants/sizes.dart';
import 'package:xp_store/utils/helpers/cloud_helper_functions.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key, required this.brand});

  final BrandModel brand;

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return Scaffold(
      appBar: XPAppBar(title: Text(brand.name)),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(XPSizes.defaultSpace),
          child: Column(
            children: [
              XPBrandCard(
                showBorder: true,
                brand: brand,
              ),
              SizedBox(height: XPSizes.spaceBtwSections),
              FutureBuilder(
                  future: controller.getBrandProducts(brandId: brand.id),
                  builder: (context, snapshot) {
                    const loader = XPVerticalProductShimmer();

                    final widget = XPCloudHelperFunctions.checkMultiRecordState(
                        snapshot: snapshot, loader: loader);
                    if (widget != null) return widget;

                    final brandProducts = snapshot.data!;
                    return XPSortableProducts(products: brandProducts);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
