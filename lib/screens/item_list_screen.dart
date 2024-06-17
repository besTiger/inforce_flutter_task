import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/item_provider.dart';
import '../widgets/add_item_form.dart';
import '../widgets/item_list.dart';

class ItemListScreen extends StatefulWidget {
  const ItemListScreen({super.key});

  @override
  ItemListScreenState createState() => ItemListScreenState();
}

class ItemListScreenState extends State<ItemListScreen> {
  final TextEditingController _controller = TextEditingController();
  String _sortingCriteria = 'Name';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Items List'),
        actions: [
          DropdownButton<String>(
            value: _sortingCriteria,
            onChanged: (String? newValue) {
              setState(() {
                _sortingCriteria = newValue!;
                Provider.of<ItemProvider>(context, listen: false)
                    .setSortingCriteria(_sortingCriteria);
              });
            },
            items: <String>['Name', 'SomeFilter']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ],
      ),
      body: Column(
        children: [
          AddItemForm(controller: _controller),
          Consumer<ItemProvider>(
            builder: (context, itemProvider, child) {
              if (itemProvider.isLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              return const ItemList();
            },
          ),
        ],
      ),
    );
  }
}
