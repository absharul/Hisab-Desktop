import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ScreenSiteListing extends StatelessWidget {
  const ScreenSiteListing({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Firms"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                icon: Row(
                  children: [
                    Icon(PhosphorIcons.plus()),
                    const SizedBox(width: 5),
                    const Text("Add Firm")
                  ],
                ),
                onPressed: () {},
              )
            ],
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("Firm $index"),
                  subtitle: Text("Address $index"),
                  trailing: IconButton(
                    icon: Icon(PhosphorIcons.chair()),
                    onPressed: () {},
                  ),
                );
              },
            ),
          )
        ]),
      ),
    );
  }
}
