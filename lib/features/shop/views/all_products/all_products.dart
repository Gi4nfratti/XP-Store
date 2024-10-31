import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:xp_store/common/widgets/appbar/appbar.dart';
import 'package:xp_store/common/widgets/products/sortable/sortable_products.dart';
import 'package:xp_store/features/shop/controllers/all_products_controller.dart';
import 'package:xp_store/features/shop/models/product_model.dart';
import 'package:xp_store/utils/constants/colors.dart';
import 'package:xp_store/utils/constants/sizes.dart';
import 'package:xp_store/utils/helpers/cloud_helper_functions.dart';

class AllProductsView extends StatelessWidget {
  const AllProductsView(
      {super.key, required this.title, this.query, this.futureMethod});

  final String title;
  final Query? query;
  final Future<List<ProductModel>>? futureMethod;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductsController());
    return Scaffold(
      appBar: XPAppBar(title: Text(title), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(XPSizes.defaultSpace),
          child: FutureBuilder(
            future: futureMethod ?? controller.fetchProductsByQuery(query),
            builder: (context, snapshot) {
              const loader = SizedBox(
                  height: 50,
                  width: 50,
                  child: CircularProgressIndicator(color: XPColors.primary));

              final widget = XPCloudHelperFunctions.checkMultiRecordState(
                  snapshot: snapshot, loader: loader);

              if (widget != null) return widget;

              final products = snapshot.data!;

              return XPSortableProducts(products: products);
            },
          ),
        ),
      ),
    );
  }
}
