import 'package:flutter/material.dart';

import 'package:hisab/screens/inpute_forms/add_transaction_form.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../database/app_database.dart';

class TransactionTab extends StatelessWidget {
  final Site site;
  const TransactionTab({super.key, required this.site});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding:
              const EdgeInsets.only(top: 20, left: 50, right: 50, bottom: 80),
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: 200,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black, width: 0.5),
                  borderRadius: BorderRadius.circular(
                      0), // No rounded corners for old-school look
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Transaction id",
                          style: TextStyle(
                            fontFamily: 'Courier', // Old-school font
                            fontSize: 20.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "From: ",
                          style: TextStyle(
                            fontFamily: 'Courier', // Old-school font
                            fontSize: 16.0,
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                    const Expanded(child: SizedBox()),
                    Column(
                      children: [
                        IconButton(
                          icon: Icon(
                            PhosphorIcons.pencilSimple(),
                            size: 30.0,
                          ),
                          onPressed: () {
                            // Add your desired action here
                            print("Edit button pressed");
                          },
                          tooltip: "Edit Transaction", // For accessibility
                        ),
                        const Text(
                          "Edit",
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(width: 100),
                    Column(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            // Add your desired action here
                            print("Delete button pressed");
                          },
                          tooltip: "Delete", // For accessibility
                        ),
                        const Text(
                          "Delete",
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          )),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff4EA6B2),
        foregroundColor: Colors.black,
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AddTransactionForm(site: site),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
