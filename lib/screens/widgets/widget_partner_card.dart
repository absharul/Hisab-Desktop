import 'package:flutter/material.dart';
import 'package:hisab/controllers/partner_controller.dart';
import 'package:hisab/database/app_database.dart';
import 'package:hisab/main.dart';
import 'package:hisab/utils/helper_functions.dart';

class WidgetPartnerCard extends StatefulWidget {
  final Partner partner;
  const WidgetPartnerCard({super.key, required this.partner});

  @override
  State<WidgetPartnerCard> createState() => _WidgetPartnerCardState();
}

class _WidgetPartnerCardState extends State<WidgetPartnerCard> {
  String userName = "";
  @override
  void initState() {
    super.initState();
    initializeData();
  }

  initializeData() async {
    final user = await database.getUserById(widget.partner.builderId);
    setState(() {
      userName = user.name;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
                "Name: $userName",
                style: const TextStyle(
                  fontFamily: 'Courier', // Old-school font
                  fontSize: 18.0,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Share: ${widget.partner.share}",
                style: const TextStyle(
                  fontFamily: 'Courier', // Old-school font
                  fontSize: 18.0,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              // Add more text or widgets here if needed
            ],
          ),
          const Expanded(child: SizedBox()),
          Column(
            children: [
              IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () {
                  // Add your desired action here
                  _editPartner(context);
                  print("Edit partners detail");
                },
                tooltip: "Edit Partner list", // For accessibility
              ),
              const Text(
                "Edit",
                style: TextStyle(fontSize: 16.0,),
              ),
            ],
          ),
          const SizedBox(width: 100),
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
                      await partnerController.delete(widget.partner);
                      HFunction.showFlushBarSuccess(
                        // ignore: use_build_context_synchronously
                        context: context,
                        message: "Successfully deleted the Transaction",
                      );
                    } catch (error) {
                      HFunction.showFlushBarError(
                        // ignore: use_build_context_synchronously
                        context: context,
                        message: "Failed to delete the Transaction: $error",
                      );
                    }
                  }
                },
                tooltip: "Delete", // For accessibility
              ),
              const Text(
                "Delete",
                style: TextStyle(fontSize: 16.0,),
              ),
              const SizedBox(width: 100),
            ],
          ),
        ],
      ),
    );
  }

  void _editPartner(BuildContext context) {
    final nameController = TextEditingController(text: userName);
    final shareController = TextEditingController(text: widget.partner.share.toString());

    showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: const Text("Edit Partner"),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(hintText: "Name"),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: shareController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(hintText: "Share"),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(ctx).pop(); // Close the dialog
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                try {
                  final updatedPartner = widget.partner.copyWith(
                    builderId: widget.partner.builderId, // Keep existing ID
                    share: int.parse(shareController.text),
                  );
                  await partnerController.update(updatedPartner);
                  Navigator.of(ctx).pop(); // Close the dialog
                  HFunction.showFlushBarSuccess(
                    context: context,
                    message: "Successfully updated the partner",
                  );
                } catch (e) {
                  HFunction.showFlushBarError(context: context, message: e.toString());
                }
              },
              child: const Text('Update'),
            ),
          ],
        );
      },
    );
  }
}
