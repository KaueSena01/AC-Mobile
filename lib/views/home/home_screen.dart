import 'package:atlas_coins/controllers/auth_controller.dart';
import 'package:atlas_coins/controllers/transaction_controller.dart';
import 'package:atlas_coins/theme/colors_theme.dart';
import 'package:atlas_coins/views/home/components/transaction.dart';
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

  final authController = Get.find<AuthController>();
  final getAllTransactions = Get.find<TransactionController>();

  final TransactionController transactionController = TransactionController();
  
  @override
  initState() {
    super.initState(); 

    transactionController.getAllTransactions();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              clipBehavior:  Clip.none,
              alignment: AlignmentDirectional.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 180,
                  color: primaryColor,
                ),
                Positioned(
                  top: 70,
                  child: Container( 
                    width: MediaQuery.of(context).size.width -20,
                    decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: const LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      stops: [
                        0.1,
                        0.9,
                      ],
                      colors: [
                        tertiaryColor,
                        secondaryColor, 
                      ],
                    )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 5, 10, 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              'assets/images/logo_transparent.png',
                              height: 75,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text('Saldo total: ',style: TextStyle(
                                  color: Colors.white,  
                                  fontSize: 18,
                                  fontWeight: FontWeight.w300
                                  )
                                ),
                                Text('R\$ 2000.00', style: TextStyle(
                                  color: Colors.white,  
                                  fontSize: 24,
                                  fontWeight: FontWeight.w800,
                                  decoration: TextDecoration.underline
                                  )
                                ),
                              ],
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5, left: 10),
                          child: Text(authController.auth.user!.name!, style: const TextStyle(
                            color: Colors.white,  
                            fontSize: 22,
                            fontWeight: FontWeight.w400
                            )
                          )
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 25, left: 10),
                          child: Text('Despesa', style: TextStyle(
                            color: Colors.white,  
                            fontSize: 15,
                            fontWeight: FontWeight.w300
                            )
                          )
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, bottom: 5),
                          child: Row(
                            children: [
                              Image.asset(
                              'assets/icons/expense.png',
                              width: 12,
                              height: 12,
                            ),
                            const SizedBox(width: 5),
                            const Text('R\$ -500.00', style: TextStyle(
                                color: Colors.white,  
                                fontSize: 15,
                                fontWeight: FontWeight.w500
                                )
                              )
                            ],
                          )
                        ),
                      ],
                    ),
                  ),
                ))
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 90),
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Notas gerais', style: TextStyle(
                    color: primaryColor,  
                    fontSize: 15,
                    fontWeight: FontWeight.w500
                  )),
                  Transaction(),
                  Transaction(),
                  Transaction(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}