import 'package:flutter/material.dart';
import 'package:hisab/database/app_database.dart';
import 'package:provider/provider.dart';
import '../inpute_forms/add_flats.dart';

class FlatsTab extends StatelessWidget {
  const FlatsTab({super.key});

  @override
  Widget build(BuildContext context) {
    final appDatabase = Provider.of<AppDatabase>(context);

    return Scaffold(
      body: StreamBuilder<List<Flat>>(
        stream: appDatabase.watchAllFlats(),
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
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black, width: 0.5),
                    borderRadius: BorderRadius.circular(0), // No rounded corners for old-school look
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            flat.name,
                            style: const TextStyle(
                              fontFamily: 'Courier', // Old-school font
                              fontSize: 20.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            'Area: ${flat.area} sqft',
                            style: const TextStyle(
                              fontFamily: 'Courier', // Old-school font
                              fontSize: 16.0,
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            'Type: ${flat.type}',
                            style: const TextStyle(
                              fontFamily: 'Courier', // Old-school font
                              fontSize: 16.0,
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            'Rate per sqft: ${flat.rate}',
                            style: const TextStyle(
                              fontFamily: 'Courier', // Old-school font
                              fontSize: 16.0,
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            'Status: ${flat.isSold ? 'Sold' : 'Available'}',
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
                            onPressed: () {
                              // Add your sell functionality here
                            },
                            child: const Text('Sell', style: TextStyle(color: Colors.white)),
                          ),
                        ],
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
        backgroundColor: const Color(0xff4EA6B2),
        foregroundColor: Colors.black,
        onPressed: () {
          showFlatsInputDialog(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
