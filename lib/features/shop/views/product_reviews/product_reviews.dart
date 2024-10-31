import 'package:flutter/material.dart';
import 'package:xp_store/common/widgets/appbar/appbar.dart';
import 'package:xp_store/common/widgets/products/ratings/rating_indicator.dart';
import 'package:xp_store/features/shop/views/product_reviews/widgets/rating_progress_indicator.dart';
import 'package:xp_store/features/shop/views/product_reviews/widgets/user_review_card.dart';
import 'package:xp_store/utils/constants/sizes.dart';

class ProductReviewsView extends StatelessWidget {
  const ProductReviewsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const XPAppBar(
          title: Text('Avaliações & Notas'), showBackArrow: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(XPSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
                "Avaliações e notas são verificadas e são de pessoas que usam o mesmo tipo de dispositivo que você usa."),
            const SizedBox(height: XPSizes.spaceBtwItems),
            const XPOverallProductRating(),
            const XPRatingBarIndicator(rating: 3.5),
            Text('12,611', style: Theme.of(context).textTheme.bodySmall),
            const SizedBox(height: XPSizes.spaceBtwSections),
            const UserReviewCard()
          ],
        ),
      ),
    );
  }
}
