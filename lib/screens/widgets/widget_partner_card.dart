import 'package:flutter/material.dart';
import 'package:hisab/database/app_database.dart';
import 'package:hisab/main.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

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
                  fontSize: 20.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Share: ${widget.partner.share}",
                style: const TextStyle(
                  fontFamily: 'Courier', // Old-school font
                  fontSize: 20.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // Add more text or widgets here if needed
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
                  print("Edit partners detail");
                },
                tooltip: "Edit Partner list", // For accessibility
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
