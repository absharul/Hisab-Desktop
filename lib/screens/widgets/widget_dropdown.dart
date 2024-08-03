import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hisab/controllers/firm_controller.dart';
import 'package:hisab/models/model_dropdown.dart';

class WidgetDropdown extends StatefulWidget {
  final ModelDropdown? selectedValue;
  final String placeHolder;
  final Function(ModelDropdown) onChanged;

  const WidgetDropdown({
    Key? key,
    required this.onChanged,
    this.selectedValue,
    required this.placeHolder,
  }) : super(key: key);

  @override
  _WidgetDropdownState createState() => _WidgetDropdownState();
}

class _WidgetDropdownState extends State<WidgetDropdown> {
  List<ModelDropdown> items = [];

  @override
  void initState() {
    super.initState();
    // Initialize the selected item with the first item in the list, if available
    initializeList();
  }

  void initializeList() {
    firmController.readAll().then((value) {
      log(value.toString());
      setState(() {
        items = (value)
            .map((e) => ModelDropdown(
                  id: e.id,
                  name: e.name,
                ))
            .toList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<ModelDropdown>(
      hint: Text(widget.placeHolder),
      items: items.map((ModelDropdown item) {
        return DropdownMenuItem<ModelDropdown>(
          value: item,
          child: Text(item.name), // Assuming ModelDropdown has a 'name' field
        );
      }).toList(),
      onChanged: (ModelDropdown? newValue) {
        if (newValue != null) {
          widget.onChanged(newValue);
        }
      },
      isExpanded: true,
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
    );
  }
}
