import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xp_store/common/widgets/appbar/appbar.dart';
import 'package:xp_store/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:xp_store/common/widgets/images/rounded_image.dart';
import 'package:xp_store/common/widgets/products/favourite_icon/favourite_icon.dart';
import 'package:xp_store/features/shop/controllers/product/images_controller.dart';
import 'package:xp_store/features/shop/models/product_model.dart';
import 'package:xp_store/utils/constants/colors.dart';
import 'package:xp_store/utils/constants/sizes.dart';
import 'package:xp_store/utils/helpers/helper_functions.dart';

class XPProductImageSlider extends StatelessWidget {
  const XPProductImageSlider({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final isDark = XPHelperFunctions.isDarkMode(context);
    final controller = Get.put(ImagesController());
    final images = controller.getAllProductImages(product);
    return XPCurvedEdgeWidget(
      child: Container(
        color: isDark ? XPColors.darkGrey : XPColors.light,
        child: Stack(
          children: [
            SizedBox(
                height: 400,
                child: Padding(
                  padding: EdgeInsets.all(XPSizes.productImageRadius * 2),
                  child: Center(child: Obx(() {
                    final image = controller.selectedProductImage.value;
                    return GestureDetector(
                      onTap: () => controller.showEnlargedImage(image),
                      child: CachedNetworkImage(
                          imageUrl: image,
                          progressIndicatorBuilder: (_, __, downloadProgress) =>
                              CircularProgressIndicator(
                                value: downloadProgress.progress,
                                color: XPColors.primary,
                              )),
                    );
                  })),
                )),
            Positioned(
              right: 0,
              bottom: 30,
              left: XPSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  separatorBuilder: (_, __) =>
                      const SizedBox(width: XPSizes.spaceBtwItems),
                  itemCount: images.length,
                  itemBuilder: (_, index) => Obx(() {
                    final imageSelected =
                        controller.selectedProductImage.value == images[index];
                    return XPRoundedImage(
                      isNetworkImage: true,
                      onPressed: () =>
                          controller.selectedProductImage.value = images[index],
                      backgroundColor: isDark ? XPColors.dark : XPColors.white,
                      imageUrl: images[index],
                      width: 80,
                      border: Border.all(
                          color: imageSelected
                              ? XPColors.primary
                              : Colors.transparent),
                      padding: const EdgeInsets.all(XPSizes.sm),
                    );
                  }),
                ),
              ),
            ),
            XPAppBar(
              showBackArrow: true,
              actions: [XPFavouriteIcon(productId: product.id)],
            )
          ],
        ),
      ),
    );
  }
}
