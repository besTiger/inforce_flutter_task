class Item {
  final String name;

  Item({required this.name});

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      name: json['title'],
    );
  }

  Map<String, dynamic> toJson() => {
        'title': name,
      };
}
