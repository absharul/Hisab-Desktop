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
    return NumberFormat.simpleCurrency(name: 'INR').format(amount); // Formats the amount with ₹
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
          ? const Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          SizedBox(height: 16),
          Text("Loading analytics data..."),
        ],
      ))
          : Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Transactions", style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w600)),
                Padding(
                   padding: EdgeInsets.only(right: 100),
                    child: Text("Partners", style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w600))),
              ],
            ),
          ),
          // Padding(
          //   padding: EdgeInsets.all(0),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //     children: [
          //       Container(
          //         width: 400,
          //         child: Row(
          //           children: [
          //             Padding(
          //               padding: EdgeInsets.all(8.0),
          //               child: Text("Description",
          //                   style: TextStyle(
          //                       fontWeight: FontWeight.bold,
          //                       fontSize: 25.0
          //                   )),
          //             ),
          //             Padding(
          //               padding: EdgeInsets.all(8.0),
          //               child: Text("Amount", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25.0)),
          //             ),
          //           ],
          //         ),
          //       ),
          //       Container(
          //         width: 400,
          //         child: Row(
          //           children: [
          //             Padding(
          //               padding: EdgeInsets.all(8.0),
          //               child: Text("Partner",
          //                   style: TextStyle(
          //                       fontWeight: FontWeight.bold,
          //                       fontSize: 25.0
          //                   )),
          //             ),
          //             Padding(
          //               padding: EdgeInsets.all(8.0),
          //               child: Text("Share", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25.0)),
          //             ),
          //             Padding(
          //               padding: EdgeInsets.all(8.0),
          //               child: Text("Amount", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25.0)),
          //             ),
          //           ],
          //         ),
          //       )
          //     ],
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Transactions Table
                Table(
                  // border: TableBorder.all(),
                  columnWidths: const {
                    0: FixedColumnWidth(200),
                    1: FixedColumnWidth(200),
                  },
                  children: [
                    TableRow(
                      decoration: BoxDecoration(color: Colors.grey[200]), // Header background color
                      children: const [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Description",
                              style: TextStyle(
                              fontWeight: FontWeight.bold,
                                fontSize: 25.0
                              )),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Amount", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25.0)),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        const Padding(padding: EdgeInsets.all(8.0),
                            child: Text("Incoming Amount:",
                              style: TextStyle(
                                fontSize: 18.0,
                              ),
                            )),
                        Padding(padding: const EdgeInsets.all(8.0),
                            child: Text(formatCurrency(incoming),
                              style: const TextStyle(
                                fontSize: 18.0,
                              ),
                            )),
                      ],
                    ),
                    TableRow(
                      children: [
                        const Padding(padding: EdgeInsets.all(8.0),
                            child: Text("Outgoing Amount:",
                              style: TextStyle(
                                fontSize: 18.0,
                              ),
                            )),
                        Padding(padding: const EdgeInsets.all(8.0),
                            child: Text(formatCurrency(outgoing),
                              style: const TextStyle(
                                fontSize: 18.0,
                                ),)),
                      ],
                    ),
                    TableRow(
                      children: [
                        const Padding(padding: EdgeInsets.all(8.0),
                            child: Text("Net Profit:",
                              style: TextStyle(
                                fontSize: 18.0,
                              ),
                            )),
                        Padding(padding: const EdgeInsets.all(8.0),
                            child: Text(formatCurrency(netProfit),
                              style: const TextStyle(
                                fontSize: 18.0,
                              ),
                            )),
                      ],
                    ),
                  ],
                ),
                Table(
                  columnWidths: const {
                    0: FixedColumnWidth(200),
                    1: FixedColumnWidth(100),
                    2: FixedColumnWidth(200),
                  },
                  children: [
                    TableRow(
                      decoration: BoxDecoration(color: Colors.grey[200]), // Header background color
                      children: const [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Partner",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                fontSize: 25.0
                              )),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Share", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25.0)),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Amount", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25.0)),
                        ),
                      ],
                    ),
                    ...partners.map((partner) {
                      double amount = (partner.share / 100) * netProfit;
                      return TableRow(
                        children: [
                          Padding(padding: const EdgeInsets.all(8.0),
                              child: Text("${partnerUsernames[partner.builderId] ?? 'Unknown'}",
                                style: const TextStyle(
                                  fontSize: 18.0,
                                ),
                              )),
                          Padding(padding: const EdgeInsets.all(8.0), child: Text("${partner.share}%",
                            style: const TextStyle(
                              fontSize: 18.0,
                            ),
                          )),
                          Padding(padding: const EdgeInsets.all(8.0), child: Text(formatCurrency(amount),
                            style: const TextStyle(
                              fontSize: 18.0,
                            ),
                          )),
                        ],
                      );
                    }).toList(),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
