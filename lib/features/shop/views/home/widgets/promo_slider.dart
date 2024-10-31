import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xp_store/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:xp_store/common/widgets/images/rounded_image.dart';
import 'package:xp_store/features/shop/controllers/banner_controller.dart';
import 'package:xp_store/utils/constants/colors.dart';
import 'package:xp_store/utils/constants/sizes.dart';

class XPPromoSlider extends StatelessWidget {
  const XPPromoSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BannerController());

    return Obx(() {
      if (controller.isLoading.value) {
        return const SizedBox(
            width: 40,
            height: 40,
            child: CircularProgressIndicator(color: XPColors.black));
      }

      if (controller.banners.isEmpty) {
        return const Center(child: Text('Nenhum dado encontrado!'));
      } else {
        return Column(
          children: [
            CarouselSlider(
              items: controller.banners
                  .map((banner) => XPRoundedImage(
                        imageUrl: banner.imageUrl,
                        isNetworkImage: true,
                        onPressed: () => Get.toNamed(banner.targetScreen),
                      ))
                  .toList(),
              options: CarouselOptions(
                viewportFraction: 1,
                onPageChanged: (index, _) =>
                    controller.updatePageIndicator(index),
              ),
            ),
            const SizedBox(height: XPSizes.spaceBtwItems),
            Center(
              child: Obx(
                () => Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    for (int i = 0; i < controller.banners.length; i++)
                      XPCircularContainer(
                          width: 20,
                          height: 4,
                          margin: const EdgeInsets.only(right: 10),
                          backgroundColor:
                              controller.carouselCurrentIndex.value == i
                                  ? XPColors.primary
                                  : XPColors.grey)
                  ],
                ),
              ),
            )
          ],
        );
      }
    });
  }
}
