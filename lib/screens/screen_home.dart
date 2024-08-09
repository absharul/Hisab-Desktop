import 'package:flutter/material.dart';
import 'package:hisab/screens/screen_category_list.dart';
import 'package:hisab/screens/screen_firm_list.dart';
import 'package:hisab/screens/screen_site_list.dart';
import 'package:hisab/screens/screen_sub_category_list.dart';
import 'package:hisab/screens/screen_user_list.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome>
    with SingleTickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    tabController = TabController(length: 5, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Hisab',),
          ),
        body: Column(
          children: [
            TabBar(controller: tabController, tabs: [
              Tab(
                icon: Icon(
                  PhosphorIcons.building(),
                  size: 24,
                ),
                text: "Firms",
              ),
              Tab(
                icon: Icon(
                  PhosphorIcons.building(),
                  size: 24,
                ),
                text: "Sites",
              ),
              Tab(
                icon: Icon(
                  PhosphorIcons.building(),
                  size: 24,
                ),
                text: "Categories",
              ),
              Tab(
                icon: Icon(
                  PhosphorIcons.building(),
                  size: 24,
                ),
                text: "SubCategories",
              ),
              Tab(
                icon: Icon(
                  PhosphorIcons.building(),
                  size: 24,
                ),
                text: "Users",
              ),
            ]),
            Expanded(
                child: TabBarView(
              controller: tabController,
              children: const [
                ScreenFirmListing(),
                ScreenSiteListing(),
                ScreenCategoryList(),
                ScreenSubCategoryList(),
                ScreenUserListing()
              ],
            ))
          ],
        ));
  }
}
