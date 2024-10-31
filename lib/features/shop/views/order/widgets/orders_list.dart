import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xp_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:xp_store/common/widgets/loaders/animation_loader.dart';
import 'package:xp_store/features/shop/controllers/product/order_controller.dart';
import 'package:xp_store/navigation_menu.dart';
import 'package:xp_store/utils/constants/colors.dart';
import 'package:xp_store/utils/constants/image_strings.dart';
import 'package:xp_store/utils/constants/sizes.dart';
import 'package:xp_store/utils/helpers/cloud_helper_functions.dart';
import 'package:xp_store/utils/helpers/helper_functions.dart';

class XPOrderListItems extends StatelessWidget {
  const XPOrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OrderController());
    final dark = XPHelperFunctions.isDarkMode(context);
    return FutureBuilder(
        future: controller.fetchUserOrders(),
        builder: (_, snapshot) {
          final emptyWidget = XPAnimationLoaderWidget(
            text: 'A lista está vazia...',
            animation: XPImages.lProcInfo,
            showAction: true,
            actionText: 'Vamos adicionar alguns...',
            onActionPressed: () => Get.off(() => const NavigationMenu()),
          );

          final response = XPCloudHelperFunctions.checkMultiRecordState(
              snapshot: snapshot, nothingFound: emptyWidget);
          if (response != null) return response;

          final orders = snapshot.data!;

          return ListView.separated(
              shrinkWrap: true,
              itemCount: orders.length,
              separatorBuilder: (_, index) =>
                  const SizedBox(height: XPSizes.spaceBtwItems),
              itemBuilder: (_, index) {
                final order = orders[index];
                return XPRoundedContainer(
                  showBorder: true,
                  padding: const EdgeInsets.all(XPSizes.md),
                  backgroundColor: dark ? XPColors.dark : XPColors.light,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.delivery_dining_outlined),
                          const SizedBox(width: XPSizes.spaceBtwItems / 2),
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(order.orderStatusText,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .apply(
                                            color: XPColors.primary,
                                            fontWeightDelta: 1)),
                                Text(order.formattedOrderDate,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall),
                              ],
                            ),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.arrow_forward_ios_outlined,
                                  size: XPSizes.iconSm)),
                        ],
                      ),
                      const SizedBox(height: XPSizes.spaceBtwItems),
                      Row(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                const Icon(Icons.delivery_dining_outlined),
                                const SizedBox(
                                    width: XPSizes.spaceBtwItems / 2),
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Pedido',
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelMedium),
                                      Text(order.id,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                const Icon(Icons.calendar_month_rounded),
                                const SizedBox(
                                    width: XPSizes.spaceBtwItems / 2),
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Data da Entrega',
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelMedium),
                                      Text(order.formattedDeliveryDate,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              });
        });
  }
}
