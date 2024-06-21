import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const entities = [
  {"id": "user", "label": "User"},
  {"id": "firm", "label": "Firm"},
  {"id": "site", "label": "Site"},
  {"id": "bank", "label": "Bank Accounts"}
];

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        title: const Text('Hisab App'),
      ),
      // Generate a grid of cards
      body: Card(
        elevation: 2,
        child: InkWell(
          onTap: () {
            context.go("/users");
          },
          child: const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text("Users"),
          ),
        ),
      ),
    );
  }
}
