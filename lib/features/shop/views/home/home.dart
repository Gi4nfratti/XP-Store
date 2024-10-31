import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xp_store/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:xp_store/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:xp_store/common/widgets/layouts/grid_layout.dart';
import 'package:xp_store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:xp_store/common/widgets/texts/section_heading.dart';
import 'package:xp_store/features/shop/controllers/product/product_controller.dart';
import 'package:xp_store/features/shop/views/all_products/all_products.dart';
import 'package:xp_store/features/shop/views/home/widgets/home_appbar.dart';
import 'package:xp_store/features/shop/views/home/widgets/home_categories.dart';
import 'package:xp_store/features/shop/views/home/widgets/promo_slider.dart';
import 'package:xp_store/utils/constants/sizes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const XPPrimaryHeaderContainer(
              child: Column(
                children: [
                  XPHomeAppBar(),
                  SizedBox(height: XPSizes.spaceBtwSections),
                  XPSearchContainer(text: 'Procurar na loja'),
                  SizedBox(height: XPSizes.spaceBtwSections),
                  Padding(
                    padding: EdgeInsets.only(left: XPSizes.defaultSpace),
                    child: Column(
                      children: [
                        XPSectionHeading(
                          title: 'Popular',
                          showActionButton: false,
                        ),
                        SizedBox(height: XPSizes.spaceBtwItems),
                        XPHomeCategories()
                      ],
                    ),
                  ),
                  SizedBox(height: XPSizes.spaceBtwSections),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(XPSizes.defaultSpace),
              child: Column(
                children: [
                  const XPPromoSlider(),
                  const SizedBox(height: XPSizes.spaceBtwSections),
                  XPSectionHeading(
                    title: 'Populares',
                    onPressed: () => Get.to(() => AllProductsView(
                          title: 'Populares',
                          futureMethod: controller.fetchAllFeaturedProducts(),
                        )),
                  ),
                  const SizedBox(height: XPSizes.spaceBtwItems),
                  Obx(() {
                    if (controller.isLoading.value) {
                      return const SizedBox(
                          height: 40,
                          width: 40,
                          child: CircularProgressIndicator(color: Colors.blue));
                    }

                    if (controller.featuredProducts.isEmpty) {
                      return Center(
                          child: Text('Nenhum dado encontrado!',
                              style: Theme.of(context).textTheme.bodyMedium));
                    }
                    return XPGridLayout(
                        itemCount: controller.featuredProducts.length,
                        itemBuilder: (_, index) => XPProductCardVertical(
                            product: controller.featuredProducts[index]));
                  }),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
