// import 'package:flutter/material.dart';
// import 'package:hisab/controllers/transaction_controller.dart';
// import 'package:hisab/database/app_database.dart';
// import 'package:hisab/main.dart';
// import 'package:hisab/utils/helper_functions.dart';
// import 'package:intl/intl.dart';
//
// class WidgetTransactionCard extends StatefulWidget {
//   final Transaction transaction;
//   const WidgetTransactionCard({super.key, required this.transaction});
//
//   @override
//   State<WidgetTransactionCard> createState() => _WidgetTransactionCardState();
// }
//
// class _WidgetTransactionCardState extends State<WidgetTransactionCard> {
//   String from = "";
//   String to = "";
//   String fromBankName = "";
//   String toBankName = "";
//   List<User?> users = [];
//
//
//   @override
//   void initState() {
//     super.initState();
//     initializeData();
//   }
//
//   void initializeData() async {
//     final fromEntity =
//         await database.getEntityPaymentMethod(widget.transaction.fromId);
//     final toEntity =
//         await database.getEntityPaymentMethod(widget.transaction.toId);
//
//     final fromusers = database.getUsers();
//
//     if (fromEntity != null && toEntity != null) {
//       final fromUser = await HFunction.getFromUser(
//           entityId: fromEntity.entityId, entityType: fromEntity.entityType);
//
//       final toUser = await HFunction.getFromUser(
//           entityType: toEntity.entityType, entityId: toEntity.entityId);
//
//       setState(() {
//         from = fromUser?.name ?? "Unknown User"; // Fallback value
//         to = toUser?.name ?? "Unknown User"; // Fallback value
//       });
//     } else {
//       setState(() {
//         from = "Unknown Entity"; // Handle missing fromEntity
//         to = "Unknown Entity"; // Handle missing toEntity
//       });
//     }
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
//       padding: const EdgeInsets.all(16.0),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         border: Border.all(color: Colors.black, width: 0.5),
//         borderRadius:
//             BorderRadius.circular(0), // No rounded corners for old-school look
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 "Transaction Id: ${widget.transaction.id.toString()}",
//                 style: const TextStyle(
//                   fontFamily: 'Courier', // Old-school font
//                   fontSize: 20.0,
//                   color: Colors.black,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const SizedBox(height: 5),
//               Row(
//                 children: [
//                   Text(
//                     'From: $from',
//                     style: const TextStyle(
//                       fontFamily: 'Courier', // Old-school font
//                       fontSize: 16.0,
//                       color: Colors.black,
//                       fontWeight: FontWeight.normal,
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 5),
//               Row(
//                 children: [
//                   Text(
//                     'To: $to',
//                     style: const TextStyle(
//                       fontFamily: 'Courier', // Old-school font
//                       fontSize: 16.0,
//                       color: Colors.black,
//                       fontWeight: FontWeight.normal,
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 5),
//               Text(
//                 'Amount: ₹ ${widget.transaction.amount}',
//                 style: const TextStyle(
//                   fontFamily: 'Courier', // Old-school font
//                   fontSize: 16.0,
//                   color: Colors.black,
//                   fontWeight: FontWeight.normal,
//                 ),
//               ),
//               const SizedBox(height: 5),
//               // Row(
//               //   children: [
//               //     Text(
//               //       'Remarks: ${widget.transaction.remarks}',
//               //       style: const TextStyle(
//               //         fontFamily: 'Courier', // Old-school font
//               //         fontSize: 16.0,
//               //         color: Colors.black,
//               //         fontWeight: FontWeight.normal,
//               //       ),
//               //     ),
//               //     const SizedBox(width: 200),
//               //     Text(
//               //       ' ${DateFormat('dd/MM/yyyy HH:mm').format(widget.transaction.createdAt)}',
//               //       style: const TextStyle(
//               //         fontFamily: 'Courier', // Old-school font
//               //         fontSize: 16.0,
//               //         color: Colors.black,
//               //         fontWeight: FontWeight.normal,
//               //       ),
//               //     ),
//               //   ],
//               // ),
//               RichText(
//                 text: TextSpan(
//                   children: [
//                     TextSpan(
//                       text: 'Remarks: ${widget.transaction.remarks} ',
//                       style: const TextStyle(
//                         fontFamily: 'Courier',
//                         fontSize: 16.0,
//                         color: Colors.black,
//                         fontWeight: FontWeight.normal,
//                       ),
//                     ),
//                     const WidgetSpan(
//                       child: SizedBox(width: 100),
//                     ),
//                     TextSpan(
//                       text:
//                           '${DateFormat('dd/MM/yyyy').format(widget.transaction.createdAt)} ',
//                       style: const TextStyle(
//                         fontFamily: 'Courier',
//                         fontSize: 16.0,
//                         color: Colors.black,
//                         fontWeight: FontWeight.normal,
//                       ),
//                     ),
//                     const WidgetSpan(
//                       child: SizedBox(width: 20),
//                     ),
//                     TextSpan(
//                       text: DateFormat('HH:mm a')
//                           .format(widget.transaction.createdAt),
//                       style: const TextStyle(
//                         fontFamily: 'Courier',
//                         fontSize: 16.0,
//                         color: Colors.black,
//                         fontWeight: FontWeight.normal,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//           const Expanded(child: SizedBox()),
//           const SizedBox(width: 100),
//           Column(
//             children: [
//               IconButton(
//                 icon: const Icon(Icons.delete),
//                 onPressed: () async {
//                   final confirm = await showDialog(
//                     context: context,
//                     builder: (ctx) => AlertDialog(
//                       title: const Text('Delete Transaction'),
//                       content: const Text(
//                           'Are you sure you want to delete this Transaction?'),
//                       actions: [
//                         TextButton(
//                           onPressed: () => Navigator.of(ctx).pop(false),
//                           child: const Text('Cancel'),
//                         ),
//                         TextButton(
//                           onPressed: () => Navigator.of(ctx).pop(true),
//                           child: const Text('Delete'),
//                         ),
//                       ],
//                     ),
//                   );
//
//                   if (confirm == true) {
//                     try {
//                       await transactionController.delete(widget.transaction);
//                       HFunction.showFlushBarSuccess(
//                         // ignore: use_build_context_synchronously
//                         context: context,
//                         message: "Successfully deleted the Transaction",
//                       );
//                     } catch (error) {
//                       HFunction.showFlushBarError(
//                         // ignore: use_build_context_synchronously
//                         context: context,
//                         message: "Failed to delete the Transaction: $error",
//                       );
//                     }
//                   }
//                 },
//               ),
//               const Text("Delete"),
//             ],
//           ),
//           const SizedBox(width: 50),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:hisab/controllers/transaction_controller.dart';
import 'package:hisab/database/app_database.dart';
import 'package:hisab/main.dart';
import 'package:hisab/utils/helper_functions.dart';
import 'package:intl/intl.dart';

