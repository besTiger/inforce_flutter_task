import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/item_provider.dart';

class AddItemForm extends StatelessWidget {
  final TextEditingController controller;

  const AddItemForm({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              decoration: const InputDecoration(labelText: 'Add Item'),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Provider.of<ItemProvider>(context, listen: false).addItem(controller.text);
              controller.clear();
            },
          ),
        ],
      ),
    );
  }
}
