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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Incoming Amount: ${formatCurrency(incoming)}"),
                          Text("Outgoing Amount: ${formatCurrency(outgoing)}"),
                          Text("Net Profit: ${formatCurrency(netProfit)}"),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ...partners.map((partner) => Text(
                                "${partnerUsernames[partner.builderId] ?? 'Unknown'}: ${partner.share}%",
                                style: const TextStyle(fontSize: 16.0),
                              )),
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
