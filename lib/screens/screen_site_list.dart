import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:hisab/database/app_database.dart';
import 'package:hisab/main.dart';
import 'package:hisab/models/model_dropdown.dart';
import 'package:hisab/routes/route.dart';
import 'package:hisab/screens/widgets/widget_dropdown.dart';
import 'package:hisab/utils/helper_functions.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ScreenSiteListing extends StatelessWidget {
  const ScreenSiteListing({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<List<Site>>(
        stream: database!.watchAllSites(),
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
    final firmNameController = TextEditingController();
    ModelDropdown? firm;
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
                  const Text("Add Sites"),
                  const SizedBox(height: 10),
                  TextField(
                    controller: nameController,
                    decoration: const InputDecoration(hintText: "Name"),
                  ),
                  const SizedBox(height: 10),
                  WidgetDropdown(onChanged: (value) {
                    firmNameController.text = value.name;
                    firm = value;
                  }),
                  ElevatedButton(
                    onPressed: () {
                      try {
                        if (firm != null) {
                          final site = SitesCompanion(
                            name: drift.Value(nameController.text),
                            firmId: drift.Value(firm!.id),
                          );
                          database!.insertSite(site);
                          HFunction.showFlushBarSuccess(
                              context: context,
                              message: "Successfully Added the site",
                              afterPop: () {
                                router.pop();
                              });
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
