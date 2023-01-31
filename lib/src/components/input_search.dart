import 'package:atlas_coins/src/features/transaction/controller/transaction_controller.dart';
import 'package:flutter/material.dart';

import 'package:atlas_coins/src/theme/app_theme.dart';
import 'package:atlas_coins/src/theme/constants.dart';
import 'package:get/get.dart';

class InputSearch extends StatelessWidget {
  InputSearch({
    Key? key,
    required this.description,
  }) : super(key: key);

  final String description;
  final searchController = TextEditingController();
  String title = "";

  @override
  Widget build(BuildContext context) {
    return GetX<TransactionController>(
      builder: (controller) {
        return Container(
          height: size50,
          padding: const EdgeInsets.symmetric(horizontal: size15),
          child: TextFormField(
            keyboardType: TextInputType.text,
            maxLines: 1,
            style: AppTheme.lightText.headlineSmall!.apply(
              color: whiteColor,
            ),
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.fromLTRB(size20, size00, size20, size00),
              filled: true,
              fillColor: cardBackgroundColor,
              isDense: false,
              hintText: description,
              hintStyle: AppTheme.lightText.headlineSmall!.apply(
                color: labelColor,
              ),
              suffixIcon: controller.searchTitle.value.isNotEmpty
                  ? GestureDetector(
                      child: const Icon(
                        Icons.search,
                        color: primaryColor,
                        size: size20,
                      ),
                      onTap: () {
                        controller.findAllTransactionsController(title);
                        searchController.clear();
                        controller.searchTitle.value = '';
                        FocusScope.of(context).unfocus();
                      },
                    )
                  : null,
              suffixIconColor: backgroundColor,
              border: const OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: primaryColor,
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(size30),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: cardBackgroundColor,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(size30),
              ),
            ),
            controller: searchController,
            onChanged: (value) {
              controller.searchTitle.value = value;
              title = value;
            },
          ),
        );
      },
    );
  }
}
