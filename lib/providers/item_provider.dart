import 'package:flutter/material.dart';
import '../models/item.dart';
import '../services/api_service.dart';

class ItemProvider with ChangeNotifier {
  List<Item> _items = [];
  bool _isLoading = false;
  String _sortingCriteria = 'Name';

  List<Item> get items => _items;
  bool get isLoading => _isLoading;
  String get sortingCriteria => _sortingCriteria;

  ItemProvider() {
    fetchItems();
  }

  void fetchItems() async {
    _isLoading = true;
    notifyListeners();

    _items = await ApiService().fetchItems();

    _isLoading = false;
    _sortItems();
    notifyListeners();
  }

  void addItem(String name) {
    if (name.isNotEmpty) {
      _items.add(Item(name: name));
      _sortItems();
      notifyListeners();
    }
  }

  void removeItem(Item item) {
    _items.remove(item);
    notifyListeners();
  }

  void _sortItems() {
    if (_sortingCriteria == 'Name') {
      _items.sort((a, b) => a.name.compareTo(b.name));
    } else {
      // add sorting if need
    }
  }

  void setSortingCriteria(String criteria) {
    _sortingCriteria = criteria;
    _sortItems();
    notifyListeners();
  }
}
