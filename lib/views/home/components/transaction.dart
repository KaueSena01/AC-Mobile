import 'package:atlas_coins/theme/colors_theme.dart';
import 'package:flutter/material.dart';

class Transaction extends StatelessWidget { 
  
  const Transaction({ 
    Key? key 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 10),
                width: 45.0,
                height: 45.0,
                decoration: const BoxDecoration(
                color: primaryColor,
                shape: BoxShape.circle)
              ),
              Positioned(
                top: 15,
                left: 11,
                child: Column(
                  children: const [
                    Text('20', style: TextStyle(
                      color: ligthColor,  
                      fontSize: 13,
                      fontWeight: FontWeight.w500
                      )
                    ),
                    Text('Dez', style: TextStyle(
                      color: ligthColor,  
                      fontSize: 13,
                      fontWeight: FontWeight.w500
                      )
                    )
                  ],
                ),
              ) 
            ],
          ),
          Expanded(
            child: Stack(
              children: [
                const Card(
                  elevation: 0,
                  color: greyColor,
                  margin: EdgeInsets.only(left: 15),
                  child: ExpansionTile(
                    initiallyExpanded: false,
                    iconColor: primaryColor,
                    collapsedIconColor: primaryColor,
                    title: Text('Salário', style: TextStyle(
                      color: primaryColor,
                      fontSize: 17,
                      fontWeight: FontWeight.w600)
                    ),
                    children: [
                      ListTile(
                        title: Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry standard'),
                      ),
                      ListTile(
                        title: Text('10/20/2022'),
                      )
                    ],
                    subtitle: Text.rich(
                      TextSpan(
                        style: TextStyle(
                          fontSize: 15,
                          color: depositColor
                        ),
                        children: [
                          TextSpan(text: 'Depósito: ', style: TextStyle(
                            fontWeight: FontWeight.w500
                          )),
                          TextSpan(text: 'R\$ +60.00'),
                        ]
                      )
                    )
                  ),
                ),
                Positioned(
                  top: 25,
                  left: 10,
                  child: Image.asset(
                    'assets/icons/deposit.png',
                    width: 12,
                    height: 12,
                  )
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}