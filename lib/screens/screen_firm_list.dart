import 'dart:io';
import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:hisab/database/app_database.dart';
import 'package:hisab/routes/route.dart';
import 'package:hisab/utils/helper_functions.dart';
import 'package:path_provider/path_provider.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:path/path.dart' as p;
import '../controllers/firm_controller.dart';

class ScreenFirmListing extends StatelessWidget {
  const ScreenFirmListing({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<List<Firm>>(
        stream: firmController.watchAll(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final firms = snapshot.data ?? [];

          return ListView.builder(
            itemCount: firms.length,
            itemBuilder: (context, index) {
              final task = firms[index];

              return Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black, width: 0.5),
                  borderRadius: BorderRadius.circular(
                      0), // No rounded corners for old-school look
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          task.name,
                          style: const TextStyle(
                            fontFamily: 'Courier', // Old-school font
                            fontSize: 20.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          task.address,
                          style: const TextStyle(
                            fontFamily: 'Courier', // Old-school font
                            fontSize: 16.0,
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                    const Expanded(child: SizedBox()),
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {
                        // Add your edit functionality here
                      },
                    ),
                    const Text("Edit"),
                    const SizedBox(
                      width: 100,
                    ),
                    Column(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            // Add your delete functionality here
                            deleteDatabase();
                          },
                        ),
                        const Text("Delete"),
                      ],
                    ),
                  ],
                ),
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
    final addressController = TextEditingController();
    return showDialog(
        context: context,
        builder: (ctx) {
          return Dialog(
            child: Container(
              width: 200,
              height: 200,
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
                  TextField(
                    controller: addressController,
                    decoration: const InputDecoration(hintText: "Address"),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      try {
                        final newFirm = FirmsCompanion(
                          name: drift.Value(nameController.text),
                          address: drift.Value(addressController.text),
                        );
                        await firmController.create(newFirm);
                        router.pop();
                        HFunction.showFlushBarSuccess(
                          context: context,
                          message: "Successfully Added the firm",
                        );
                      } catch (e) {
                        HFunction.showFlushBarError(
                            context: context, message: e.toString());
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
