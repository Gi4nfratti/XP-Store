import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:xp_store/common/widgets/success_screen/success_screen.dart';
import 'package:xp_store/data/repositories/authentication/authentication_repository.dart';
import 'package:xp_store/data/repositories/orders/order_repository.dart';
import 'package:xp_store/features/personalization/controllers/address_controller.dart';
import 'package:xp_store/features/shop/controllers/product/cart_controller.dart';
import 'package:xp_store/features/shop/controllers/product/checkout_controller.dart';
import 'package:xp_store/features/shop/models/order_model.dart';
import 'package:xp_store/features/shop/views/home/home.dart';
import 'package:xp_store/navigation_menu.dart';
import 'package:xp_store/utils/constants/image_strings.dart';
import 'package:xp_store/utils/popups/full_screen_loader.dart';
import 'package:xp_store/utils/popups/loaders.dart';

class OrderController extends GetxController {
  static OrderController instance = Get.find();

  final cartController = CartController.instance;
  final addressController = AddressController.instance;
  final checkoutController = CheckoutController.instance;
  final orderRepository = Get.put(OrderRepository());

  Future<List<OrderModel>> fetchUserOrders() async {
    try {
      final userOrders = await orderRepository.fetchUserOrders();
      return userOrders;
    } catch (e) {
      XPLoaders.warningSnackBar(title: 'Ah Não!', message: e.toString());
      return [];
    }
  }

  void processOrder(double totalAmount) async {
    try {
      XPFullScreenLoader.openLoadingDialog(
          'Processando...', XPImages.lProcInfo);
      final userId = AuthenticationRepository.instance.authUser.uid;
      if (userId.isEmpty) return;

      final order = OrderModel(
        id: UniqueKey().toString(),
        userId: userId,
        status: OrderStatus.pending,
        totalAmount: totalAmount,
        orderDate: DateTime.now(),
        paymentMethod: checkoutController.selectedPaymentMethod.value.name,
        address: addressController.selectedAddress.value,
        deliveryDate: DateTime.now(),
        items: cartController.cartItems.toList(),
      );
      await orderRepository.saveOrder(order, userId);

      cartController.clearCart();
      Get.off(() => SuccessScreen(
          image: XPImages.successEmailAnimation,
          title: 'Pagamento Confirmado',
          subTitle: 'Seu pagamento foi concluído',
          onPressed: () => Get.offAll(() => const NavigationMenu())));
    } catch (e) {
      XPLoaders.errorSnackBar(title: 'Ah Não', message: e.toString());
    }
  }
}
