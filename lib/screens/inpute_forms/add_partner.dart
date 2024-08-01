import 'package:flutter/material.dart';

void showPartnerInputDialog(BuildContext context) {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController areaController = TextEditingController();
  final TextEditingController priceController = TextEditingController();



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
                    TextFormField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        hintText: 'Partner Name',
                        labelText: 'Partner *',
                      ),
                      validator: (String? value) {
                        return (value != null && value.contains('@'))
                            ? 'Do not use the @ char.'
                            : null;
                      },
                    ),  //partner name
                    TextFormField(
                      controller: areaController,
                      decoration: const InputDecoration(
                        hintText: 'Site Name',
                        labelText: 'Site *',
                      ),
                      validator: (String? value) {
                        return (value != null && value.contains('@'))
                            ? 'Do not use the @ char.'
                            : null;
                      },
                    ),  // site name
                    TextFormField(
                      controller: priceController,
                      keyboardType: TextInputType.datetime,
                      decoration: const InputDecoration(
                        hintText: 'Date',
                        labelText: 'Date *',
                      ),
                      validator: (String? value) {
                        return (value != null && value.contains('@'))
                            ? 'Do not use the @ char.'
                            : null;
                      },
                    ), //date
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
              String flatName = nameController.text;
              String flatArea = areaController.text;
              String Rate = priceController.text;


              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
