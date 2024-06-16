import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/item.dart';
import 'item_service.dart';

class ApiService implements ItemService {
  static const String apiUrl = 'https://freetestapi.com/api/v1/books';

  @override
  Future<List<Item>> fetchItems() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => Item.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load items');
    }
  }
}
