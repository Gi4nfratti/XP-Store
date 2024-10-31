import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xp_store/features/personalization/views/settings/settings.dart';
import 'package:xp_store/features/shop/views/home/home.dart';
import 'package:xp_store/features/shop/views/store/store.dart';
import 'package:xp_store/features/shop/views/favourite/favourite.dart';
import 'package:xp_store/utils/constants/colors.dart';
import 'package:xp_store/utils/helpers/helper_functions.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final isDarkMode = XPHelperFunctions.isDarkMode(context);

    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
            height: 80,
            elevation: 0,
            selectedIndex: controller.selectedIndex.value,
            onDestinationSelected: (value) =>
                controller.selectedIndex.value = value,
            backgroundColor: isDarkMode ? XPColors.black : XPColors.white,
            indicatorColor: isDarkMode
                ? XPColors.white.withOpacity(0.1)
                : XPColors.black.withOpacity(0.1),
            destinations: const [
              NavigationDestination(
                  icon: Icon(Icons.home_outlined), label: 'Início'),
              NavigationDestination(
                  icon: Icon(Icons.shopping_bag_outlined), label: 'Loja'),
              NavigationDestination(
                  icon: Icon(Icons.favorite_outline), label: 'Favoritos'),
              NavigationDestination(
                  icon: Icon(Icons.person_outline), label: 'Perfil'),
            ]),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final screens = [
    const HomeScreen(),
    const StoreScreen(),
    const FavouriteScreen(),
    const SettingsScreen(),
  ];
}
