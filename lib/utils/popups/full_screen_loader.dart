import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xp_store/common/widgets/loaders/animation_loader.dart';
import 'package:xp_store/utils/constants/colors.dart';
import 'package:xp_store/utils/helpers/helper_functions.dart';

class XPFullScreenLoader {
  static void openLoadingDialog(String text, String animation) {
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      builder: (_) => PopScope(
        canPop: false,
        child: Container(
          color: XPHelperFunctions.isDarkMode(Get.context!)
              ? XPColors.dark
              : XPColors.white,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              const SizedBox(height: 250),
              XPAnimationLoaderWidget(text: text, animation: animation),
            ],
          ),
        ),
      ),
    );
  }

  static stopLoading() {
    Navigator.of(Get.overlayContext!).pop();
  }
}
