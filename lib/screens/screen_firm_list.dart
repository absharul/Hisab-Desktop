import 'dart:developer';

import 'package:flutter/material.dart';
// import 'package:hisab/models/model_firm.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ScreenFirmListing extends StatelessWidget {
  const ScreenFirmListing({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
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
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => addFirmPressed(context),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(50))),
        child: Icon(
          PhosphorIcons.plus(),
          color: Colors.white,
        ),
      ),
    );
  }

  void addFirmPressed(BuildContext context) async {
    final nameController = TextEditingController();
    return showDialog(
        context: context,
        builder: (ctx) {
          return Dialog(
            child: Container(
              width: 200,
              height: 150,
              padding: const EdgeInsets.all(10),
              color: Colors.white,
              child: Column(
                children: [
                  const Text("Add Firm"),
                  const SizedBox(height: 10),
                  TextField(
                    controller: nameController,
                    decoration: const InputDecoration(hintText: "Name"),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      // final firm = ModelFirm();
                      // firm.name = nameController.text;
                    },
                    child: const Text("Add"),
                  )
                ],
              ),
            ),
          );
        });
  }
}
