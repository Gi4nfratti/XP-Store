import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xp_store/common/widgets/payment/payment_tile.dart';
import 'package:xp_store/common/widgets/texts/section_heading.dart';
import 'package:xp_store/features/shop/models/payment_method_model.dart';
import 'package:xp_store/utils/constants/image_strings.dart';
import 'package:xp_store/utils/constants/sizes.dart';

class CheckoutController extends GetxController {
  static CheckoutController get instance => Get.find();

  final Rx<PaymentMethodModel> selectedPaymentMethod =
      PaymentMethodModel.empty().obs;

  @override
  void onInit() {
    selectedPaymentMethod.value =
        PaymentMethodModel(name: 'Paypal', image: XPImages.paypal);
    super.onInit();
  }

  Future<dynamic> selectPaymentMethod(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (_) => SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(XPSizes.lg),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    XPSectionHeading(
                        title: 'Como deseja pagar?', showActionButton: false),
                    SizedBox(height: XPSizes.spaceBtwSections),
                    XPPaymentTile(
                        paymentMethod: PaymentMethodModel(
                            name: 'Paypal', image: XPImages.paypal)),
                    SizedBox(height: XPSizes.spaceBtwItems / 2),
                    XPPaymentTile(
                        paymentMethod: PaymentMethodModel(
                            name: 'Visa', image: XPImages.visa)),
                    SizedBox(height: XPSizes.spaceBtwItems / 2),
                    XPPaymentTile(
                        paymentMethod: PaymentMethodModel(
                            name: 'Google Pay', image: XPImages.googlePay)),
                    SizedBox(height: XPSizes.spaceBtwItems / 2),
                    XPPaymentTile(
                        paymentMethod: PaymentMethodModel(
                            name: 'Credit Card', image: XPImages.creditCard)),
                    SizedBox(height: XPSizes.spaceBtwItems / 2),
                    XPPaymentTile(
                        paymentMethod: PaymentMethodModel(
                            name: 'Apple Pay', image: XPImages.applePay)),
                    SizedBox(height: XPSizes.spaceBtwItems / 2),
                    XPPaymentTile(
                        paymentMethod: PaymentMethodModel(
                            name: 'Mastercard', image: XPImages.mastercard)),
                    SizedBox(height: XPSizes.spaceBtwItems / 2),
                    SizedBox(height: XPSizes.spaceBtwSections),
                  ],
                ),
              ),
            ));
  }
}
