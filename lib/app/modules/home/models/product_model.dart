class Product {
  final String imageUrl;
  final String title;
  final String price;

  Product({
    required this.imageUrl,
    required this.title,
    required this.price,
  });

  // Convert Product to Map for saving in shared preferences
  Map<String, dynamic> toMap() {
    return {
      'imageUrl': imageUrl,
      'title': title,
      'price': price,
    };
  }

  // Convert Map to Product
  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      imageUrl: map['imageUrl'],
      title: map['title'],
      price: map['price'],
    );
  }
}
