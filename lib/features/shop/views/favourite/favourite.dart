import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xp_store/common/widgets/appbar/appbar.dart';
import 'package:xp_store/common/widgets/icons/circular_icon.dart';
import 'package:xp_store/common/widgets/layouts/grid_layout.dart';
import 'package:xp_store/common/widgets/loaders/animation_loader.dart';
import 'package:xp_store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:xp_store/common/widgets/shimmer/vertical_product_shimmer.dart';
import 'package:xp_store/features/shop/controllers/product/favourites_controller.dart';
import 'package:xp_store/features/shop/views/home/home.dart';
import 'package:xp_store/navigation_menu.dart';
import 'package:xp_store/utils/constants/image_strings.dart';
import 'package:xp_store/utils/constants/sizes.dart';
import 'package:xp_store/utils/helpers/cloud_helper_functions.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = FavouritesController.instance;
    return Scaffold(
      appBar: XPAppBar(
        title: Text(
          'Favoritos',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          XPCircularIcon(
              icon: Icons.add_outlined,
              onPressed: () => Get.to(const HomeScreen()))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(XPSizes.defaultSpace),
          child: Column(
            children: [
              Obx(() => FutureBuilder(
                  future: controller.favoriteProducts(),
                  builder: (context, snapshot) {
                    const loader = XPVerticalProductShimmer(itemCount: 4);
                    final emptyWidget = XPAnimationLoaderWidget(
                      text: 'A lista está vazia...',
                      animation: XPImages.lProcInfo,
                      showAction: true,
                      actionText: 'Vamos adicionar alguns...',
                      onActionPressed: () => Get.to(const HomeScreen()),
                    );
                    final widget = XPCloudHelperFunctions.checkMultiRecordState(
                        snapshot: snapshot,
                        loader: loader,
                        nothingFound: emptyWidget);

                    if (widget != null) return widget;

                    final products = snapshot.data!;
                    return XPGridLayout(
                        itemCount: products.length,
                        itemBuilder: (_, index) => XPProductCardVertical(
                              product: products[index],
                            ));
                  }))
            ],
          ),
        ),
      ),
    );
  }
}
