import 'package:flutter/material.dart';

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
                    ), //flat name
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
                    ), // area
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
                    ), //type
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
                    ), //Rate per sq foot
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
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
