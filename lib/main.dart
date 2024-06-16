import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/item_provider.dart';
import 'repositories/api_item_repository.dart';
import 'services/api_service.dart';
import 'screens/item_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ItemProvider(ApiItemRepository(ApiService())),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Inforce Flutter Task',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const ItemListScreen(),
      ),
    );
  }
}
