import 'package:get/get.dart';
import 'package:xp_store/features/personalization/controllers/address_controller.dart';
import 'package:xp_store/features/shop/controllers/product/checkout_controller.dart';
import 'package:xp_store/features/shop/controllers/product/variation_controller.dart';
import 'package:xp_store/utils/helpers/networkmanager.dart';

class GeneralBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager());
    Get.put(VariationController());
    Get.put(AddressController());
    Get.put(CheckoutController());
  }
}
