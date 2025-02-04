import 'package:flutter/material.dart';
import 'package:xp_store/features/shop/views/product_reviews/widgets/progress_indicator_and_rating.dart';
class XPOverallProductRating extends StatelessWidget {
  const XPOverallProductRating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 3, child: Text('4.8', style: Theme.of(context).textTheme.displayLarge)),
        const Expanded(
          flex: 7,
          child: Column(
            children: [
              XPRatingProgressIndicator(text: '5', value: 1.0),
              XPRatingProgressIndicator(text: '4', value: 0.8),
              XPRatingProgressIndicator(text: '3', value: 0.6),
              XPRatingProgressIndicator(text: '2', value: 0.4),
              XPRatingProgressIndicator(text: '1', value: 0.2),
            ],
          ),
        )
      ],
    );
  }
}