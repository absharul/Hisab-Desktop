import 'package:flutter/material.dart';
import 'package:hisab/database/app_database.dart';
import 'package:hisab/main.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:intl/intl.dart';  // Import for date formatting

class WidgetTransactionCard extends StatefulWidget {
  final Transaction transaction;
  const WidgetTransactionCard({super.key, required this.transaction});

  @override
  State<WidgetTransactionCard> createState() => _WidgetTransactionCardState();
}

class _WidgetTransactionCardState extends State<WidgetTransactionCard> {
  String from = "";
  String to = "";
  String fromBankName = "";
  String toBankName = "";

  @override
  void initState() {
    super.initState();
    initializeData();
  }

  void initializeData() async {
    final fromEntity =
    await database.getEntityPaymentMethod(widget.transaction.fromId);
    final toEntity =
    await database.getEntityPaymentMethod(widget.transaction.toId);

    await database.getUserById(fromEntity.entityId).then((value) {
      from = value.name;
    });
    await database.getUserById(toEntity.entityId).then((value) {
      to = value.name;
    });

    final fromBank =
    await database.getBankAccountById(fromEntity.bankAccountId);
    final toBank = await database.getBankAccountById(toEntity.bankAccountId);
    setState(() {
      fromBankName = fromBank.bankName;
      toBankName = toBank.bankName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black, width: 0.5),
        borderRadius:
        BorderRadius.circular(0), // No rounded corners for old-school look
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Transaction Id: ${widget.transaction.id.toString()}",
                style: const TextStyle(
                  fontFamily: 'Courier', // Old-school font
                  fontSize: 20.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  Text(
                    'From: $from',
                    style: const TextStyle(
                      fontFamily: 'Courier', // Old-school font
                      fontSize: 16.0,
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'Bank: $fromBankName',
                    style: const TextStyle(
                      fontFamily: 'Courier', // Old-school font
                      fontSize: 16.0,
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  Text(
                    'To: $to',
                    style: const TextStyle(
                      fontFamily: 'Courier', // Old-school font
                      fontSize: 16.0,
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'Bank: $toBankName',
                    style: const TextStyle(
                      fontFamily: 'Courier', // Old-school font
                      fontSize: 16.0,
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Text(
                'Amount: \$ ${widget.transaction.amount}',
                style: const TextStyle(
                  fontFamily: 'Courier', // Old-school font
                  fontSize: 16.0,
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const SizedBox(height: 5),
              // Row(
              //   children: [
              //     Text(
              //       'Remarks: ${widget.transaction.remarks}',
              //       style: const TextStyle(
              //         fontFamily: 'Courier', // Old-school font
              //         fontSize: 16.0,
              //         color: Colors.black,
              //         fontWeight: FontWeight.normal,
              //       ),
              //     ),
              //     const SizedBox(width: 200),
              //     Text(
              //       ' ${DateFormat('dd/MM/yyyy HH:mm').format(widget.transaction.createdAt)}',
              //       style: const TextStyle(
              //         fontFamily: 'Courier', // Old-school font
              //         fontSize: 16.0,
              //         color: Colors.black,
              //         fontWeight: FontWeight.normal,
              //       ),
              //     ),
              //   ],
              // ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Remarks: ${widget.transaction.remarks} ',
                      style: const TextStyle(
                        fontFamily: 'Courier',
                        fontSize: 16.0,
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    const WidgetSpan(
                      child: SizedBox(width: 100),
                    ),
                    TextSpan(
                      text: '${DateFormat('dd/MM/yyyy').format(widget.transaction.createdAt)} ',
                      style: const TextStyle(
                        fontFamily: 'Courier',
                        fontSize: 16.0,
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    const WidgetSpan(
                      child: SizedBox(width: 20),
                    ),
                    TextSpan(
                      text: '${DateFormat('HH:mm').format(widget.transaction.createdAt)}',
                      style: const TextStyle(
                        fontFamily: 'Courier',
                        fontSize: 16.0,
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
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
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
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
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

