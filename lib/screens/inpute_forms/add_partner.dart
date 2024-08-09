import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hisab/utils/helper_functions.dart';

import '../../database/app_database.dart';
import '../../main.dart';
import '../../routes/route.dart';

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
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Form(
                child: Column(
                  children: [
                    DropdownButtonFormField<User>(
                      value: selectedUser,
                      decoration: const InputDecoration(
                        labelText: 'Flat Type',
                      ),
                      items: users.map<DropdownMenuItem<User>>(
                              (User value) {
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
                        FilteringTextInputFormatter.digitsOnly, // Allows only digits
                      ],
                      controller: shareController,
                      decoration: const InputDecoration(
                        hintText: 'Share Price',

                      ),

                    ),  //partner name

                  ],
                ),
              )
            ],
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
            onPressed: () async{
              if (selectedUser != null) {
                try {
                  final partner = PartnersCompanion(
                    siteId: drift.Value(site.id),
                    builderId: drift.Value(selectedUser!.id),
                    share: drift.Value(int.parse(shareController.text)),
                  );
                  await database.insertPartner(partner);
                  router.pop();
                  HFunction.showFlushBarSuccess(context: context, message: "Successfully Added the partner");
                }catch(error){
                  HFunction.showFlushBarError(context: context, message: "Error Adding Partner");
                }
              }
            },
          ),
        ],
      );
    },
  );
}
