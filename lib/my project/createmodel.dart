class Food {
  final int id;
  final String name;
  final String description;
  final String imageUrl;
  final double price;

  Food({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.price,
  });

  // To create a Food object from JSON data (for API response parsing)
  factory Food.fromJson(Map<String, dynamic> json) {
    return Food(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      imageUrl: json['imageUrl'],
      price: json['price'].toDouble(),
    );
  }
}
