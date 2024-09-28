import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hisab/routes/route.dart';
import 'package:hisab/screens/menu_tabs/flats_tab.dart';
import 'package:hisab/screens/menu_tabs/transaction_tab.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../database/app_database.dart';
import 'menu_tabs/partner_tab.dart';

class ScreenSiteDetails extends StatelessWidget {
  final Site site;
  const ScreenSiteDetails({super.key, required this.site});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          site.name,
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => context.go('/'),
          icon: const Icon(Icons.arrow_back),
        ),
        actions: [
          InkWell(
            onTap: () {
              context.go("/analytic_page", extra: site);
            },
            child: const Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: Column(
                children: [
                  Icon(
                    Icons.analytics_outlined,
                    size: 20.0,
                  ),
                  Text(
                    "Analytics",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 50.0,
          )
        ],
      ),
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            TabBar(
              tabs: [
                Tab(
                    icon: Icon(
                      PhosphorIcons.buildingApartment(),
                      size: 32.0,
                      color: Colors.grey,
                    ),
                    text: 'Flats'),
                Tab(
                    icon: Icon(
                      PhosphorIcons.swap(),
                      size: 32.0,
                      color: Colors.grey,
                    ),
                    text: 'Transaction'),
                Tab(
                    icon: Icon(
                      PhosphorIcons.handshake(),
                      size: 32.0,
                      color: Colors.grey,
                    ),
                    text: 'Partner'),
              ],
              indicatorColor: const Color(0xFF4EA6B2),
              indicatorSize: TabBarIndicatorSize.tab,
              labelStyle: const TextStyle(fontSize: 16.0),
            ),
            Expanded(
              child: TabBarView(
                // children: [FlatsTab(), TransactionTab(site: site), PartnerTab(site:site)],
                children: [
                  FlatsTab(site: site),
                  TransactionTab(site: site),
                  PartnerTab(site: site)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
