import 'package:flutter/material.dart';
import 'package:hisab/controllers/flat_controller.dart';
import 'package:hisab/database/app_database.dart';
import 'package:hisab/main.dart';
import 'package:hisab/utils/helper_functions.dart';
import '../input_forms/add_flats.dart';

class FlatsTab extends StatelessWidget {
  final Site site;
  const FlatsTab({super.key, required this.site});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<List<Flat>>(
        stream: database.watchAllFlats(site.id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No flats available.'));
          }

          final flats = snapshot.data!;

          return ListView.builder(
            itemCount: flats.length,
            itemBuilder: (context, index) {
              final flat = flats[index];
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: FlatItem(flat: flat),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff4EA6B2),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(50))),
        foregroundColor: Colors.black,
        onPressed: () {
          showFlatsInputDialog(context: context, siteId: site.id);
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}

class FlatItem extends StatefulWidget {
  final Flat flat;
  const FlatItem({super.key, required this.flat});

  @override
  _FlatItemState createState() => _FlatItemState();
}

class _FlatItemState extends State<FlatItem> {
  late Flat _flat;
  List<User> users = [];
  User? selectedUserToSold;

  @override
  void initState() {
    super.initState();
    _flat = widget.flat;
    _fetchCustomers();
  }

  Future<void> _fetchCustomers() async {
    try {
      // Get the subcategories for the "Customer" category
      final subCategories = await database.getSubcategoriesForCategory('Customer');

      // Extract the subcategory IDs
      final subCategoryIds = subCategories.map((subCat) => subCat.id).toList();

      // Fetch users belonging to those subcategories
      final fetchedUsers = await database.getUsersBySubCategoryIds(subCategoryIds);

      print('Fetched users: $fetchedUsers');
      setState(() {
        users = fetchedUsers; // Update the state with fetched users
      });
    } catch (e) {
      print('Error fetching users: $e');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black, width: 0.5),
        borderRadius:
            BorderRadius.circular(0), // No rounded corners for old-school look
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _flat.name,
                style: const TextStyle(
                  fontFamily: 'Courier', // Old-school font
                  fontSize: 20.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                'Area: ${_flat.area} sqft',
                style: const TextStyle(
                  fontFamily: 'Courier', // Old-school font
                  fontSize: 16.0,
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                'Type: ${_flat.type}',
                style: const TextStyle(
                  fontFamily: 'Courier', // Old-school font
                  fontSize: 16.0,
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                'Rate per sqft: ₹ ${_flat.rate}',
                style: const TextStyle(
                  fontFamily: 'Courier', // Old-school font
                  fontSize: 16.0,
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const SizedBox(height: 5),
              Row(
                children: [ // Add some space between the icon and text
                  Text(
                    'Status: ${_flat.isSold ? 'Sold' : 'Available'}',
                    style: const TextStyle(
                      fontFamily: 'Courier',
                      fontSize: 16.0,
                      color: Colors.black, // Keep the text color black
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  Icon(
                    _flat.isSold ? Icons.check_circle : Icons.circle,
                    color: _flat.isSold ? Colors.red : Colors.green,
                    size: 18.0,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  backgroundColor: Colors.deepOrange,
                ),
                onPressed: () {
                  if (_flat.isSold) {
                    _revokeSale(); // Revoke sale
                  } else {
                    _sellFlat(); // Sell flat
                  }
                },
                child: Text(
                  _flat.isSold ? 'Revoke' : 'Sell',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
          const Expanded(child: SizedBox()),
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: Column(
              children: [
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    // Add your desired action here
                    _editFlat();
                    print("Edit Flat detail");
                  },
                  tooltip: "Edit Flat list", // For accessibility
                ),
                const Text(
                  "Edit",
                  style: TextStyle(fontSize: 16.0,),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: Column(
              children: [
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () async {
                    final confirm = await showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        title: const Text('Delete Flat'),
                        content: const Text(
                            'Are you sure you want to delete this Flat?'),
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
                        await flatContoller.deleteFlat(widget.flat);
                        HFunction.showFlushBarSuccess(
                          // ignore: use_build_context_synchronously
                          context: context,
                          message: "Successfully deleted the Flat",
                        );
                      } catch (error) {
                        HFunction.showFlushBarError(
                          // ignore: use_build_context_synchronously
                          context: context,
                          message: "Failed to delete the Transaction: $error",
                        );
                      }
                    }
                  },

                  tooltip: "Delete", // For accessibility
                ),
                const Text(
                  "Delete",
                  style: TextStyle(fontSize: 16.0,),
                ),
                const SizedBox(width: 100),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Function to handle selling a flat
  void _sellFlat() {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Container(
            width: 200,
            height: 150,
            padding: const EdgeInsets.all(10),
            child: Center(
              child: Column(
                children: [
                  const Text("Sell Flat"),
                  const SizedBox(height: 10),
                  DropdownButtonFormField<User>(
                    value: selectedUserToSold,
                    decoration: const InputDecoration(
                      labelText: 'Select User',
                    ),
                    items: users.map<DropdownMenuItem<User>>((User value) {
                      return DropdownMenuItem<User>(
                        value: value,
                        child: Text(value.name),
                      );
                    }).toList(),
                    onChanged: (User? newValue) {
                      setState(() {
                        selectedUserToSold = newValue;
                      });
                    },
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () async {
                      if (selectedUserToSold != null) {
                        try {
                          await database.updateFlatSoldStatus(
                            flatId: _flat.id,
                            userId: selectedUserToSold!.id,
                          );
                          HFunction.showFlushBarError(
                            context: context,
                            message: "Sold Flat Successfully",
                            afterPop: () {
                              final updatedFlat =
                                  _flat.copyWith(isSold: !_flat.isSold);
                              setState(() {
                                _flat = updatedFlat;
                              });
                              Navigator.pop(context);
                            },
                          );
                        } catch (error) {
                          HFunction.showFlushBarError(
                            context: context,
                            message: error.toString(),
                          );
                        }
                      }
                    },
                    child: const Text("Sell Flat"),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // Function to handle revoking a sale
  Future<void> _revokeSale() async {
    try {
      await database.revokeFlatSoldStatus(flatId: _flat.id);
      HFunction.showFlushBarError(
        context: context,
        message: "Revoked Sale Successfully",
        afterPop: () {
          final updatedFlat = _flat.copyWith(isSold: false);
          setState(() {
            _flat = updatedFlat;
          });
        },
      );
    } catch (error) {
      HFunction.showFlushBarError(context: context, message: error.toString());
    }
  }


  // Function to handle editing a flat
  void _editFlat() {
    final nameController = TextEditingController(text: _flat.name);
    final areaController = TextEditingController(text: _flat.area.toString());
    final rateController = TextEditingController(text: _flat.rate.toString());
    final typeController = TextEditingController(text: _flat.type);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Edit Flat'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Name'),
              ),
              const SizedBox(height: 8.0,),
              TextField(
                controller: areaController,
                decoration: const InputDecoration(labelText: 'Area (sqft)'),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 8.0,),
              TextField(
                controller: rateController,
                decoration: const InputDecoration(labelText: 'Rate per sqft'),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 8.0,),
              TextField(
                controller: typeController,
                decoration: const InputDecoration(labelText: 'Type'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                try {
                  final updatedFlat = _flat.copyWith(
                    name: nameController.text,
                    area: int.tryParse(areaController.text) ?? _flat.area,
                    rate: int.tryParse(rateController.text) ?? _flat.rate,
                    type: typeController.text,
                  );
                  await flatContoller.updateFlat(updatedFlat);  // Use FlatController
                  setState(() {
                    _flat = updatedFlat;
                  });
                  Navigator.of(context).pop();
                  HFunction.showFlushBarSuccess(context: context, message: 'Flat updated successfully');
                } catch (e) {
                  HFunction.showFlushBarError(context: context, message: 'Error updating flat: $e');
                }
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

}

