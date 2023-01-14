import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:atlas_coins/src/theme/app_theme.dart';
import 'package:atlas_coins/src/theme/constants.dart';
import 'package:atlas_coins/src/features/auth/controller/auth_controller.dart';

class UserOptions extends StatelessWidget {
  const UserOptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final AuthController authController = AuthController();

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: size15),
      child: Column(
        children: [
          _userOptions(
            "Configurações",
            "assets/icons/settings.svg",
            () {},
          ),
          _userOptions(
            "Sobre",
            "assets/icons/about.svg",
            () {},
          ),
          _userOptions(
            "Ajuda",
            "assets/icons/help.svg",
            () {},
          ),
          Container(
            margin: const EdgeInsets.only(top: size20, bottom: size10),
            height: 0.25,
            width: size.width - size15,
            color: lightColor,
          ),
          InkWell(
            onTap: () => authController.signOutController(),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: size10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: size20),
                    height: size35,
                    width: size35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(size20),
                      color: cardBackgroundColor,
                    ),
                    child: const Icon(
                      Icons.arrow_back,
                      size: size30,
                      color: expenseColor,
                    ),
                  ),
                  Text(
                    "Sair",
                    style: AppTheme.lightText.headlineSmall!.apply(
                      color: expenseColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _userOptions(String title, String asset, Function onPressed) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: size10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(right: size15),
                  height: size35,
                  width: size35,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(size20),
                    color: cardBackgroundColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(size05),
                    child: SvgPicture.asset(asset),
                  ),
                ),
                Text(
                  title,
                  style: AppTheme.lightText.headlineSmall!.apply(
                    color: whiteColor,
                  ),
                ),
              ],
            ),
            Container(
              height: size35,
              width: size35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(size20),
                color: cardBackgroundColor,
              ),
              child: const Icon(
                Icons.arrow_forward_ios_sharp,
                size: size25,
                color: tertiaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