class WidgetTransactionCard extends StatefulWidget {
  final Transaction transaction;
  final Site site;
  const WidgetTransactionCard(
      {super.key, required this.transaction, required this.site});

  @override
  State<WidgetTransactionCard> createState() => _WidgetTransactionCardState();
}

class _WidgetTransactionCardState extends State<WidgetTransactionCard> {
  String from = "";
  String to = "";
  bool transactAmount = false;

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

    if (fromEntity != null && toEntity != null) {
      final fromUser = await HFunction.getFromUser(
          entityId: fromEntity.entityId, entityType: fromEntity.entityType);
      final toUser = await HFunction.getFromUser(
          entityType: toEntity.entityType, entityId: toEntity.entityId);

      setState(() {
        from = fromUser?.name ?? "Unknown User"; // Fallback value
        to = toUser?.name ?? "Unknown User"; // Fallback value

        // Determine the transaction direction
        if (fromEntity.entityType.contains('User')) {
          // Replace 'siteId' with actual site ID
          transactAmount = true; // Credit icon
        } else {
          transactAmount = false; // Debit icon
        }
      });
    } else {
      setState(() {
        from = "Unknown Entity"; // Handle missing fromEntity
        to = "Unknown Entity"; // Handle missing toEntity
        // Default icon for error
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black, width: 0.5),
        borderRadius: BorderRadius.circular(0), // No rounded corners
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
                  fontFamily: 'Courier',
                  fontSize: 20.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                'From: $from',
                style: const TextStyle(
                  fontFamily: 'Courier',
                  fontSize: 16.0,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                'To: $to',
                style: const TextStyle(
                  fontFamily: 'Courier',
                  fontSize: 16.0,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 5),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Remarks: ${widget.transaction.remarks} ',
                      style: const TextStyle(
                        fontFamily: 'Courier',
                        fontSize: 16.0,
                        color: Colors.black,
                      ),
                    ),
                    const WidgetSpan(child: SizedBox(width: 100)),
                    TextSpan(
                      text:
                          '${DateFormat('dd/MM/yyyy').format(widget.transaction.createdAt)} ',
                      style: const TextStyle(
                        fontFamily: 'Courier',
                        fontSize: 16.0,
                        color: Colors.black,
                      ),
                    ),
                    const WidgetSpan(child: SizedBox(width: 20)),
                    TextSpan(
                      text: DateFormat('HH:mm a')
                          .format(widget.transaction.createdAt),
                      style: const TextStyle(
                        fontFamily: 'Courier',
                        fontSize: 16.0,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Expanded(child: SizedBox()),
          const SizedBox(width: 10),
          Text(
            "₹ ${widget.transaction.amount}",
            style: TextStyle(
              color: transactAmount ? Colors.green : Colors.red, // Conditional color
              fontSize: 18.0, // You can customize the font size here
              fontFamily: 'Courier', // Ensure consistent styling
            ),
          ),
          const SizedBox(width: 50),
          Column(
            children: [
              IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () async {
                  final confirm = await showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      title: const Text('Delete Transaction'),
                      content: const Text(
                          'Are you sure you want to delete this Transaction?'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(ctx).pop(false),
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () => Navigator.of(ctx).pop(true),
                          child: const Text('Delete'),
                        ),
                      ],
                    ),
                  );

                  if (confirm == true) {
                    try {
                      await transactionController.delete(widget.transaction);
                      HFunction.showFlushBarSuccess(
                        context: context,
                        message: "Successfully deleted the Transaction",
                      );
                    } catch (error) {
                      HFunction.showFlushBarError(
                        context: context,
                        message: "Failed to delete the Transaction: $error",
                      );
                    }
                  }
                },
              ),
              const Text("Delete"),
            ],
          ),
          const SizedBox(width: 50),
        ],
      ),
    );
  }
}
