import '../models/item.dart';

abstract class ItemService {
  Future<List<Item>> fetchItems();
}
