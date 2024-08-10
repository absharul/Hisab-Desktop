import 'dart:developer';
import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:hisab/database/app_database.dart';
import 'package:hisab/main.dart';
import 'package:hisab/routes/route.dart';
import 'package:hisab/utils/helper_functions.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ScreenCategoryList extends StatelessWidget {
  const ScreenCategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<List<Category>>(
        stream: database.watchCategory(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final sites = snapshot.data ?? [];

          return ListView.builder(
            itemCount: sites.length,
            itemBuilder: (context, index) {
              final site = sites[index];

              return InkWell(
                // onTap: () {
                //   Navigator.of(context).push(MaterialPageRoute(
                //       builder: (ctx) => ScreenSiteDetails(
                //             site: site,
                //           )));
                // },
                child: Container(
                  margin: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 16.0),
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white, // Light grey background for differentiation
                    border: Border.all(
                        color: Colors.black,
                        width: 0.5), // Blue border for differentiation
                    borderRadius:
                        BorderRadius.circular(0), // Slightly rounded corners
                  ),
                  child: Row(
                    children: [
                      Icon(
                        PhosphorIcons.stack(),
                      ),// Icon to make it look different
                      const SizedBox(width: 10),
                      Text(
                        site.name,
                        style: const TextStyle(
                          fontFamily: 'Courier', // Old-school font
                          fontSize: 16.0,
                          color: Colors.black,
                        ),
                      ),
                      const Expanded(child: SizedBox()),
                      Column(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () {
                              // Add your edit functionality here
                            },
                          ),
                          const Text("Edit"),
                        ],
                      ),
                      const SizedBox(
                        width: 100,
                      ),
                      Column(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              // Add your delete functionality here
                            },
                          ),
                          const Text("Delete"),
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => addSitePressed(context),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(50))),
        child: Icon(
          PhosphorIcons.plus(),
          color: Colors.white,
        ),
      ),
    );
  }

  void addSitePressed(BuildContext context) async {
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
                  const Text("Add Category"),
                  const SizedBox(height: 10),
                  TextField(
                    controller: nameController,
                    decoration: const InputDecoration(hintText: "Name"),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () async {
                      try {
                        final site = CategoriesCompanion(
                          name: drift.Value(nameController.text),
                        );
                        await database.insertCategory(site);
                        router.pop();
                        HFunction.showFlushBarSuccess(
                          context: context,
                          message: "Successfully Added the site",
                        );
                      } catch (error) {
                        log(error.toString());
                        HFunction.showFlushBarError(
                            context: context, message: error.toString());
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
}
