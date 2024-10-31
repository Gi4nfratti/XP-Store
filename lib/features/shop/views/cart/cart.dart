import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xp_store/common/widgets/appbar/appbar.dart';
import 'package:xp_store/common/widgets/loaders/animation_loader.dart';
import 'package:xp_store/features/shop/controllers/product/cart_controller.dart';
import 'package:xp_store/features/shop/views/cart/widgets/cart_items.dart';
import 'package:xp_store/features/shop/views/checkout/checkout.dart';
import 'package:xp_store/navigation_menu.dart';
import 'package:xp_store/utils/constants/image_strings.dart';
import 'package:xp_store/utils/constants/sizes.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    return Scaffold(
      appBar: XPAppBar(
          showBackArrow: true,
          title: Text('Carrinho',
              style: Theme.of(context).textTheme.headlineSmall)),
      body: Obx(() {
        final emptyWidget = XPAnimationLoaderWidget(
          text: 'Carrinho vazio',
          animation: XPImages.lProcInfo,
          showAction: true,
          actionText: 'Adicionar Itens',
          onActionPressed: () => Get.off(() => const NavigationMenu()),
        );

        if (controller.cartItems.isEmpty) {
          return emptyWidget;
        } else {
          return SingleChildScrollView(
            child: const Padding(
              padding: EdgeInsets.all(XPSizes.defaultSpace),
              child: XPCartItems(),
            ),
          );
        }
      }),
      bottomNavigationBar: controller.cartItems.isEmpty
          ? SizedBox()
          : Padding(
              padding: const EdgeInsets.all(XPSizes.defaultSpace),
              child: ElevatedButton(
                  onPressed: () => Get.to(() => const CheckoutView()),
                  child: Obx(() =>
                      Text('Finalizar R\$${controller.totalCartPrice.value}'))),
            ),
    );
  }
}
