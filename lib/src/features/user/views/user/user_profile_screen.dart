import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:atlas_coins/src/components/app_bar_app.dart';
import 'package:atlas_coins/src/components/base_structure.dart';
import 'package:atlas_coins/src/features/auth/controller/auth_controller.dart';
import 'package:atlas_coins/src/features/user/views/user/components/user_details.dart';
import 'package:atlas_coins/src/features/user/views/user/components/user_options.dart';
import 'package:atlas_coins/src/features/transaction/controller/transaction_controller.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  final authController = Get.find<AuthController>();
  final trasactionController = Get.find<TransactionController>();

  @override
  Widget build(BuildContext context) {
    return BaseStructure(
      child: SingleChildScrollView(
        child: Hero(
          tag: "Hero",
          child: Column(
            children: [
              AppBarApp(
                onPressed: () => Get.off(
                  trasactionController.navigatePageView(0),
                ),
                title: "Perfil",
              ),
              UserDetails(authController: authController),
              const UserOptions(),
            ],
          ),
        ),
      ),
    );
  }
}
