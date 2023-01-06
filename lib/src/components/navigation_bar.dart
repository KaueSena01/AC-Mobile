import 'package:atlas_coins/src/features/transaction/controller/transaction_controller.dart';
import 'package:atlas_coins/src/services/bottom_navigation_bar.dart';
import 'package:atlas_coins/src/theme/constants.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

Widget bottomNavigationBar(
  TransactionController transactionController,
  GlobalKey<CurvedNavigationBarState> key,
) {
  RxInt pageIndex = 0.obs;

  return CurvedNavigationBar(
    key: key,
    backgroundColor: cardBackgroundColor,
    color: backgroundColor,
    height: size60,
    buttonBackgroundColor: cardBackgroundColor,
    items: <Widget>[
      _item(
        transactionController,
        BottomNavigationBarOptions.home,
        BottomNavigationBarOptions.homeIndex,
      ),
      _item(
        transactionController,
        BottomNavigationBarOptions.money,
        BottomNavigationBarOptions.moneyIndex,
      ),
      _item(
        transactionController,
        BottomNavigationBarOptions.card,
        BottomNavigationBarOptions.cardIndex,
      ),
      _item(
        transactionController,
        BottomNavigationBarOptions.profile,
        BottomNavigationBarOptions.profileIndex,
      ),
    ],
    onTap: (index) {
      transactionController.navigatePageView(index);
      pageIndex.value = index;
    },
  );
}

Widget _item(
    TransactionController transactionController, String item, int? pageIndex) {
  return SizedBox(
    height: 30,
    width: 30,
    child: Padding(
      padding: const EdgeInsets.all(size05),
      child: SvgPicture.asset(
        transactionController.pageIndex.value == pageIndex
            ? "assets/icons/${item}_selected.svg"
            : "assets/icons/$item.svg",
        height: 10,
      ),
    ),
  );
}
