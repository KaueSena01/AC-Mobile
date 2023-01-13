import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:atlas_coins/src/theme/constants.dart';

class BaseStructure extends StatelessWidget {
  const BaseStructure({
    Key? key,
    required this.child,
    this.onWillPop,
    this.bottomNavigationBar,
  }) : super(key: key);

  final Widget child;
  final Widget? bottomNavigationBar;
  final Future<bool> Function()? onWillPop;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop ??
          () async {
            Get.back();
            return true;
          },
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: SafeArea(
          child: child,
        ),
        bottomNavigationBar: bottomNavigationBar,
      ),
    );
  }
}
