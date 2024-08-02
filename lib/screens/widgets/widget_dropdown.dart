import 'package:flutter/material.dart';
import 'package:hisab/main.dart';
import 'package:hisab/models/model_dropdown.dart';

class WidgetDropdown extends StatefulWidget {
  final Function(ModelDropdown) onChanged;

  const WidgetDropdown({Key? key, required this.onChanged}) : super(key: key);

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
    database!.getAllFirms().then((value) {
      setState(() {
        items =
            (value).map((e) => ModelDropdown(id: e.id, name: e.name,)).toList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<ModelDropdown>(
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
