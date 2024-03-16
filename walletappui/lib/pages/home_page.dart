// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:walletappui/utils/my_button.dart';
import 'package:walletappui/utils/my_card.dart';
import 'package:walletappui/utils/my_list_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //pagecontroller
  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark),
      child: Scaffold(
          backgroundColor: Colors.grey[300],
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            backgroundColor: Colors.pink,
            foregroundColor: Colors.white,
            child: Icon(
              Icons.monetization_on,
              size: 32,
            ),
            shape: CircleBorder(
              side: BorderSide(color: Colors.pink),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomAppBar(
            color: Colors.grey.shade100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.home,
                    size: 40,
                    color: Colors.pink.shade200,
                  ),
                ),
                Container(
                  width: 40,
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.settings,
                    size: 40,
                  ),
                )
              ],
            ),
          ),
          body: SafeArea(
            child: Column(
              children: [
                // app bar
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: [
                        Text(
                          'My',
                          style: TextStyle(
                              fontSize: 28, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          ' Cards',
                          style: TextStyle(fontSize: 28),
                        ),
                      ]),
                      // plus button
                      Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: Colors.grey, shape: BoxShape.circle),
                          child: Icon(Icons.add)),
                    ],
                  ),
                ),
                // cards
                SizedBox(height: 25),
                Container(
                  height: 200,
                  child: PageView(
                      scrollDirection: Axis.horizontal,
                      controller: _controller,
                      children: [
                        MyCard(
                            balance: 5329.57,
                            cardNumber: 34567890,
                            expiryMonth: 10,
                            expiryYear: 25,
                            color: Colors.yellow.shade700),
                        MyCard(
                            balance: 1000,
                            cardNumber: 76543210,
                            expiryMonth: 1,
                            expiryYear: 27,
                            color: Colors.green.shade800),
                        MyCard(
                            balance: 3650,
                            cardNumber: 95175312,
                            expiryMonth: 11,
                            expiryYear: 25,
                            color: Colors.blue.shade500),
                      ]),
                ),
                SizedBox(height: 15),
                SmoothPageIndicator(
                  controller: _controller,
                  count: 3,
                  effect:
                      ExpandingDotsEffect(activeDotColor: Colors.grey.shade800),
                ),
                SizedBox(height: 40),

                // 3 buttons -> send + pay + bills
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //send button
                      MyButton(
                        iconImagePath: 'lib/icons/send-money.png',
                        buttonText: 'Enviar',
                      ),
                      //pay button
                      MyButton(
                        iconImagePath: 'lib/icons/credit-cards.png',
                        buttonText: 'Pagar',
                      ),
                      // bills button
                      MyButton(
                        iconImagePath: 'lib/icons/bill.png',
                        buttonText: 'Contas',
                      )
                    ],
                  ),
                ),
                SizedBox(height: 40),

                // column -> stats + transactions
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: Column(
                    children: [
                      MyListTile(
                        iconImagePath: 'lib/icons/statistics.png',
                        tileName: 'Estatísticas',
                        tielSubtname: 'Pagamentos e Recebimentos',
                      ),
                      MyListTile(
                        iconImagePath: 'lib/icons/transaction.png',
                        tileName: 'Transações',
                        tielSubtname: 'Histórico de Transações',
                      ),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
