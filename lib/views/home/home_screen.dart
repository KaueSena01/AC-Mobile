import 'package:atlas_coins/controllers/auth_controller.dart';
import 'package:atlas_coins/controllers/transaction_controller.dart';
import 'package:atlas_coins/services/utils/utils_services.dart';
import 'package:atlas_coins/theme/colors_theme.dart';
import 'package:atlas_coins/views/home/components/card_widget.dart';
import 'package:atlas_coins/views/home/components/transaction.dart';
import 'package:atlas_coins/views/transaction/transaction_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {

  const HomeScreen({ 
    Key? key
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  initState() {
    transactionController.getAllTransactions(); 
    super.initState(); 
  }

  final authController = Get.find<AuthController>();
  final transactionsController = Get.find<TransactionController>(); 

  final TransactionController transactionController = TransactionController();
  final UtilsServices utilsServices = UtilsServices();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return Scaffold(
      body: SizedBox(
        child: GetBuilder<TransactionController>(
          builder: (controller) {
            if(controller.allTransactions.isEmpty) {
              return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CardWidget(
                  controller: controller,
                  ), 
                ]
              );
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CardWidget(
                  controller: controller,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 80, bottom: 20),
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: const Text('Notas gerais', style: TextStyle(
                    color: primaryColor,  
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  )),
                ),
                  Expanded(
                    child: GetBuilder<TransactionController>(
                      builder: (controller) { 
                        if(controller.loading.value == true) {
                          return Container(
                            padding: const EdgeInsets.only(left: 15),
                            child: const Text("Carregando..."),
                          );
                        }
                          return Container( 
                            margin: const EdgeInsets.all(0),
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: ListView.builder(
                              padding: const EdgeInsets.all(0),
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemBuilder: (_, index) => Transaction(
                                transactionList: controller.allTransactions[index]
                              ),
                              itemCount: controller.allTransactions.length,
                            ),
                          );
                      }
                    ),
                  )  
              ]
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () { 
          Get.to(TransactionScreen());
        },
        backgroundColor: primaryColor,
        child: const Icon(Icons.attach_money),
      ),
    );
  }
}