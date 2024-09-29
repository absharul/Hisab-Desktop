import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hisab/database/app_database.dart';
import 'package:hisab/main.dart';
import 'package:intl/intl.dart'; // For number formatting

class ScreenAnalytics extends StatefulWidget {
  final Site site;
  const ScreenAnalytics({super.key, required this.site});

  @override
  _ScreenAnalyticsState createState() => _ScreenAnalyticsState();
}

class _ScreenAnalyticsState extends State<ScreenAnalytics> {
  double incoming = 0;
  double outgoing = 0;
  double netProfit = 0;
  List<Partner> partners = [];
  Map<int, String> partnerUsernames = {};
  bool isLoading = true; // Loading state

  @override
  void initState() {
    super.initState();
    _loadAnalyticsData();
  }

  Future<void> _loadAnalyticsData() async {
    try {
      final income =
          await database.getPLforSite(widget.site.id, isIncoming: true);
      final expenditure =
          await database.getPLforSite(widget.site.id, isIncoming: false);
      final profitData = await database.getNetProfitForSite(widget.site.id);

      // Calculate net profit

      final sitePartners = await database.getAllPartnersBySite(widget.site.id);
      partners = sitePartners;
      setState(() {
        incoming = income;
        outgoing = expenditure;
        netProfit = profitData;
      });

      // Load usernames for partners asynchronously
      await Future.forEach<Partner>(partners, (partner) async {
        final user = await database.getUserById(partner.builderId);
        if (user != null) {
          partnerUsernames[partner.builderId] =
              user.name; // Assuming user has a name field
        }
      });

      setState(() {
        isLoading = false; // Data loading complete
      });
    } catch (e) {
      print("Error loading analytics data: $e");
      setState(() {
        isLoading = false; // Stop loading on error
      });
    }
  }

  String formatCurrency(double amount) {
    return NumberFormat.simpleCurrency().format(amount); // Formats the amount
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.site.name} Analytics"),
        leading: IconButton(
          onPressed: () => context.go('/screesite_details', extra: widget.site),
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator()) // Loading indicator
          : Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Transactions",
                        style: TextStyle(
                            fontSize: 30.0, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "Partners",
                        style: TextStyle(
                            fontSize: 30.0, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // Column(
                      //   crossAxisAlignment: CrossAxisAlignment.start,
                      //   children: [
                      //    Row(
                      //      children: [
                      //        const Column(
                      //          crossAxisAlignment: CrossAxisAlignment.start,
                      //          children: [
                      //            Text("Incoming Amount:"),
                      //            SizedBox(width: 20,),
                      //            Text("Outgoing Amount:"),
                      //            SizedBox(width: 20,),
                      //            Text("Net Profit:"),
                      //          ],
                      //        ),
                      //        SizedBox(width: 15,),
                      //        Column(
                      //          crossAxisAlignment: CrossAxisAlignment.start,
                      //          children: [
                      //            Text(formatCurrency(incoming)),
                      //            const SizedBox(width: 20,),
                      //            Text(formatCurrency(outgoing)),
                      //            const SizedBox(width: 20,),
                      //            Text(formatCurrency(netProfit)),
                      //          ],
                      //        )
                      //      ],
                      //    )
                      //   ],
                      // ),
                      Table(
                        border: TableBorder.all(), // Adds borders around the table
                        columnWidths: {
                          0: FixedColumnWidth(150), // Adjust width for the label column
                          1: FixedColumnWidth(150), // Adjust width for the value column
                        },
                        children: [
                          // Header row (optional, can remove if not needed)
                          TableRow(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Description", style: TextStyle(fontWeight: FontWeight.bold)),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Amount", style: TextStyle(fontWeight: FontWeight.bold)),
                              ),
                            ],
                          ),
                          // Data rows
                          TableRow(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Incoming Amount:"),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(formatCurrency(incoming)),
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Outgoing Amount:"),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(formatCurrency(outgoing)),
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Net Profit:"),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(formatCurrency(netProfit)),
                              ),
                            ],
                          ),
                        ],
                      ),

                      // Column(
                      //   crossAxisAlignment: CrossAxisAlignment.start,
                      //   children: [
                      //     ...partners.map((partner) => Row(
                      //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //       children: [
                      //         Column(
                      //           crossAxisAlignment: CrossAxisAlignment.start,
                      //           children: [
                      //             Text("${partnerUsernames[partner.builderId] ?? 'Unknown'}:", style: const TextStyle(fontSize: 16.0)),
                      //           ],
                      //         ),
                      //         SizedBox(width: 15),
                      //         Column(
                      //           crossAxisAlignment: CrossAxisAlignment.start,
                      //           children: [
                      //             Text("${partner.share}%", style: const TextStyle(fontSize: 16.0)),
                      //           ],
                      //         ),
                      //       ],
                      //     )).toList(),
                      //   ],
                      // ),
                      Table(
                        border: TableBorder.all(), // Adds borders to the table
                        columnWidths: {
                          0: FixedColumnWidth(150), // Adjust width for the first column
                          1: FixedColumnWidth(100), // Adjust width for the second column
                        },
                        children: [
                          // Header row
                          TableRow(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Partner", style: TextStyle(fontWeight: FontWeight.bold)),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Share", style: TextStyle(fontWeight: FontWeight.bold)),
                              ),
                            ],
                          ),
                          // Data rows
                          ...partners.map((partner) => TableRow(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("${partnerUsernames[partner.builderId] ?? 'Unknown'}"),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("${partner.share}%"),
                              ),
                            ],
                          )),
                        ],
                      ),

                    ],
                  ),
                ),
                SizedBox(height: 20),
                Column(
                  children: [
                    Text(
                      "Partners Splits",
                      style: TextStyle(
                          fontSize: 30.0, fontWeight: FontWeight.w600),
                    ),
                    Table(
                      border: TableBorder.all(),
                      columnWidths: {
                        0: FixedColumnWidth(150),
                        1: FixedColumnWidth(100),
                      },
                      children: [
                        TableRow(
                          children: [
                            Padding(padding: const EdgeInsets.all(8.0), child: Text("Partner", style: TextStyle(fontWeight: FontWeight.bold))),
                            Padding(padding: const EdgeInsets.all(8.0), child: Text("Amount", style: TextStyle(fontWeight: FontWeight.bold))),
                          ],
                        ),
                        ...partners.map((partner) {
                          double amount = (partner.share / 100) * netProfit; // Calculate amount for each partner
                          return TableRow(
                            children: [
                              Padding(padding: const EdgeInsets.all(8.0), child: Text("${partnerUsernames[partner.builderId] ?? 'Unknown'}")),
                              Padding(padding: const EdgeInsets.all(8.0), child: Text(formatCurrency(amount))),
                            ],
                          );
                        }
                        )
                      ] ),
                        ]
                )
              ],
            ),
    );
  }
}
