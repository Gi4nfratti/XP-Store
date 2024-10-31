import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:xp_store/utils/constants/colors.dart';
class XPRatingBarIndicator extends StatelessWidget {
  const XPRatingBarIndicator({
    super.key, required this.rating,
  });

  final double rating;

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
        rating: rating,
        itemSize: 20,
        unratedColor: XPColors.grey,
        itemBuilder: (_, __) => const Icon(
              Icons.star,
              color: XPColors.primary,
            ));
  }
}
