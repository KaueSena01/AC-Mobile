import 'package:atlas_coins/src/components/base_structure.dart';
import 'package:atlas_coins/src/theme/app_theme.dart';
import 'package:atlas_coins/src/theme/constants.dart';
import 'package:atlas_coins/src/utils/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseStructure(
      onWillPop: () async {
        SystemNavigator.pop();
        return false;
      },
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: SvgPicture.asset(
                  AppInformation.appLogoPath,
                  height: size70,
                  width: size70,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(size20),
              child: Text(
                "By Kauê Sena",
                style: AppTheme.lightText.headlineSmall!.apply(
                  color: primaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
