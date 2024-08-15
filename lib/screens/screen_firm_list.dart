import 'dart:developer';

import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:hisab/database/app_database.dart';
import 'package:hisab/utils/helper_functions.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
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
              final firm = firms[index];

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
                          firm.name,
                          style: const TextStyle(
                            fontFamily: 'Courier', // Old-school font
                            fontSize: 20.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          firm.address,
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
                    Column(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () {
                            _editFirmPressed(context, firm);
                          },
                        ),
                        const Text("Edit"),
                      ],
                    ),
                    const SizedBox(width: 100),
                    Column(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () async {
                            final confirm = await showDialog(
                              context: context,
                              builder: (ctx) => AlertDialog(
                                title: const Text('Delete Firm'),
                                content: const Text(
                                    'Are you sure you want to delete this firm?'),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.of(ctx).pop(false),
                                    child: const Text('Cancel'),
                                  ),
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.of(ctx).pop(true),
                                    child: const Text('Delete'),
                                  ),
                                ],
                              ),
                            );

                            if (confirm == true) {
                              try {
                                await firmController.delete(firm);
                                HFunction.showFlushBarSuccess(
                                  context: context,
                                  message: "Successfully deleted the firm",
                                );
                              } catch (error) {
                                HFunction.showFlushBarError(
                                  context: context,
                                  message: "Failed to delete the firm: $error",
                                );
                              }
                            }
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
    showDialog(
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
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () async {
                    try {
                      final newFirm = FirmsCompanion(
                        name: drift.Value(nameController.text),
                        address: drift.Value(addressController.text),
                      );
                      await firmController.create(newFirm);
                      Navigator.of(context).pop(); // Close the dialog
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
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _editFirmPressed(BuildContext context, Firm firm) {
    final nameController = TextEditingController(text: firm.name);
    final addressController = TextEditingController(text: firm.address);
    showDialog(
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
                const Text("Edit Firm"),
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
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () async {
                    print("Address Controller: ${addressController.text}");
                    print("Name: ${nameController.text}");
                    try {
                      final updatedFirm = firm.copyWith(
                        name: nameController.text,
                        address: addressController.text,
                      );
                      log(firm.toString());
                      await firmController.update(updatedFirm);
                      Navigator.of(context).pop(); // Close the dialog
                      HFunction.showFlushBarSuccess(
                        context: context,
                        message: "Successfully Updated the firm",
                      );
                    } catch (e) {
                      HFunction.showFlushBarError(
                          context: context, message: e.toString());
                    }
                  },
                  child: const Text("Update"),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
