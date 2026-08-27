class Category {
  final String name;
  final String imageUrl;

  Category({required this.name, required this.imageUrl});

  factory Category.fromJson(Map<String, dynamic> map) {
    return Category(name: map['name'], imageUrl: map['imageUrl']);
  }
}
