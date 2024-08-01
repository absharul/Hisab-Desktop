import 'package:flutter/material.dart';
import 'package:hisab/screens/menu_tabs/flats_tab.dart';
import 'package:hisab/screens/menu_tabs/transaction_tab.dart';

import 'menu_tabs/partner_tab.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SITE 1",style: TextStyle(color: Colors.black),),
        centerTitle: true,
        backgroundColor: Color(0xFFE9E9E9),
      ),
      body: const DefaultTabController(
        length: 3,
        child: Column(
          children: [
            TabBar(
              tabs:  [
                Tab(text: 'Flats'),
                Tab(text: 'Transaction'),
                Tab(text: 'Partner'),
              ],
              indicatorColor: Color(0xFF4EA6B2),
              indicatorSize: TabBarIndicatorSize.tab,
              labelStyle: TextStyle(fontSize: 16.0),

            ),
            Expanded(
              child: TabBarView(
                children: [
                  FlatsTab(),
                  TransactionTab(),
                  PartnerTab()
                ],
              ),
            ),
          ],
        ),
      ),

    );
  }
}
