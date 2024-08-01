import 'package:flutter/material.dart';
import 'package:hisab/screens/inpute_forms/add_transaction.dart';

class TransactionTab extends StatelessWidget {
  const TransactionTab({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:  Container(
        padding: const EdgeInsets.only(top: 20, left: 50, right: 50, bottom: 80),
        child:  ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: 200,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              padding: const EdgeInsets.only(top: 5,bottom: 5),
              height: 100,
              width: 285, // Ensure each item has a width
              margin: const EdgeInsets.only(right: 10), // Add margin between items
              child: Card(
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 5,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 20,
                        width: 80,
                        decoration: BoxDecoration(
                          color: const Color(0xFF4EA6B2),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: const Text("View",style:
                        TextStyle(color: Colors.white,
                        ),
                          textAlign: TextAlign.center,),
                      ),
                      SizedBox(width: 100,),
                      Container(
                        height: 20,
                        width: 80,
                        decoration: BoxDecoration(
                          color: const Color(0xFFFF2E00),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: const Text("Delete",style: TextStyle(color: Colors.white),textAlign: TextAlign.center),
                      ),
                    ],
                  ),
                )

              ),
            );
          },
        )
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff4EA6B2),
        foregroundColor: Colors.black,
        onPressed: () {
          showTransactionInputDialog(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
