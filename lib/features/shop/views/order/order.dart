import 'package:flutter/material.dart';
import 'package:xp_store/common/widgets/appbar/appbar.dart';
import 'package:xp_store/features/shop/views/order/widgets/orders_list.dart';
import 'package:xp_store/utils/constants/sizes.dart';

class OrderView extends StatelessWidget {
  const OrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: XPAppBar(title: Text('Meus Pedidos', style: Theme.of(context).textTheme.headlineSmall), showBackArrow: true),
      body: const Padding(padding: EdgeInsets.all(XPSizes.defaultSpace),
      child: XPOrderListItems()),
    );
  }
}