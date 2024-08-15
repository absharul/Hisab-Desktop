import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:hisab/database/app_database.dart';
import 'package:hisab/models/model_dropdown.dart';
import 'package:hisab/screens/screen_site_detail.dart';
import 'package:hisab/utils/helper_functions.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../controllers/site_controller.dart';

class ScreenSiteListing extends StatelessWidget {
  const ScreenSiteListing({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<List<Site>>(
        stream: siteController.watchAll(),
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
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (ctx) => ScreenSiteDetails(
                            site: site,
                          )));
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 16.0),
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black, width: 0.5),
                    borderRadius: BorderRadius.circular(0), // Slightly rounded corners
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.location_on,
                          color: Colors.blue), // Icon to make it look different
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
                            onPressed: () async {
                              final confirm = await showDialog(
                                context: context,
                                builder: (ctx) => AlertDialog(
                                  title: const Text('Delete Site'),
                                  content: const Text('Are you sure you want to delete this site?'),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.of(ctx).pop(false),
                                      child: const Text('Cancel'),
                                    ),
                                    TextButton(
                                      onPressed: () => Navigator.of(ctx).pop(true),
                                      child: const Text('Delete'),
                                    ),
                                  ],
                                ),
                              );

                              if (confirm == true) {
                                try {
                                  await siteController.delete(site);
                                  HFunction.showFlushBarSuccess(
                                    context: context,
                                    message: "Successfully deleted the site",
                                  );
                                } catch (error) {
                                  HFunction.showFlushBarError(
                                    context: context,
                                    message: "Failed to delete the site: $error",
                                  );
                                }
                              }
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
    final addressController = TextEditingController();
    final firmNameController = TextEditingController();

    ModelDropdown? selectedFirm;
    final List<ModelDropdown> firms = [
      ModelDropdown(id: 1, name: "Firm A"),
      ModelDropdown(id: 2, name: "Firm B"),
      ModelDropdown(id: 3, name: "Firm C"),
    ];

    return showDialog(
      context: context,
      builder: (ctx) {
        return Dialog(
          child: Container(
            width: 300, // Adjusted width for better UI
            padding: const EdgeInsets.all(16),
            color: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.min, // Wrap content based on its size
              children: [
                const Text(
                  "Add Site",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: "Name",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: addressController,
                  decoration: const InputDecoration(
                    labelText: "Address",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                DropdownButtonFormField<ModelDropdown>(
                  value: selectedFirm,
                  decoration: const InputDecoration(
                    labelText: "Select Firm",
                    border: OutlineInputBorder(),
                  ),
                  items: firms.map((ModelDropdown firm) {
                    return DropdownMenuItem<ModelDropdown>(
                      value: firm,
                      child: Text(firm.name),
                    );
                  }).toList(),
                  onChanged: (value) {
                    if (value != null) {
                      selectedFirm = value;
                      firmNameController.text = value.name;
                    }
                  },
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop(); // Close the dialog
                      },
                      child: const Text("Cancel"),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        try {
                          if (selectedFirm != null) {
                            final site = SitesCompanion(
                              name: drift.Value(nameController.text),
                              address: drift.Value(addressController.text),
                              firmId: drift.Value(selectedFirm!.id),
                            );
                            await siteController.create(site);
                            Navigator.of(context).pop(); // Close the dialog
                            HFunction.showFlushBarSuccess(
                              context: context,
                              message: "Successfully Added the site",
                            );
                          }
                        } catch (error) {
                          HFunction.showFlushBarError(
                              context: context, message: error.toString());
                        }
                      },
                      child: const Text("Add"),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

}
