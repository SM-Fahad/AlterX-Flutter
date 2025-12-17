import 'package:alterx_flutter/models/cart_item.dart';

class Order {
  final String id;
  final String userId;
  final List<CartItem> items;
  final DateTime pickupDate;
  final String pickupTime;
  final String status;
  final DateTime createdAt;
  final double totalAmount;

  Order({
    required this.id,
    required this.userId,
    required this.items,
    required this.pickupDate,
    required this.pickupTime,
    required this.status,
    required this.createdAt,
    required this.totalAmount,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'items': items.map((item) => item.toMap()).toList(),
      'pickupDate': pickupDate.toIso8601String(),
      'pickupTime': pickupTime,
      'status': status,
      'createdAt': createdAt.toIso8601String(),
      'totalAmount': totalAmount,
    };
  }

  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
      id: map['id'] ?? '',
      userId: map['userId'] ?? '',
      items: List<CartItem>.from(
          (map['items'] ?? []).map((x) => CartItem.fromMap(x))),
      pickupDate: DateTime.parse(map['pickupDate'] ?? DateTime.now().toIso8601String()),
      pickupTime: map['pickupTime'] ?? '',
      status: map['status'] ?? 'pending',
      createdAt: DateTime.parse(map['createdAt'] ?? DateTime.now().toIso8601String()),
      totalAmount: (map['totalAmount'] ?? 0.0).toDouble(),
    );
  }
}