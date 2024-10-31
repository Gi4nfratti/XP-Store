import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:xp_store/data/repositories/authentication/authentication_repository.dart';
import 'package:xp_store/features/authentication/views/password_configuration/reset_password.dart';
import 'package:xp_store/utils/constants/image_strings.dart';
import 'package:xp_store/utils/helpers/networkmanager.dart';
import 'package:xp_store/utils/popups/full_screen_loader.dart';
import 'package:xp_store/utils/popups/loaders.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  sendPasswordResetEmail() async {
    try {
      XPFullScreenLoader.openLoadingDialog(
          'Processando...', XPImages.lProcInfo);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        XPFullScreenLoader.stopLoading();
        return;
      }
      if (!forgetPasswordFormKey.currentState!.validate()) {
        XPFullScreenLoader.stopLoading();
        return;
      }
      await AuthenticationRepository.instance
          .sendPasswordResetEmail(email.text.trim());
      XPFullScreenLoader.stopLoading();
      XPLoaders.successSnackBar(
          title: 'E-mail enviado',
          message: 'Foi enviado um e-mail para alterar sua senha');
      Get.to(() => ResetPasswordScreen(email: email.text.trim()));
    } catch (e) {
      XPFullScreenLoader.stopLoading();
      XPLoaders.errorSnackBar(title: 'Ah não', message: e.toString());
    }
  }

  resendPasswordResetEmail(String email) async {
    try {
      XPFullScreenLoader.openLoadingDialog(
          'Processando...', XPImages.lProcInfo);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        XPFullScreenLoader.stopLoading();
        return;
      }
      await AuthenticationRepository.instance.sendPasswordResetEmail(email);
      XPFullScreenLoader.stopLoading();
      XPLoaders.successSnackBar(
          title: 'E-mail enviado',
          message: 'Foi enviado um e-mail para alterar sua senha');
    } catch (e) {
      XPFullScreenLoader.stopLoading();
      XPLoaders.errorSnackBar(title: 'Ah não', message: e.toString());
    }
  }
}
