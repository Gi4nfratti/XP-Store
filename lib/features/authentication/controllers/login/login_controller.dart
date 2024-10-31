import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:xp_store/data/repositories/authentication/authentication_repository.dart';
import 'package:xp_store/features/personalization/controllers/user_controller.dart';
import 'package:xp_store/utils/constants/image_strings.dart';
import 'package:xp_store/utils/helpers/networkmanager.dart';
import 'package:xp_store/utils/popups/full_screen_loader.dart';
import 'package:xp_store/utils/popups/loaders.dart';

class LoginController extends GetxController {
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final userController = Get.put(UserController());

  @override
  void onInit() {
    email.text = localStorage.read('REMEMBER_ME_EMAIL') ?? '';
    password.text = localStorage.read('REMEMBER_ME_PASSWORD') ?? '';
    super.onInit();
  }

  Future<void> emailAndPasswordSignIn() async {
    try {
      XPFullScreenLoader.openLoadingDialog('Entrando...', XPImages.lProcInfo);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        XPFullScreenLoader.stopLoading();
        return;
      }

      if (!loginFormKey.currentState!.validate()) {
        XPFullScreenLoader.stopLoading();
        return;
      }
      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }

      final userCredentials = await AuthenticationRepository.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      XPFullScreenLoader.stopLoading();

      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      XPFullScreenLoader.stopLoading();
      XPLoaders.errorSnackBar(title: 'Ah não', message: e.toString());
    }
  }

  Future<void> googleSignIn() async {
    try {
      XPFullScreenLoader.openLoadingDialog('Entrando...', XPImages.lProcInfo);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        XPFullScreenLoader.stopLoading();
        return;
      }

      final userCredentials =
          await AuthenticationRepository.instance.signInWithGoogle();
      await userController.saveUserRecord(userCredentials);
      XPFullScreenLoader.stopLoading();
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      XPFullScreenLoader.stopLoading();
      XPLoaders.errorSnackBar(title: 'Ah não!', message: e.toString());
    }
  }
}
