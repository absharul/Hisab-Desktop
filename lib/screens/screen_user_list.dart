import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:hisab/controllers/user_controller.dart';
import 'package:hisab/database/app_database.dart';
import 'package:hisab/main.dart';
import 'package:hisab/routes/route.dart';
import 'package:hisab/utils/helper_functions.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ScreenUserListing extends StatefulWidget {
  const ScreenUserListing({super.key});

  @override
  State<ScreenUserListing> createState() => _ScreenUserListingState();
}

class _ScreenUserListingState extends State<ScreenUserListing> {
  List<SubCategory> subCategories = [];
  @override
  void initState() {
    super.initState();
    getAllSubCategories();
  }

  void getAllSubCategories() async {
    subCategories = await database.getSubCategory();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<List<User>>(
        stream: database.watchUser(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final users = snapshot.data ?? [];

          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];

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
                    color: Colors
                        .white, // Light grey background for differentiation
                    border: Border.all(
                        color: Colors.black,
                        width: 0.5), // Blue border for differentiation
                    borderRadius:
                        BorderRadius.circular(0), // Slightly rounded corners
                  ),
                  child: Row(
                    children: [
                      Icon(
                        PhosphorIcons.user(),
                      ), // Icon to make it look different
                      const SizedBox(width: 10),
                      Text(
                        user.name,
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
                                  title: const Text('Delete User'),
                                  content: const Text(
                                      'Are you sure you want to delete this user?'),
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
                                  await userController.delete(user);
                                  HFunction.showFlushBarSuccess(
                                    context: context,
                                    message: "Successfully deleted the category",
                                  );
                                } catch (error) {
                                  HFunction.showFlushBarError(
                                    context: context,
                                    message:
                                    "Failed to delete the category: $error",
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

    SubCategory? selectedSubCategory;

    return showDialog(
        context: context,
        builder: (ctx) {
          return Dialog(
            child: Container(
              width: 200,
              height: 270,
              padding: const EdgeInsets.all(10),
              color: Colors.white,
              child: Column(
                children: [
                  const Text("Add Sites",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18.0),),
                  const SizedBox(height: 10),
                  TextField(
                    controller: nameController,
                    decoration: const InputDecoration(hintText: "Name"),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: addressController,
                    decoration: const InputDecoration(hintText: "Type"),
                  ),
                  const SizedBox(height: 10),
                  DropdownButtonFormField<SubCategory>(
                    value: selectedSubCategory,
                    decoration: const InputDecoration(
                      labelText: 'Select Sub-Category',
                    ),
                    items: subCategories.map<DropdownMenuItem<SubCategory>>(
                        (SubCategory value) {
                      return DropdownMenuItem<SubCategory>(
                        value: value,
                        child: Text(value.name),
                      );
                    }).toList(),
                    onChanged: (SubCategory? newValue) {
                      selectedSubCategory = newValue;
                    },
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () async {
                      try {
                        if (selectedSubCategory != null) {
                          final site = UsersCompanion(
                            name: drift.Value(nameController.text),
                            type: drift.Value(addressController.text),
                            subCategory: drift.Value(selectedSubCategory!.id),
                          );

                          database.insertUser(site);
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
