import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xp_store/data/repositories/authentication/authentication_repository.dart';
import 'package:xp_store/data/repositories/user/user_repository.dart';
import 'package:xp_store/features/authentication/views/signup/verify_email.dart';
import 'package:xp_store/features/personalization/models/user_model.dart';
import 'package:xp_store/utils/constants/image_strings.dart';
import 'package:xp_store/utils/helpers/networkmanager.dart';
import 'package:xp_store/utils/popups/full_screen_loader.dart';
import 'package:xp_store/utils/popups/loaders.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  final hidePassword = true.obs;
  final privacyPolicy = true.obs;
  final email = TextEditingController();
  final lastName = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  final firstName = TextEditingController();
  final phoneNumber = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  void signup() async {
    try {
      XPFullScreenLoader.openLoadingDialog(
          'Processando as Informações...', XPImages.lProcInfo);
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        XPFullScreenLoader.stopLoading();
        return;
      } else if (!signupFormKey.currentState!.validate()) {
        XPFullScreenLoader.stopLoading();
        return;
      } else if (!privacyPolicy.value) {
        XPLoaders.warningSnackBar(
            title: 'Política de Privacidade',
            message:
                'Para criar a conta é necessário aceitar os Termos de Política de Privacidade');
        return;
      } else {
        final userCredential = await AuthenticationRepository.instance
            .registerWithEmailAndPassword(
                email.text.trim(), password.text.trim());

        final newUser = UserModel(
            id: userCredential.user!.uid,
            firstName: firstName.text.trim(),
            lastName: lastName.text.trim(),
            username: username.text.trim(),
            email: email.text.trim(),
            phoneNumber: phoneNumber.text.trim(),
            profilePicture: '');

        final userRepository = Get.put(UserRepository());
        await userRepository.saveUserRecord(newUser);

        XPFullScreenLoader.stopLoading();
        XPLoaders.successSnackBar(
            title: 'Tudo certo!',
            message:
                'Sua conta foi criada. Verifique seu e-mail para continuar');

        Get.to(() => VerifyEmailScreen(email: email.text.trim()));
      }
    } catch (e) {
      XPFullScreenLoader.stopLoading();
      XPLoaders.errorSnackBar(title: 'Ah Não!', message: e.toString());
    }
  }
}
