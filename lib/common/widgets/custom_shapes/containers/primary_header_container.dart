import 'package:flutter/material.dart';
import 'package:xp_store/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:xp_store/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:xp_store/utils/constants/colors.dart';

class XPPrimaryHeaderContainer extends StatelessWidget {
  const XPPrimaryHeaderContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return XPCurvedEdgeWidget(
      child: Container(
        color: XPColors.primary,
        child: Stack(
          children: [
            Positioned(
              top: -150,
              right: -250,
              child: XPCircularContainer(
                  backgroundColor: XPColors.textWhite.withOpacity(0.1)),
            ),
            Positioned(
              top: 100,
              right: -300,
              child: XPCircularContainer(
                  backgroundColor: XPColors.textWhite.withOpacity(0.1)),
            ),
            child
          ],
        ),
      ),
    );
  }
}
