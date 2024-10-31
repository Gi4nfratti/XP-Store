import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';
import 'package:xp_store/common/widgets/texts/section_heading.dart';
import 'package:xp_store/features/shop/models/product_model.dart';
import 'package:xp_store/features/shop/views/product_details/widget/bottom_add_to_cart_widget.dart';
import 'package:xp_store/features/shop/views/product_details/widget/product_attributes.dart';
import 'package:xp_store/features/shop/views/product_details/widget/product_detail_image_slider.dart';
import 'package:xp_store/features/shop/views/product_details/widget/product_meta_data.dart';
import 'package:xp_store/features/shop/views/product_details/widget/rating_share_widget.dart';
import 'package:xp_store/features/shop/views/product_reviews/product_reviews.dart';
import 'package:xp_store/utils/constants/enums.dart';
import 'package:xp_store/utils/constants/sizes.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: XPBottomAddToCart(product: product),
      body: SingleChildScrollView(
        child: Column(
          children: [
            XPProductImageSlider(product: product),
            Padding(
              padding: const EdgeInsets.only(
                  right: XPSizes.defaultSpace,
                  left: XPSizes.defaultSpace,
                  bottom: XPSizes.defaultSpace),
              child: Column(
                children: [
                  const XPRatingAndShare(),
                  XPProductMetaData(product: product),
                  if (product.productType == ProductType.variable.toString())
                    XPProductAttributes(product: product),
                  if (product.productType == ProductType.variable.toString())
                    const SizedBox(height: XPSizes.spaceBtwSections),
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {}, child: const Text('Checkout'))),
                  const XPSectionHeading(
                      title: 'Descrição', showActionButton: false),
                  const SizedBox(height: XPSizes.spaceBtwItems),
                  ReadMoreText(
                    product.description ?? '',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Ver mais',
                    trimExpandedText: 'Ver menos',
                    moreStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),
                  const Divider(),
                  const SizedBox(height: XPSizes.spaceBtwItems),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const XPSectionHeading(
                          title: 'Avaliações(199)', showActionButton: false),
                      IconButton(
                          onPressed: () =>
                              Get.to(() => const ProductReviewsView()),
                          icon: const Icon(Icons.arrow_forward_ios_rounded,
                              size: 18))
                    ],
                  ),
                  const SizedBox(height: XPSizes.spaceBtwSections),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
