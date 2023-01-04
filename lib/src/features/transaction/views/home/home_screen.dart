import 'package:atlas_coins/src/components/input_search.dart';
import 'package:atlas_coins/src/features/transaction/controller/transaction_controller.dart';
import 'package:atlas_coins/src/features/transaction/views/home/components/balance.dart';
import 'package:atlas_coins/src/features/transaction/views/home/components/no_transactions.dart';
import 'package:atlas_coins/src/features/transaction/views/home/components/transactions.dart';
import 'package:atlas_coins/src/features/transaction/views/home/components/user_presentation.dart';
import 'package:atlas_coins/src/features/auth/controller/auth_controller.dart';
import 'package:atlas_coins/src/theme/constants.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../components/navigation_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animation;
  final menuIsOpen = ValueNotifier<bool>(false);

  final authController = Get.find<AuthController>();
  final transactionController = Get.find<TransactionController>();

  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        transactionController.navigatePageView(0);
        SystemNavigator.pop();
        return false;
      },
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: SafeArea(
          child: ScrollConfiguration(
            behavior: const ScrollBehavior().copyWith(overscroll: false),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        UserPresentation(authController: authController),
                        Balance(transactionController: transactionController),
                        const InputSearch(description: "Pesquisar por..."),
                        GetBuilder<TransactionController>(
                          builder: (_) {
                            return _.allTransactions.isNotEmpty
                                ? Transactions(
                                    transactionController:
                                        transactionController,
                                  )
                                : NoTransactions(
                                    transactionController:
                                        transactionController,
                                  );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: GetBuilder<TransactionController>(
          builder: (controller) {
            return bottomNavigationBar(
              controller,
              _bottomNavigationKey,
            );
          },
        ),
      ),
    );
  }
}
