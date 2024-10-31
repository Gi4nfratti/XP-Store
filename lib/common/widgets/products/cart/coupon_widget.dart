import 'package:flutter/material.dart';
import 'package:xp_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:xp_store/utils/constants/colors.dart';
import 'package:xp_store/utils/constants/sizes.dart';
import 'package:xp_store/utils/helpers/helper_functions.dart';
class XPCouponCode extends StatelessWidget {
  const XPCouponCode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = XPHelperFunctions.isDarkMode(context);
    return XPRoundedContainer(
      showBorder: true,
      backgroundColor: dark ? XPColors.dark : XPColors.white,
      padding:
          const EdgeInsets.only(top: XPSizes.sm, bottom: XPSizes.sm, right: XPSizes.sm, left: XPSizes.md),
      child: Row(
        children: [
          Flexible(
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Insira seu Cupom de Desconto',
                focusedBorder: InputBorder.none,
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          ),
          SizedBox(width: 80, child: ElevatedButton(onPressed: (){},
          style: ElevatedButton.styleFrom(
            foregroundColor: dark ? XPColors.white.withOpacity(0.5) : XPColors.dark.withOpacity(0.5),
            backgroundColor: XPColors.grey.withOpacity(0.2),
            side: BorderSide(color: XPColors.grey.withOpacity(0.1))
          ),
           child: const Text('Aplicar')))
        ],
      ),
    );
  }
}
