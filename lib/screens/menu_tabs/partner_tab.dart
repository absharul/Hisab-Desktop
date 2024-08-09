import 'package:flutter/material.dart';
import 'package:hisab/main.dart';
import 'package:hisab/screens/inpute_forms/add_partner.dart';
import 'package:hisab/screens/widgets/widget_partner_card.dart';

import '../../database/app_database.dart';

class PartnerTab extends StatefulWidget {
  final Site site;

  const PartnerTab({super.key, required this.site});

  @override
  State<PartnerTab> createState() => _PartnerTabState();
}

class _PartnerTabState extends State<PartnerTab> {
  List<User> usersList = [];
  @override
  void initState() {
    super.initState();
    getAllUsers();
  }

  void getAllUsers() async {
    final users = await database.getUsers();
    setState(() {
      usersList = users;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<List<Partner>>(
          stream: database.watchPartners(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            final partners = snapshot.data ?? [];
            return ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: partners.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 16.0),
                  child: WidgetPartnerCard(partner: partners[index]),
                );
              },
            );
          }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff4EA6B2),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(50))),
        onPressed: () {
          showPartnerInputDialog(
              context: context, site: widget.site, users: usersList);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
