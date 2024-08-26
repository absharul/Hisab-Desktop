import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hisab/main.dart';
import 'package:hisab/screens/widgets/widget_partner_card.dart';
import 'package:drift/drift.dart' as drift;
import '../../database/app_database.dart';
import '../../routes/route.dart';
import '../../utils/helper_functions.dart';

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
    SubCategory? partnerCategory =
        await database.getSubCategoryByName("Partner");
    final users = partnerCategory != null
        ? await database.getUsersByCategoryId(partnerCategory.id)
        : await database.getUsers();
    setState(() {
      usersList = users;
    });
  }

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<List<Partner>>(
          stream: database.watchPartners(widget.site.id),
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
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }

  void showPartnerInputDialog({
    required BuildContext context,
    required Site site,
    required List<User> users,
  }) {
    final TextEditingController shareController = TextEditingController();

    User? selectedUser;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add Partner'),
          content: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  DropdownButtonFormField<User>(
                    value: selectedUser,
                    decoration: const InputDecoration(
                      labelText: 'Select User',
                    ),
                    items: users.map<DropdownMenuItem<User>>((User value) {
                      return DropdownMenuItem<User>(
                        value: value,
                        child: Text(value.name),
                      );
                    }).toList(),
                    onChanged: (User? newValue) {
                      selectedUser = newValue;
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter
                          .digitsOnly, // Allows only digits
                    ],
                    controller: shareController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter a value";
                      }

                      try {
                        int parsedValue = int.parse(value);

                        if (parsedValue > 100) {
                          return "Value must be less than \nor equal to 100";
                        }
                      } catch (e) {
                        return "Invalid number";
                      }

                      return null;
                    },
                    decoration: const InputDecoration(
                      hintText: 'Share Price',
                    ),
                  )
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Save'),
              onPressed: () async {
                if (selectedUser != null && formKey.currentState!.validate()) {
                  try {
                    final partner = PartnersCompanion(
                      siteId: drift.Value(site.id),
                      builderId: drift.Value(selectedUser!.id),
                      share: drift.Value(int.parse(shareController.text)),
                    );
                    await database.insertPartner(partner);
                    router.pop();
                    HFunction.showFlushBarSuccess(
                        context: context,
                        message: "Successfully Added the partner");
                  } catch (error) {
                    HFunction.showFlushBarError(
                        context: context, message: "Error Adding Partner");
                  }
                }
              },
            ),
          ],
        );
      },
    );
  }
}
