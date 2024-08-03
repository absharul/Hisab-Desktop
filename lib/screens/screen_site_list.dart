import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:hisab/database/app_database.dart';
import 'package:hisab/main.dart';
import 'package:hisab/models/model_dropdown.dart';
import 'package:hisab/routes/route.dart';
import 'package:hisab/screens/menu.dart';
import 'package:hisab/screens/screen_site_details.dart';
import 'package:hisab/screens/widgets/widget_dropdown.dart';
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
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (ctx) => const Menu()));
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 16.0),
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors
                        .grey[200], // Light grey background for differentiation
                    border: Border.all(
                        color: Colors.blue,
                        width: 0.5), // Blue border for differentiation
                    borderRadius:
                        BorderRadius.circular(4.0), // Slightly rounded corners
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

    ModelDropdown? firm;

    return showDialog(
        context: context,
        builder: (ctx) {
          return Dialog(
            child: Container(
              width: 200,
              height: 250,
              padding: const EdgeInsets.all(10),
              color: Colors.white,
              child: Column(
                children: [
                  const Text("Add Sites"),
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
                  WidgetDropdown(
                      placeHolder: "Select",
                      selectedValue: ModelDropdown(id: 0, name: "Firm"),
                      onChanged: (value) {
                        firmNameController.text = value.name;
                        firm = value;
                      }),
                  ElevatedButton(
                    onPressed: () async {
                      try {
                        if (firm != null) {
                          final site = SitesCompanion(
                            name: drift.Value(nameController.text),
                            address: drift.Value(addressController.text),
                            firmId: drift.Value(firm!.id),
                          );
                          await siteController.create(site);
                          router.pop();
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
                  )
                ],
              ),
            ),
          );
        });
  }
}
