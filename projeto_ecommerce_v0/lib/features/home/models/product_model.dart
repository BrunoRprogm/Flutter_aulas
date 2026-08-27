class Product {
  final String name;
  final String imageUrl;
  final String brand;
  final double price;

  Product({
    required this.name,
    required this.imageUrl,
    required this.brand,
    required this.price,
  });

  factory Product.fromJson(Map<String, dynamic> map) {
    return Product(
      name: map['name'],
      imageUrl: map['imageUrl'],
      brand: map['brand'],
      price: map['price'],
    );
  }
}
