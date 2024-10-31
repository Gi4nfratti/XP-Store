import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:xp_store/common/widgets/appbar/appbar.dart';
import 'package:xp_store/features/personalization/controllers/address_controller.dart';
import 'package:xp_store/features/personalization/views/address/add_new_address.dart';
import 'package:xp_store/features/personalization/views/address/widgets/single_address.dart';
import 'package:xp_store/utils/constants/colors.dart';
import 'package:xp_store/utils/constants/sizes.dart';
import 'package:xp_store/utils/helpers/cloud_helper_functions.dart';

class UserAddressView extends StatelessWidget {
  const UserAddressView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddressController());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => const AddNewAddressView()),
        backgroundColor: XPColors.primary,
        child: const Icon(Icons.add_outlined, color: XPColors.white),
      ),
      appBar: XPAppBar(
        showBackArrow: true,
        title:
            Text('Endereços', style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(XPSizes.defaultSpace),
          child: Obx(
            () => FutureBuilder(
                key: Key(controller.refreshData.value.toString()),
                future: controller.getAllUserAddresses(),
                builder: (context, snapshot) {
                  final response = XPCloudHelperFunctions.checkMultiRecordState(
                      snapshot: snapshot);
                  if (response != null) return response;
                  final addresses = snapshot.data!;

                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: addresses.length,
                      itemBuilder: (_, index) => XPSingleAddress(
                          address: addresses[index],
                          onTap: () =>
                              controller.selectAddress(addresses[index])));
                }),
          ),
        ),
      ),
    );
  }
}
