import 'package:e_commerce_shop/providers/cart_provider.dart';
import 'package:flutter/material.dart';

class OrderItemClass {
  final String id;
  final double amount;
  final List<CartItemClass> products;
  final DateTime dateTime;

  OrderItemClass({
    required this.id,
    required this.amount,
    required this.products,
    required this.dateTime,
  });
}

class OrdersProvider with ChangeNotifier {
  List<OrderItemClass> _orders = [];
  List<OrderItemClass> get orderItems {
    return [..._orders];
  }

  void addOrders(List<CartItemClass> cartProducts, double total) {
    _orders.insert(
      0,
      OrderItemClass(
        id: DateTime.now().toString(),
        amount: total,
        products: cartProducts,
        dateTime: DateTime.now(),
      ),
    );
    notifyListeners();
  }
}
