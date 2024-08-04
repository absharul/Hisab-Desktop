import 'package:flutter/material.dart';

import '../inpute_forms/add_flats.dart';

class FlatsTab extends StatelessWidget {
  const FlatsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 20, left: 200, right: 200, bottom: 50),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Show only one card per row
            mainAxisSpacing: 20.0,
            crossAxisSpacing: 5.0,// Space between rows
            childAspectRatio: 2, // Adjust the aspect ratio
          ),
          itemCount: 100, // Number of cards to show initially
          itemBuilder: (context, index) {
            return Padding(padding: const EdgeInsets.symmetric(horizontal:10,vertical: 10),
            child: Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 5,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                   Padding(padding: EdgeInsets.only(left: 50.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          Text("Flat Name"),
                          const SizedBox(height: 5),
                          Text("Area: 564 sqft"),
                          const SizedBox(height: 5),
                          Text("Type: 2BHK"),
                          const SizedBox(height: 5),
                          Text("Rate per sqft: 2850"),
                          const SizedBox(height: 5),
                          Text("Status: Sold"),
                          const SizedBox(height: 50),
                          ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  backgroundColor: Colors.deepOrange,
                                ),
                                onPressed: () {},
                                child: Text('Sell', style: TextStyle(color: Colors.white),),
                              ),
                            ],
                          ),
                      ),
                  ],
                ),
            ),); // Adjust card width
          },
        ),
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
