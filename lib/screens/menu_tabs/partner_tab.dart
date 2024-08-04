import 'package:flutter/material.dart';
import 'package:hisab/main.dart';
import 'package:hisab/screens/inpute_forms/add_partner.dart';

import '../../database/app_database.dart';

class PartnerTab extends StatefulWidget {
  final Site site;

  const PartnerTab({super.key,required this.site});

  @override
  State<PartnerTab> createState() => _PartnerTabState();
}

class _PartnerTabState extends State<PartnerTab> {

  List<User> usersList = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllUsers();
  }

  void getAllUsers() async{
    final users = await database.getUsers();
    setState(() {
      usersList = users;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<List<Partner>>(
          stream: database.watchPartners(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            final partners = snapshot.data ?? [];
            return ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: partners.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black, width: 0.5),
                      borderRadius: BorderRadius.circular(0), // No rounded corners for old-school look
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${partners[index].share}",
                                style: const TextStyle(
                                  fontFamily: 'Courier', // Old-school font
                                  fontSize: 20.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 10),
                              // Add more text or widgets here if needed
                            ],
                          ),
                        ),
                        const SizedBox(width: 20),
                        Row(
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
                              child: const Center(
                                child: Text(
                                  "View",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            const SizedBox(width: 20),
                            Container(
                              height: 20,
                              width: 80,
                              decoration: BoxDecoration(
                                color: const Color(0xFFFF2E00),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: const Center(
                                child: Text(
                                  "Terminate",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            );

            //   ListView.builder(
            //   scrollDirection: Axis.vertical,
            //   shrinkWrap: true,
            //   itemCount: partners.length,
            //   itemBuilder: (BuildContext context, int index) {
            //     return Container(
            //       padding: const EdgeInsets.only(top: 5, bottom: 5),
            //       height: 100,
            //       width: 285, // Ensure each item has a width
            //       margin: const EdgeInsets.only(
            //           right: 10), // Add margin between items
            //       child: Card(
            //           semanticContainer: true,
            //           clipBehavior: Clip.antiAliasWithSaveLayer,
            //           shape: RoundedRectangleBorder(
            //             borderRadius: BorderRadius.circular(10.0),
            //           ),
            //           elevation: 5,
            //           child: Padding(
            //             padding: EdgeInsets.symmetric(horizontal: 10.0),
            //             child: Row(
            //               children: [
            //                 Text(
            //                   "${partners[index].share}"
            //                 ),
            //                 Spacer(),
            //                 Row(
            //                   mainAxisAlignment: MainAxisAlignment.end,
            //                   crossAxisAlignment: CrossAxisAlignment.center,
            //                   children: [
            //                     Container(
            //                       height: 20,
            //                       width: 80,
            //                       decoration: BoxDecoration(
            //                         color: const Color(0xFF4EA6B2),
            //                         borderRadius: BorderRadius.circular(15.0),
            //                       ),
            //                       child: const Text(
            //                         "View",
            //                         style: TextStyle(
            //                           color: Colors.white,
            //                         ),
            //                         textAlign: TextAlign.center,
            //                       ),
            //                     ),
            //                     const SizedBox(
            //                       width: 100,
            //                     ),
            //                     Container(
            //                       height: 20,
            //                       width: 80,
            //                       decoration: BoxDecoration(
            //                         color: const Color(0xFFFF2E00),
            //                         borderRadius: BorderRadius.circular(15.0),
            //                       ),
            //                       child: const Text("Terminate",
            //                           style: TextStyle(color: Colors.white),
            //                           textAlign: TextAlign.center),
            //                     ),
            //                   ],
            //                 ),
            //               ],
            //             ),
            //           )),
            //     );
            //   },
            // );
          }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff4EA6B2),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(50))),
        onPressed: () {
          showPartnerInputDialog(context: context, site: widget.site, users: usersList);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
