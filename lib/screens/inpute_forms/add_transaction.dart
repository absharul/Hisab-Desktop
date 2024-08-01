import 'package:flutter/material.dart';

void showTransactionInputDialog(BuildContext context) {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController areaController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController chequeController = TextEditingController();

  const List<String> Entityfrom = <String>['Customer', 'Vendor', 'Partner',];
  String? selectedEntityType;

  const List<String> Transactiontypes = <String>['Credit/Debit', 'Cash', 'Cheque',];
  String? selectedTransactiontype;

  bool isSold = false;

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Add Transaction'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Form(
                child: Column(
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.datetime,
                      controller: nameController,
                      decoration: const InputDecoration(
                        hintText: 'Enter Date',
                        labelText: 'Date *',
                      ),
                      validator: (String? value) {
                        return (value != null && value.contains('@'))
                            ? 'Do not use the @ char.'
                            : null;
                      },
                    ),  //flat name
                    DropdownButtonFormField<String>(
                      value: selectedEntityType,
                      decoration: const InputDecoration(
                        labelText: 'Entity',
                      ),
                      items: Entityfrom.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        selectedEntityType = newValue;
                      },
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'please select the entity type';
                        }
                        return null;
                      },
                    ),
                    DropdownButtonFormField<String>(
                      value: selectedTransactiontype,
                      decoration: const InputDecoration(
                        labelText: 'Transaction Method',
                      ),
                      items: Transactiontypes.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        selectedTransactiontype = newValue;
                      },
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return '';
                        }
                        return null;
                      },
                    ),
                    if (selectedTransactiontype == 'Cheque')
                      TextFormField(
                        controller: chequeController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          hintText: 'Cheque No.',
                          labelText: 'Cheque No. *',
                        ),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the cheque number';
                          }
                          return null;
                        },
                      ),
                    TextFormField(
                      controller: priceController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: 'Amount',
                        labelText: 'Amount *',
                      ),
                      validator: (String? value) {
                        return (value != null && value.contains('@'))
                            ? 'Do not use the @ char.'
                            : null;
                      },
                    ), //Rate per sq foot
                  ],
                ),
              )
            ],
          ),
        ),
        actions: [
          TextButton(
            child: Text('Cancel'),
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
              String flatDescription = descriptionController.text;


              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
