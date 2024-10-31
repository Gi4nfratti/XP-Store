import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xp_store/common/widgets/appbar/appbar.dart';
import 'package:xp_store/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:xp_store/common/widgets/list_tiles/settings_menu_tile.dart';
import 'package:xp_store/common/widgets/list_tiles/user_profile_tile.dart';
import 'package:xp_store/common/widgets/texts/section_heading.dart';
import 'package:xp_store/data/repositories/authentication/authentication_repository.dart';
import 'package:xp_store/features/personalization/views/address/address.dart';
import 'package:xp_store/features/personalization/views/profile/profile.dart';
import 'package:xp_store/features/shop/views/order/order.dart';
import 'package:xp_store/utils/constants/colors.dart';
import 'package:xp_store/utils/constants/sizes.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            XPPrimaryHeaderContainer(
                child: Column(
              children: [
                XPAppBar(
                  title: Text(
                    'Minha Conta',
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .apply(color: XPColors.white),
                  ),
                ),
                XPUserProfileTile(
                    onPressed: () => Get.to(() => const ProfileScreen())),
                const SizedBox(height: XPSizes.spaceBtwSections),
              ],
            )),
            Padding(
              padding: const EdgeInsets.all(XPSizes.defaultSpace),
              child: Column(
                children: [
                  const XPSectionHeading(
                    title: 'Configurações da Conta',
                    showActionButton: false,
                  ),
                  const SizedBox(height: XPSizes.spaceBtwItems),
                  XPSettingsMenuTile(
                    icon: Icons.home_outlined,
                    title: 'Meu Endereço',
                    subtitle: 'Configure o endereço de entrega',
                    onTap: () => Get.to(() => const UserAddressView()),
                  ),
                  XPSettingsMenuTile(
                    icon: Icons.shopping_cart_outlined,
                    title: 'Meu Carrinho',
                    subtitle: 'Adicione e remova produtos do carrinho',
                    onTap: () {},
                  ),
                  XPSettingsMenuTile(
                    icon: Icons.shopping_bag_outlined,
                    title: 'Meus Pedidos',
                    subtitle: 'Veja todos os seus pedidos',
                    onTap: () => Get.to(() => const OrderView()),
                  ),
                  XPSettingsMenuTile(
                    icon: Icons.attach_money_outlined,
                    title: 'Conta Bancária',
                    subtitle: 'Veja seus limites e saldos',
                    onTap: () {},
                  ),
                  XPSettingsMenuTile(
                    icon: Icons.discount_outlined,
                    title: 'Meus Cupons',
                    subtitle: 'Veja a lista de cupons de desconto',
                    onTap: () {},
                  ),
                  XPSettingsMenuTile(
                    icon: Icons.notification_add_outlined,
                    title: 'Notificações',
                    subtitle: 'Configure suas notificações',
                    onTap: () {},
                  ),
                  XPSettingsMenuTile(
                    icon: Icons.privacy_tip_outlined,
                    title: 'Privacidade da Conta',
                    subtitle: 'Gerencie suas contas',
                    onTap: () {},
                  ),
                  const SizedBox(height: XPSizes.spaceBtwSections),
                  const XPSectionHeading(
                      title: 'Configurações do App', showActionButton: false),
                  const SizedBox(height: XPSizes.spaceBtwItems),
                  const XPSettingsMenuTile(
                      icon: Icons.upload_file_outlined,
                      title: "Carregar Dados",
                      subtitle: 'Carregue arquivos para o seu Banco de Dados'),
                  XPSettingsMenuTile(
                    icon: Icons.location_on_outlined,
                    title: "Geolocalização",
                    subtitle:
                        'Configure suas recomendações baseadas na sua localização',
                    trailing: Switch(value: true, onChanged: (value) {}),
                  ),
                  XPSettingsMenuTile(
                    icon: Icons.security_outlined,
                    title: "Modo Seguro",
                    subtitle: 'Ative o modo seguro',
                    trailing: Switch(value: true, onChanged: (value) {}),
                  ),
                  XPSettingsMenuTile(
                    icon: Icons.image,
                    title: "Qualidade das imagens em HD",
                    subtitle:
                        'Configure para que as imagens esteja em alta resolução',
                    trailing: Switch(value: true, onChanged: (value) {}),
                  ),
                  const SizedBox(height: XPSizes.spaceBtwSections),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                        onPressed: () =>
                            AuthenticationRepository.instance.logout(),
                        child: const Text('Logout')),
                  ),
                  const SizedBox(height: XPSizes.spaceBtwSections + 2.5),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
