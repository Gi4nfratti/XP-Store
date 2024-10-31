import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:xp_store/data/repositories/product/product_repository.dart';
import 'package:xp_store/features/shop/models/product_model.dart';
import 'package:xp_store/utils/popups/loaders.dart';

class AllProductsController extends GetxController {
  static AllProductsController get instance => Get.find();

  final repository = ProductRepository.instance;
  final RxString selectedSortOption = 'Nome'.obs;
  final RxList<ProductModel> products = <ProductModel>[].obs;

  Future<List<ProductModel>> fetchProductsByQuery(Query? query) async {
    try {
      if (query == null) return [];

      final products = await repository.fetchProductsByQuery(query);
      return products;
    } catch (e) {
      XPLoaders.errorSnackBar(title: 'Ah não!', message: e.toString());
      return [];
    }
  }

  void sortProducts(String sortOption) {
    selectedSortOption.value = sortOption;

    switch (sortOption) {
      case 'Nome':
        products.sort((a, b) => a.title.compareTo(b.title));
        break;
      case 'Maior Preco':
        products.sort((a, b) => a.price.compareTo(b.price));
        break;
      case 'Menor Preco':
        products.sort((a, b) => a.title.compareTo(b.title));
        break;
      case 'Novos':
        products.sort((a, b) => a.date!.compareTo(b.date!));
        break;
      case 'Vendidos':
        products.sort(
          (a, b) {
            if (b.salePrice > 0) {
              return b.salePrice.compareTo(a.salePrice);
            } else if (a.salePrice > 0) {
              return -1;
            } else {
              return 1;
            }
          },
        );
        break;
      default:
        products.sort((a, b) => a.title.compareTo(b.title));
    }
  }

  void assignProducts(List<ProductModel> products) {
    this.products.assignAll(products);
    sortProducts('Nome');
  }
}
