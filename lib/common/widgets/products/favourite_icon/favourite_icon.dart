import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xp_store/common/widgets/icons/circular_icon.dart';
import 'package:xp_store/features/shop/controllers/product/favourites_controller.dart';

class XPFavouriteIcon extends StatelessWidget {
  const XPFavouriteIcon({super.key, required this.productId});

  final String productId;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavouritesController());
    return Obx(() => XPCircularIcon(
          icon: controller.isFavorite(productId)
              ? Icons.favorite_outlined
              : Icons.favorite_border_outlined,
          color: controller.isFavorite(productId) ? Colors.red : null,
          onPressed: () => controller.toggleFavoriteProduct(productId),
        ));
  }
}
