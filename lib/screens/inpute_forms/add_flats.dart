import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:hisab/main.dart';
import 'package:hisab/utils/helper_functions.dart';

import '../../database/app_database.dart';

void showFlatsInputDialog(BuildContext context) {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController areaController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  const List<String> flatTypes = <String>['1BHK', '2BHK', '3BHK', '4BHK'];
  String? selectedFlatType;
  bool isSold = false;

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Add Flat'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Form(
                child: Column(
                  children: [
                    TextFormField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        hintText: 'Enter Flat Name',
                        labelText: 'Name *',
                      ),
                      validator: (String? value) {
                        return (value != null && value.contains('@'))
                            ? 'Do not use the @ char.'
                            : null;
                      },
                    ),
                    const SizedBox(height: 5.0),
                    TextFormField(
                      controller: areaController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: 'Area',
                        labelText: 'Area *',
                      ),
                      validator: (String? value) {
                        return (value != null && value.contains('@'))
                            ? 'Do not use the @ char.'
                            : null;
                      },
                    ),
                    const SizedBox(height: 5.0),
                    DropdownButtonFormField<String>(
                      value: selectedFlatType,
                      decoration: const InputDecoration(
                        labelText: 'Flat Type',
                      ),
                      items: flatTypes
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        selectedFlatType = newValue;
                      },
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select a flat type';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 5.0),
                    TextFormField(
                      controller: priceController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: 'Rate per sq foot',
                        labelText: 'Rate *',
                      ),
                      validator: (String? value) {
                        return (value != null && value.contains('@'))
                            ? 'Do not use the @ char.'
                            : null;
                      },
                    ),
                    const SizedBox(height: 5.0),
                    Row(
                      children: [
                        Checkbox(
                          value: isSold,
                          onChanged: (bool? value) {
                            isSold = value ?? false;
                          },
                        ),
                        const Text('Is Sold ?')
                      ],
                    ),
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
            onPressed: () async {
              final name = nameController.text;
              final area = int.tryParse(areaController.text) ?? 0;
              final rate = int.tryParse(priceController.text) ?? 0;

              final flat = FlatsCompanion(
                name: drift.Value(name),
                area: drift.Value(area),
                type: drift.Value(selectedFlatType!),
                rate: drift.Value(rate),
                isSold: drift.Value(isSold),
                siteId: const drift.Value(1), // Replace with actual siteId
              );

              await database.insertFlat(flat).then((value) {
                HFunction.showFlushBarSuccess(
                    context: context,
                    message: "Flat was successfully added",
                    afterPop: () {
                      Navigator.of(context).pop();
                    });
              });
            },
          ),
        ],
      );
    },
  );
}
