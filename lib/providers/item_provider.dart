import 'package:flutter/material.dart';
import '../models/item.dart';
import '../repositories/item_repository.dart';

class ItemProvider extends ChangeNotifier {
  final ItemRepository itemRepository;
  List<Item> _items = [];
  bool _isLoading = false;
  String _sortingCriteria = 'Name';

  ItemProvider(this.itemRepository) {
    fetchItems();
  }

  List<Item> get items => _items;

  bool get isLoading => _isLoading;

  void fetchItems() async {
    _isLoading = true;
    notifyListeners();
    _items = await itemRepository.getItems();
    _isLoading = false;
    notifyListeners();
  }

  void addItem(String name) {
    itemRepository.addItem(name);
    fetchItems();
  }

  void removeItem(Item item) {
    itemRepository.removeItem(item);
    fetchItems();
  }

  void setSortingCriteria(String criteria) {
    _sortingCriteria = criteria;
    _sortItems();
    notifyListeners();
  }

  void _sortItems() {
    if (_sortingCriteria == 'Name') {
      _items.sort((a, b) => a.name.compareTo(b.name));
    } else {}
  }
}
