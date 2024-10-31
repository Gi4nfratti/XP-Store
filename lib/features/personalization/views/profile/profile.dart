import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xp_store/common/widgets/appbar/appbar.dart';
import 'package:xp_store/common/widgets/images/circular_image.dart';
import 'package:xp_store/common/widgets/texts/section_heading.dart';
import 'package:xp_store/features/personalization/controllers/user_controller.dart';
import 'package:xp_store/features/personalization/views/profile/widgets/change_name.dart';
import 'package:xp_store/features/personalization/views/profile/widgets/profile_menu.dart';
import 'package:xp_store/utils/constants/colors.dart';
import 'package:xp_store/utils/constants/image_strings.dart';
import 'package:xp_store/utils/constants/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: const XPAppBar(
        showBackArrow: true,
        title: Text('Perfil'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(XPSizes.defaultSpace),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  Obx(() {
                    final networkImage = controller.user.value.profilePicture;
                    final image =
                        networkImage.isNotEmpty ? networkImage : XPImages.user;
                    return controller.imageUploading.value
                        ? const SizedBox(
                            width: 30,
                            height: 30,
                            child: CircularProgressIndicator(
                                color: XPColors.black))
                        : XPCircularImage(
                            image: image,
                            width: 80,
                            height: 80,
                            isNetworkImage: networkImage.isNotEmpty);
                  }),
                  TextButton(
                      onPressed: () => controller.uploadUserProfilePicture(),
                      child: const Text('Alterar foto de perfil'))
                ],
              ),
            ),
            const SizedBox(height: XPSizes.spaceBtwItems / 2),
            const Divider(),
            const SizedBox(height: XPSizes.spaceBtwItems),
            const XPSectionHeading(
                title: "Informações do perfil", showActionButton: false),
            const SizedBox(height: XPSizes.spaceBtwItems),
            XPProfileMenu(
                onPressed: () {},
                title: 'ID do Usuário',
                value: controller.user.value.id),
            XPProfileMenu(
                onPressed: () => Get.to(() => const ChangeName()),
                title: 'Nome',
                value: controller.user.value.fullName),
            XPProfileMenu(
                onPressed: () {},
                title: 'Nome de Usuário',
                value: controller.user.value.username),
            XPProfileMenu(
                onPressed: () {},
                title: 'E-mail',
                value: controller.user.value.email),
            XPProfileMenu(
                onPressed: () {},
                title: 'Telefone',
                value: controller.user.value.phoneNumber),
            XPProfileMenu(
                onPressed: () {}, title: 'Data de Nasc.', value: '01/01/2001'),
            Center(
              child: TextButton(
                  onPressed: () => controller.deleteAccountWarningPopup(),
                  child: const Text(
                    'Deletar Conta',
                    style: TextStyle(color: Colors.red),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
