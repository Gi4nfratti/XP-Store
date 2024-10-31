import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:xp_store/data/repositories/user/user_repository.dart';
import 'package:xp_store/features/personalization/controllers/user_controller.dart';
import 'package:xp_store/features/personalization/views/profile/profile.dart';
import 'package:xp_store/utils/constants/image_strings.dart';
import 'package:xp_store/utils/helpers/networkmanager.dart';
import 'package:xp_store/utils/popups/full_screen_loader.dart';
import 'package:xp_store/utils/popups/loaders.dart';

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    initializeNames();
    super.onInit();
  }

  Future<void> initializeNames() async {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  Future<void> updateUserName() async {
    try {
      XPFullScreenLoader.openLoadingDialog(
          'Atualizando suas informações...', XPImages.lProcInfo);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        XPFullScreenLoader.stopLoading();
        return;
      }

      if (!updateUserNameFormKey.currentState!.validate()) {
        XPFullScreenLoader.stopLoading();
        return;
      }

      Map<String, dynamic> name = {
        'FirstName': firstName.text.trim(),
        'LastName': lastName.text.trim()
      };
      await userRepository.updateSingleField(name);

      userController.user.value.firstName = firstName.text;
      userController.user.value.lastName = lastName.text;

      XPFullScreenLoader.stopLoading();
      XPLoaders.successSnackBar(
          title: 'Tudo certo!', message: 'Seu nome foi atualizado com sucesso');

      Get.off(() => const ProfileScreen());
    } catch (e) {
      XPFullScreenLoader.stopLoading();
      XPLoaders.errorSnackBar(title: 'Ah não!', message: e.toString());
    }
  }
}
