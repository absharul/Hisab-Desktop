import 'package:circular_menu/circular_menu.dart';
import 'package:flutter/material.dart';

import '../routes/route.dart';

class ScreenSiteDetails extends StatelessWidget {
  const ScreenSiteDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Site Detail",style: TextStyle(color: Colors.black)),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Expanded(
            child: ListView.builder(
                itemCount: 20,
                itemBuilder: (ctx, index) {
                  return ListTile(
                    onTap: () {
                      router.push("/menu");
                    },
                    title: Text("Site $index"),
                    subtitle: Text("Address $index"),
                  );
                }),
          ),
        ),
        floatingActionButton: CircularMenu(
          alignment: Alignment.bottomRight,
          items: [
            CircularMenuItem(
              icon: Icons.home,
              onTap: () {},
              color: Colors.green,
              iconColor: Colors.white,
            ),
            CircularMenuItem(
              icon: Icons.search,
              onTap: () {},
              color: Colors.orange,
              iconColor: Colors.white,
            ),
            CircularMenuItem(
              icon: Icons.settings,
              onTap: () {},
              color: Colors.deepPurple,
              iconColor: Colors.white,
            ),
          ],
        ));
  }
}
