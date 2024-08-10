import 'package:flutter/material.dart';
import 'package:hisab/database/app_database.dart';
import 'package:hisab/main.dart';
import 'package:hisab/routes/route.dart';
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
  User? selectedUserToSold;
  List<User> users = [];
  @override
  void initState() {
    super.initState();
    _flat = widget.flat;
    getLists(); // Initialize with the passed flat
  }

  getLists() async {
    users = await database.getUsers();
    setState(() {});
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
                'Rate per sqft: ${_flat.rate}',
                style: const TextStyle(
                  fontFamily: 'Courier', // Old-school font
                  fontSize: 16.0,
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                'Status: ${_flat.isSold ? 'Sold' : 'Available'}',
                style: const TextStyle(
                  fontFamily: 'Courier', // Old-school font
                  fontSize: 16.0,
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  backgroundColor: Colors.deepOrange,
                ),
                onPressed: () async {
                  // Create a new Flat object with the updated isSold status
                  showFlatsInputDialog(context: context);
                },
                child: Text(
                  _flat.isSold ? 'Revoke' : 'Sell',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  showFlatsInputDialog({BuildContext? context}) {
    showDialog(
      context: context!,
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
                      selectedUserToSold = newValue;
                    },
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () async {
                      try {
                        await database.updateFlatSoldStatus(
                            flatId: _flat.id, userId: selectedUserToSold!.id);
                        HFunction.showFlushBarError(
                            context: context,
                            message: "Sold Flat Successfully",
                            afterPop: () {
                              final updatedFlat =
                                  _flat.copyWith(isSold: !_flat.isSold);
                              setState(() {
                                _flat = updatedFlat;
                              });
                              router.pop();
                            });
                      } catch (error) {
                        HFunction.showFlushBarError(
                            context: context, message: error.toString());
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
}
