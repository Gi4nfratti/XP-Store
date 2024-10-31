import 'package:flutter/material.dart';
import 'package:xp_store/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:xp_store/utils/constants/colors.dart';
import 'package:xp_store/utils/helpers/helper_functions.dart';

class XPChoiceChip extends StatelessWidget {
  const XPChoiceChip({
    super.key,
    required this.text,
    required this.selected,
    this.onSelected,
  });

  final String text;
  final bool selected;
  final void Function(bool)? onSelected;
  @override
  Widget build(BuildContext context) {
    final isColor = XPHelperFunctions.getColor(text) != null;
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: ChoiceChip(
        label: isColor ? const SizedBox() : Text(text),
        selected: selected,
        onSelected: onSelected,
        labelStyle: TextStyle(color: selected ? XPColors.white : null),
        avatar: isColor
            ? XPCircularContainer(
                width: 50,
                height: 50,
                backgroundColor: XPHelperFunctions.getColor(text)!)
            : null,
        shape: isColor ? const CircleBorder() : null,
        labelPadding: isColor ? const EdgeInsets.all(0) : null,
        padding: isColor ? const EdgeInsets.all(0) : null,
        backgroundColor: isColor ? Colors.green : null,
      ),
    );
  }
}
