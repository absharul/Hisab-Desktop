import 'dart:developer';
import 'dart:io';

import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hisab/database/app_database.dart';
import 'package:hisab/main.dart';
import 'package:hisab/routes/route.dart';
import 'package:path_provider/path_provider.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:path/path.dart' as p;

class ScreenFirmListing extends StatelessWidget {
  const ScreenFirmListing({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<List<Firm>>(
        stream: database!.watchAllFirms(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final firms = snapshot.data ?? [];

          return ListView.builder(
            itemCount: firms.length,
            itemBuilder: (context, index) {
              final task = firms[index];

              return ListTile(
                title: Text(task.name),
              );
            },
          );
        },
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
                      try {
                        final newFirm = FirmsCompanion(
                          name: drift.Value(nameController.text),
                          address: const drift.Value('Kuch toh hai'),
                        );
                        database!.insertFirm(newFirm);
                        router.pop();
                      } catch (e) {
                        log("Error" + e.toString());
                      }
                    },
                    child: const Text("Add"),
                  )
                ],
              ),
            ),
          );
        });
  }

  Future<void> deleteDatabase() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    if (await file.exists()) {
      await file.delete();
    }
  }
}
