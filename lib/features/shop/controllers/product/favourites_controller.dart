import 'dart:convert';

import 'package:get/get.dart';
import 'package:xp_store/data/repositories/product/product_repository.dart';
import 'package:xp_store/features/shop/models/product_model.dart';
import 'package:xp_store/utils/local_storage/storage_utility.dart';
import 'package:xp_store/utils/popups/loaders.dart';

class FavouritesController extends GetxController {
  static FavouritesController get instance => Get.find();

  final favorites = <String, bool>{}.obs;

  @override
  void onInit() {
    super.onInit();
    initFavorites();
  }

  void initFavorites() {
    final json = XPLocalStorage.instance().readData('favorites');
    if (json != null) {
      final storedFavorites = jsonDecode(json) as Map<String, dynamic>;
      favorites.assignAll(
          storedFavorites.map((key, value) => MapEntry(key, value as bool)));
    }
  }

  bool isFavorite(String productId) {
    return favorites[productId] ?? false;
  }

  void toggleFavoriteProduct(String productId) {
    if (!favorites.containsKey(productId)) {
      favorites[productId] = true;
      saveFavoriteToStorage();
      XPLoaders.customToast(message: 'Adicionado aos Favoritos!');
    } else {
      XPLocalStorage.instance().removeData(productId);
      favorites.remove(productId);
      saveFavoriteToStorage();
      favorites.refresh();
      XPLoaders.customToast(message: 'Removido dos Favoritos!');
    }
  }

  void saveFavoriteToStorage() {
    final encodedFavorites = json.encode(favorites);
    XPLocalStorage.instance().writeData('favorites', encodedFavorites);
  }

  Future<List<ProductModel>> favoriteProducts() async {
    return await ProductRepository.instance
        .getFavouriteProducts(favorites.keys.toList());
  }
}
