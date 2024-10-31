import 'package:flutter/material.dart';
import 'package:xp_store/utils/constants/sizes.dart';

class XPProfileMenu extends StatelessWidget {
  const XPProfileMenu({
    super.key,
    required this.onPressed,
    required this.title,
    required this.value,
    this.icon = Icons.arrow_forward_ios_rounded
  });

  final IconData icon;
  final VoidCallback onPressed;
  final String title, value;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: XPSizes.spaceBtwItems / 1.5),
        child: Row(children: [
          Expanded(flex: 3,child: Text(title, style: Theme.of(context).textTheme.bodySmall, overflow: TextOverflow.ellipsis)),
          Expanded(flex: 5, child: Text(value, style: Theme.of(context).textTheme.bodyMedium, overflow: TextOverflow.ellipsis)),
          Expanded(child: Icon(icon, size: 18))
        ],),
      ),
    );
  }
}