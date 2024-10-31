import 'package:flutter/material.dart';
import 'package:xp_store/common/widgets/images/circular_image.dart';
import 'package:xp_store/features/personalization/controllers/user_controller.dart';
import 'package:xp_store/utils/constants/colors.dart';
import 'package:xp_store/utils/constants/image_strings.dart';

class XPUserProfileTile extends StatelessWidget {
  const XPUserProfileTile({super.key, required this.onPressed});

  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return ListTile(
      leading: const XPCircularImage(
        image: XPImages.user,
        width: 50,
        height: 50,
        padding: 0,
      ),
      title: Text(
        controller.user.value.fullName,
        style: Theme.of(context)
            .textTheme
            .headlineSmall!
            .apply(color: XPColors.white),
      ),
      subtitle: Text(
        controller.user.value.email,
        style: Theme.of(context)
            .textTheme
            .bodyMedium!
            .apply(color: XPColors.white),
      ),
      trailing: IconButton(
          onPressed: onPressed,
          icon: const Icon(
            Icons.edit_outlined,
            color: XPColors.white,
          )),
    );
  }
}
