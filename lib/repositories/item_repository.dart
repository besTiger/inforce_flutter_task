import '../models/item.dart';

abstract class ItemRepository {
  Future<List<Item>> getItems();
  void addItem(String name);
  void removeItem(Item item);
}
