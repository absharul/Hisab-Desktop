import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:drift/drift.dart' as drift;
import '../../database/app_database.dart';
import '../../main.dart';
import '../../routes/route.dart';
import '../../utils/helper_functions.dart';

final formKey = GlobalKey<FormState>();

void showPartnerInputDialog({
  required BuildContext context,
  required Site site,
  required List<User> users,
  User? selectedUser,
}) async {
  final TextEditingController shareController = TextEditingController();

  final existingPartners = await database.watchPartners(site.id).first;

  int totalExistingShare =
  existingPartners.fold<int>(0, (sum, partner) => sum + partner.share);

  int remainingShare = 100 - totalExistingShare;

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

                      // Check if input share exceeds remaining share
                      if (parsedValue > remainingShare) {
                        return "The total share cannot exceed $remainingShare";
                      }

                      if (parsedValue <= 0) {
                        return "Value must be greater than 0";
                      }
                    } catch (e) {
                      return "Invalid number";
                    }

                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'Share (Founder: $remainingShare%)',
                  ),
                ),
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

