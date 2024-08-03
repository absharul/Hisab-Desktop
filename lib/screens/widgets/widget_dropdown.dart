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
  ModelDropdown? selectedValue;

  @override
  void initState() {
    super.initState();
    initializeList();
    selectedValue = widget.selectedValue;
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

        if (selectedValue != null && !items.contains(selectedValue)) {
          selectedValue = null;
        }
        if (selectedValue == null && items.isNotEmpty) {
          selectedValue = items.first;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<ModelDropdown>(
      hint: Text(widget.placeHolder),
      value: selectedValue,
      items: items.map((ModelDropdown item) {
        return DropdownMenuItem<ModelDropdown>(
          value: item,
          child: Text(item.name),
        );
      }).toList(),
      onChanged: (ModelDropdown? newValue) {
        if (newValue != null) {
          setState(() {
            selectedValue = newValue;
          });
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
