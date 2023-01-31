import 'package:flutter/material.dart';

import 'package:atlas_coins/src/utils/settings.dart';
import 'package:atlas_coins/src/theme/app_theme.dart';
import 'package:atlas_coins/src/theme/constants.dart';
import 'package:atlas_coins/src/components/button_widget.dart';
import 'package:atlas_coins/src/features/auth/controller/auth_controller.dart';
import 'package:atlas_coins/src/features/user/views/user/components/user_image.dart';

class UserDetails extends StatelessWidget {
  const UserDetails({
    Key? key,
    required this.authController,
  }) : super(key: key);

  final AuthController authController;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        UserImage(
          marginBottom: size20,
          authController: authController,
        ),
        Text(
          authController.authModel.name!,
          style: AppTheme.lightText.titleLarge!.apply(
            color: whiteColor,
          ),
        ),
        Text(
          authController.authModel.email!,
          style: AppTheme.lightText.labelSmall!.apply(
            color: labelColor,
          ),
        ),
        ButtonWidget(
          margin: const EdgeInsets.only(top: size20, bottom: size10),
          label: ButtonLabel.editProfile,
          onPressed: () {},
        ),
        Container(
          margin:
              const EdgeInsets.symmetric(vertical: size20, horizontal: size15),
          height: 0.25,
          width: size.width - size20,
          color: lightColor,
        ),
      ],
    );
  }
}
