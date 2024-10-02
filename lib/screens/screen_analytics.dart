import 'package:flutter/material.dart';
import 'package:hisab/database/app_database.dart';
import 'package:hisab/main.dart';
import 'package:intl/intl.dart';

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

      final sitePartners = await database.getAllPartnersBySite(widget.site.id);
      partners = sitePartners;
      setState(() {
        incoming = income;
        outgoing = expenditure;
        netProfit = profitData;
      });

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
          Padding(
            padding: EdgeInsets.all(0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  decoration: BoxDecoration(color: Colors.grey[200]),
                  width: 400,
                  child: const Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("Description",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25.0
                            )),
                      ),
                      Expanded(child: SizedBox()),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("Amount", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25.0)),
                      ),
                      SizedBox(width: 80)
                    ],
                  ),
                ),
                Container(
                  width: 500,
                  decoration: BoxDecoration(color: Colors.grey[200]),
                  child: const Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("Partner",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25.0
                            )),
                      ),
                      Expanded(child: SizedBox()),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("Share", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25.0)),
                      ),
                      SizedBox(width: 20,),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("Amount", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25.0)),
                      ),
                      SizedBox(width: 85,)
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 2.0,right: 2.0, bottom: 2.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Table(
                  columnWidths: const {
                    0: FixedColumnWidth(200),
                    1: FixedColumnWidth(200),
                  },
                  children: [
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
                    ...partners.map((partner) {
                      double amount = (partner.share / 100) * netProfit;
                      return TableRow(
                        children: [
                          Padding(padding: const EdgeInsets.only(right: 8.0,bottom: 8.0,left: 8.0),
                              child: Text("${partnerUsernames[partner.builderId] ?? 'Unknown'}",
                                style: const TextStyle(
                                  fontSize: 18.0,
                                ),
                              )),
                          Padding(padding: const EdgeInsets.only(right: 8.0,bottom: 8.0,left: 8.0), child: Text("${partner.share}%",
                            style: const TextStyle(
                              fontSize: 18.0,
                            ),
                          )),
                          Padding(padding: const EdgeInsets.only(right: 8.0,bottom: 8.0,left: 8.0), child: Text(formatCurrency(amount),
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
