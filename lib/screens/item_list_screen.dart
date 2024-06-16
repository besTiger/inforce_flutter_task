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
  final TextEditingController controller = TextEditingController();
  String sortingCriteria = 'Name';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Items List'),
        actions: [
          DropdownButton<String>(
            value: sortingCriteria,
            onChanged: (String? newValue) {
              setState(() {
                sortingCriteria = newValue!;
                Provider.of<ItemProvider>(context, listen: false)
                    .setSortingCriteria(sortingCriteria);
              });
            },
            items: <String>['Name', 'SomeFilter' , 'SomeFilter2']
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
          AddItemForm(controller: controller),
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
