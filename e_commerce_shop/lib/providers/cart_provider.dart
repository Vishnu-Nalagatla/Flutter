import 'package:flutter/material.dart';

class CartItemClass {
  final String productId;
  final String title;
  final int quantity;
  final double price;
  CartItemClass({
    required this.productId,
    required this.title,
    required this.quantity,
    required this.price,
  });
}

class CartProvider with ChangeNotifier {
  Map<String, CartItemClass> _cartItems = {};

  Map<String, CartItemClass> get cartItems {
    return {..._cartItems};
  }

  double get totalAmount {
    var total = 0.0;
    _cartItems.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  int get cartItemsCount {
    return _cartItems.length;
  }

  void addItem(String productId, String title, double price) {
    if (_cartItems.containsKey(productId)) {
      _cartItems.update(
        productId,
        (exItems) => CartItemClass(
          productId: exItems.productId,
          title: exItems.title,
          quantity: exItems.quantity + 1,
          price: exItems.price,
        ),
      );
    } else {
      _cartItems.putIfAbsent(
        productId,
        () => CartItemClass(
          productId: productId,
          title: title,
          quantity: 1,
          price: price,
        ),
      );
    }
    notifyListeners();
  }

  void removeSingleItem(String id) {
    if (!_cartItems.containsKey(id)) {
      return;
    }
    if (_cartItems[id]!.quantity > 1) {
      _cartItems.update(
        id,
        (exValue) => CartItemClass(
          productId: exValue.productId,
          title: exValue.title,
          quantity: exValue.quantity - 1,
          price: exValue.price,
        ),
      );
    } else {
      _cartItems.remove(id);
    }
    notifyListeners();
  }

  void removeCartItem(String id) {
    _cartItems.remove(id);
    notifyListeners();
  }

  void clearCart() {
    _cartItems = {};
    notifyListeners();
  }
}
