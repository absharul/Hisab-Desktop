import 'package:flutter/material.dart';

import '../inpute_forms/add_flats.dart';

class FlatsTab extends StatelessWidget {
  const FlatsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(),
        child: ListView.builder(
          itemCount: 100, // Number of items
          itemBuilder: (context, index) {
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
                        const Text(
                          "Flat Name",
                          style: TextStyle(
                            fontFamily: 'Courier', // Old-school font
                            fontSize: 20.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          "Area: 564 sqft",
                          style: TextStyle(
                            fontFamily: 'Courier', // Old-school font
                            fontSize: 16.0,
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          "Type: 2BHK",
                          style: TextStyle(
                            fontFamily: 'Courier', // Old-school font
                            fontSize: 16.0,
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          "Rate per sqft: 2850",
                          style: TextStyle(
                            fontFamily: 'Courier', // Old-school font
                            fontSize: 16.0,
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          "Status: Sold",
                          style: TextStyle(
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
        ),

        // GridView.builder(
        //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        //     crossAxisCount: 2, // Show only one card per row
        //     mainAxisSpacing: 20.0,
        //     crossAxisSpacing: 5.0,// Space between rows
        //     childAspectRatio: 2, // Adjust the aspect ratio
        //   ),
        //   itemCount: 100, // Number of cards to show initially
        //   itemBuilder: (context, index) {
        //     return Padding(padding: const EdgeInsets.symmetric(horizontal:10,vertical: 10),
        //       child: Card(
        //         semanticContainer: true,
        //         clipBehavior: Clip.antiAliasWithSaveLayer,
        //         shape: RoundedRectangleBorder(
        //           borderRadius: BorderRadius.circular(10.0),
        //         ),
        //         elevation: 5,
        //         child: Row(
        //           mainAxisAlignment: MainAxisAlignment.start,
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //           children: [
        //
        //             Padding(padding: EdgeInsets.only(left: 50.0),
        //               child: Column(
        //                 crossAxisAlignment: CrossAxisAlignment.start,
        //
        //                 children: [
        //                   Text("Flat Name"),
        //                   const SizedBox(height: 5),
        //                   Text("Area: 564 sqft"),
        //                   const SizedBox(height: 5),
        //                   Text("Type: 2BHK"),
        //                   const SizedBox(height: 5),
        //                   Text("Rate per sqft: 2850"),
        //                   const SizedBox(height: 5),
        //                   Text("Status: Sold"),
        //                   const SizedBox(height: 50),
        //                   ElevatedButton(
        //                     style: ElevatedButton.styleFrom(
        //                       shape: RoundedRectangleBorder(
        //                         borderRadius: BorderRadius.circular(5.0),
        //                       ),
        //                       backgroundColor: Colors.deepOrange,
        //                     ),
        //                     onPressed: () {},
        //                     child: Text('Sell', style: TextStyle(color: Colors.white),),
        //                   ),
        //                 ],
        //               ),
        //             ),
        //           ],
        //         ),
        //       ),); // Adjust card width
        //   },
        // ),
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
