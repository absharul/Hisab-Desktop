import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:hisab/controllers/sub_category_controller.dart';
import 'package:hisab/database/app_database.dart';
import 'package:hisab/main.dart';
import 'package:hisab/routes/route.dart';
import 'package:hisab/utils/helper_functions.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ScreenSubCategoryList extends StatefulWidget {
  const ScreenSubCategoryList({super.key});

  @override
  State<ScreenSubCategoryList> createState() => _ScreenSubCategoryListState();
}

class _ScreenSubCategoryListState extends State<ScreenSubCategoryList> {
  List<Category> realCategories = [];
  @override
  void initState() {
    super.initState();
    getCategoryList();
  }

  void getCategoryList() async {
    realCategories = await database.getCategory();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<List<SubCategory>>(
        stream: database.watchSubCategory(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final categories = snapshot.data ?? [];

          return ListView.builder(
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final subCategory = categories[index];
              final fetchCategory = realCategories[index];
              return InkWell(
                child: Container(
                  margin: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 16.0),
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black, width: 0.5),
                    borderRadius:
                        BorderRadius.circular(0), // Slightly rounded corners
                  ),
                  child: Row(
                    children: [
                      Icon(
                        PhosphorIcons.stack(),
                      ), // Icon to make it look different
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                          subCategory.name,
                          style: const TextStyle(
                            fontFamily: 'Courier', // Old-school font
                            fontSize: 16.0,
                            color: Colors.black,
                          ),
                          ),
                          Text(
                            fetchCategory.name,
                            style: const TextStyle(
                              fontFamily: 'Courier', // Old-school font
                              fontSize: 12.0,
                              color: Colors.black,
                            ),
                          )
                        ],
                      ),
                      const Expanded(child: SizedBox()),
                      Column(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () {
                              _editSubCategory(context, subCategory);
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
                                  title: const Text('Delete Sub Category'),
                                  content: const Text(
                                      'Are you sure you want to delete this Sub Category?'),
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
                                  await subCategoryController.delete(subCategory);
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
    Category? selectedCategory;
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
                  const Text("Add Sub Category"),
                  const SizedBox(height: 10),
                  TextField(
                    controller: nameController,
                    decoration: const InputDecoration(hintText: "Name"),
                  ),
                  const SizedBox(height: 10),
                  DropdownButtonFormField<Category>(
                    value: selectedCategory,
                    decoration: const InputDecoration(
                      labelText: 'Select Category',
                    ),
                    items: realCategories
                        .map<DropdownMenuItem<Category>>((Category value) {
                      return DropdownMenuItem<Category>(
                        value: value,
                        child: Text(value.name),
                      );
                    }).toList(),
                    onChanged: (Category? newValue) {
                      selectedCategory = newValue;
                    },
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () async {
                      if (selectedCategory != null) {
                        try {
                          final site = SubCategoriesCompanion(
                              name: drift.Value(nameController.text),
                              categoryId: drift.Value(selectedCategory!.id));
                          await database.insertSubCategory(site);
                          router.pop();
                          HFunction.showFlushBarSuccess(
                            context: context,
                            message: "Successfully Added the site",
                          );
                        } catch (error) {
                          HFunction.showFlushBarError(
                              context: context, message: error.toString());
                        }
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
  void _editSubCategory(BuildContext context, SubCategory subCategory) {
    final nameController = TextEditingController(text: subCategory.name);
    Category? selectedCategory = realCategories.firstWhere((cat) => cat.id == subCategory.categoryId);

    showDialog(
      context: context,
      builder: (ctx) {
        return Dialog(
          child: Container(
            width: 300,
            height: 200,
            padding: const EdgeInsets.all(10),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text("Edit Sub Category"),
                const SizedBox(height: 10),
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(hintText: "Name"),
                ),
                const SizedBox(height: 10),
                DropdownButtonFormField<Category>(
                  value: selectedCategory,
                  decoration: const InputDecoration(
                    labelText: 'Select Category',
                  ),
                  items: realCategories
                      .map<DropdownMenuItem<Category>>((Category value) {
                    return DropdownMenuItem<Category>(
                      value: value,
                      child: Text(value.name),
                    );
                  }).toList(),
                  onChanged: (Category? newValue) {
                    selectedCategory = newValue;
                  },
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () async {
                    if (selectedCategory != null) {
                      try {
                        final updatedSubCategory = subCategory.copyWith(
                          name: nameController.text,
                          categoryId: selectedCategory!.id,
                        );

                        await subCategoryController.update(updatedSubCategory);
                        Navigator.of(context).pop(); // Close the dialog
                        HFunction.showFlushBarSuccess(
                          context: context,
                          message: "Successfully updated the subcategory",
                        );
                      } catch (error) {
                        HFunction.showFlushBarError(
                          context: context,
                          message: "Failed to update the subcategory: $error",
                        );
                      }
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
