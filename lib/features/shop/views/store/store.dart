import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xp_store/common/widgets/appbar/appbar.dart';
import 'package:xp_store/common/widgets/appbar/tabbar.dart';
import 'package:xp_store/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:xp_store/common/widgets/layouts/grid_layout.dart';
import 'package:xp_store/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:xp_store/common/widgets/brands/brand_card.dart';
import 'package:xp_store/common/widgets/shimmer/brands_shimmer.dart';
import 'package:xp_store/common/widgets/texts/section_heading.dart';
import 'package:xp_store/features/shop/controllers/brand_controller.dart';
import 'package:xp_store/features/shop/controllers/category_controller.dart';
import 'package:xp_store/features/shop/views/brand/all_brands.dart';
import 'package:xp_store/features/shop/views/brand/brand_products.dart';
import 'package:xp_store/features/shop/views/store/widgets/category_tab.dart';
import 'package:xp_store/utils/constants/colors.dart';
import 'package:xp_store/utils/constants/sizes.dart';
import 'package:xp_store/utils/helpers/helper_functions.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final brandController = Get.put(BrandController());
    final categories = CategoryController.instance.featuredCategories;
    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        appBar: XPAppBar(
          title: Text(
            'Loja',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: [XPCartCounterIcon()],
        ),
        body: NestedScrollView(
            headerSliverBuilder: (_, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  pinned: true,
                  floating: true,
                  backgroundColor: XPHelperFunctions.isDarkMode(context)
                      ? XPColors.black
                      : XPColors.white,
                  expandedHeight: 440,
                  flexibleSpace: Padding(
                    padding: const EdgeInsets.all(XPSizes.defaultSpace),
                    child: ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        const SizedBox(height: XPSizes.spaceBtwItems),
                        const XPSearchContainer(
                          text: 'Procurar na loja',
                          showBorder: true,
                          showBackground: false,
                          padding: EdgeInsets.zero,
                        ),
                        const SizedBox(height: XPSizes.spaceBtwSections),
                        XPSectionHeading(
                          title: 'Marcas em Destaque',
                          onPressed: () => Get.to(() => const AllBrandsView()),
                        ),
                        const SizedBox(height: XPSizes.spaceBtwItems / 1.5),
                        Obx(() {
                          if (brandController.isLoading.value)
                            return const XPBrandsShimmer();

                          if (brandController.featuredBrands.isEmpty) {
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
                              itemCount: brandController.featuredBrands.length,
                              mainAxisExtent: 80,
                              itemBuilder: (_, index) {
                                final brand =
                                    brandController.featuredBrands[index];

                                return XPBrandCard(
                                  showBorder: true,
                                  brand: brand,
                                  onTap: () =>
                                      Get.to(() => BrandProducts(brand: brand)),
                                );
                              });
                        })
                      ],
                    ),
                  ),
                  bottom: XPTabbar(
                      tabs: categories
                          .map((category) => Tab(child: Text(category.name)))
                          .toList()),
                )
              ];
            },
            body: TabBarView(
                children: categories
                    .map((category) => XPCategoryTab(category: category))
                    .toList())),
      ),
    );
  }
}
