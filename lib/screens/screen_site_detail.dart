import 'package:flutter/material.dart';
import 'package:hisab/screens/menu_tabs/flats_tab.dart';
import 'package:hisab/screens/menu_tabs/transaction_tab.dart';

import '../database/app_database.dart';
import 'menu_tabs/partner_tab.dart';

class ScreenSiteDetails extends StatelessWidget {
  final Site site;
  const ScreenSiteDetails({super.key, required this.site});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          // site.name,
          "Nashik",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body:  DefaultTabController(
        length: 3,
        child: Column(
          children: [
            const TabBar(
              tabs: [
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
                // children: [FlatsTab(), TransactionTab(site: site), PartnerTab(site:site)],
                children: [const FlatsTab(),TransactionTab(site: site,), PartnerTab(site: site)],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
