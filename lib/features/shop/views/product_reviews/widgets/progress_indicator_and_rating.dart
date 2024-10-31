import 'package:flutter/material.dart';
import 'package:xp_store/utils/constants/colors.dart';
import 'package:xp_store/utils/device/device_utility.dart';
class XPRatingProgressIndicator extends StatelessWidget {
  const XPRatingProgressIndicator({
    super.key, required this.text, required this.value,
  });

  final String text;
  final double value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 1,child: Text(text, style: Theme.of(context).textTheme.bodyMedium)),
        Expanded(
          flex: 11,
          child: SizedBox(
            width: XPDeviceUtils.getScreenWidth(context) * 0.5,
            child: LinearProgressIndicator(
              value: value,
              minHeight: 11,
              backgroundColor: XPColors.grey,
              valueColor: const AlwaysStoppedAnimation(XPColors.primary),
              borderRadius: BorderRadius.circular(7),
            ),
          ),
        )
      ],
    );
  }
}