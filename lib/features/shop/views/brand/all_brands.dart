import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xp_store/common/widgets/appbar/appbar.dart';
import 'package:xp_store/common/widgets/brands/brand_card.dart';
import 'package:xp_store/common/widgets/layouts/grid_layout.dart';
import 'package:xp_store/common/widgets/shimmer/brands_shimmer.dart';
import 'package:xp_store/common/widgets/texts/section_heading.dart';
import 'package:xp_store/features/shop/controllers/brand_controller.dart';
import 'package:xp_store/features/shop/models/brand_model.dart';
import 'package:xp_store/features/shop/views/brand/brand_products.dart';
import 'package:xp_store/utils/constants/sizes.dart';

class AllBrandsView extends StatelessWidget {
  const AllBrandsView({super.key});

  @override
  Widget build(BuildContext context) {
    final brandController = BrandController.instance;
    return Scaffold(
      appBar: const XPAppBar(title: Text('Marca'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(XPSizes.defaultSpace),
          child: Column(
            children: [
              const XPSectionHeading(title: 'Marcas', showActionButton: false),
              const SizedBox(height: XPSizes.spaceBtwItems),
              Obx(() {
                if (brandController.isLoading.value)
                  return const XPBrandsShimmer();

                if (brandController.allBrands.isEmpty) {
                  return Center(
                      child: Text(
                    'Nenhum dado encontrado!',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .apply(color: Colors.white),
                  ));
                }
                return XPGridLayout(
                    itemCount: brandController.allBrands.length,
                    mainAxisExtent: 80,
                    itemBuilder: (_, index) {
                      final brand = brandController.allBrands[index];

                      return XPBrandCard(showBorder: true, brand: brand);
                    });
              })
            ],
          ),
        ),
      ),
    );
  }
}
