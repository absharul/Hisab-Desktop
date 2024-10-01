import 'package:flutter/material.dart';
import 'package:hisab/main.dart';
import 'package:hisab/screens/input_forms/add_transaction_form.dart';
import 'package:hisab/screens/widgets/widget_transaction_card.dart';
import '../../database/app_database.dart';

class TransactionTab extends StatelessWidget {
  final Site site;
  const TransactionTab({super.key, required this.site});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<List<Transaction>>(
          // stream: database.watchAllTransactions(),
          stream: database.getTransactionById(site.id),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No transactions available.'));
            }

            final transactions = snapshot.data!;
            return ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: transactions.length,
              itemBuilder: (BuildContext context, int index) {
                final transaction = transactions[index];
                return WidgetTransactionCard(transaction: transaction, site: site,);
              },
            );
          }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff4EA6B2),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(50))),
        foregroundColor: Colors.black,
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AddTransactionForm(site: site),
            ),
          );
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
