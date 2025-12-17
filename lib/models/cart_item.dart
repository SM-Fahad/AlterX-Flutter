class CartItem {
  final String id;
  final String name;
  final String category;
  final String image;
  final String price;
  String notes;
  final DateTime addedAt;

  CartItem({
    required this.id,
    required this.name,
    required this.category,
    required this.image,
    required this.price,
    this.notes = '',
    required this.addedAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'category': category,
      'image': image,
      'price': price,
      'notes': notes,
      'addedAt': addedAt.toIso8601String(),
    };
  }

  factory CartItem.fromMap(Map<String, dynamic> map) {
    return CartItem(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      category: map['category'] ?? '',
      image: map['image'] ?? '',
      price: map['price'] ?? '',
      notes: map['notes'] ?? '',
      addedAt: DateTime.parse(map['addedAt'] ?? DateTime.now().toIso8601String()),
    );
  }

  CartItem copyWith({
    String? id,
    String? name,
    String? category,
    String? image,
    String? price,
    String? notes,
    DateTime? addedAt,
  }) {
    return CartItem(
      id: id ?? this.id,
      name: name ?? this.name,
      category: category ?? this.category,
      image: image ?? this.image,
      price: price ?? this.price,
      notes: notes ?? this.notes,
      addedAt: addedAt ?? this.addedAt,
    );
  }
}