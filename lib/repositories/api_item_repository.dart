import '../models/item.dart';
import '../services/item_service.dart';
import 'item_repository.dart';

class ApiItemRepository implements ItemRepository {
  final ItemService itemService;

  ApiItemRepository(this.itemService);

  List<Item> _items = [];

  @override
  Future<List<Item>> getItems() async {
    _items = await itemService.fetchItems();
    _sortItems();
    return _items;
  }

  @override
  void addItem(String name) {
    if (name.isNotEmpty) {
      _items.add(Item(name: name));
      _sortItems();
    }
  }

  @override
  void removeItem(Item item) {
    _items.remove(item);
  }

  void _sortItems() {
    _items.sort((a, b) => a.name.compareTo(b.name));
  }
}
