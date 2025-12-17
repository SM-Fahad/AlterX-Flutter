class User {
  final String id;
  final String name;
  final String mobile;
  final String address;
  final String city;
  final DateTime createdAt;

  User({
    required this.id,
    required this.name,
    required this.mobile,
    required this.address,
    required this.city,
    required this.createdAt,
  });

  factory User.empty() {
    return User(
      id: '',
      name: '',
      mobile: '',
      address: '',
      city: '',
      createdAt: DateTime.now(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'mobile': mobile,
      'address': address,
      'city': city,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      mobile: map['mobile'] ?? '',
      address: map['address'] ?? '',
      city: map['city'] ?? '',
      createdAt: DateTime.parse(map['createdAt'] ?? DateTime.now().toIso8601String()),
    );
  }

  User copyWith({
    String? id,
    String? name,
    String? mobile,
    String? address,
    String? city,
    DateTime? createdAt,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      mobile: mobile ?? this.mobile,
      address: address ?? this.address,
      city: city ?? this.city,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}