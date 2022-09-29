import 'package:flutter/foundation.dart';

class Product with ChangeNotifier {
  final String id;
  String title;
  String description;
  double price;
  String imageUrl;
  bool isFavorite;
  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
    this.isFavorite = false,
  });
  void toggleFavoriteStatus() {
    isFavorite = !isFavorite;
    notifyListeners();
  }

  void updateProduct(Product product) {
    title = product.title;
    description = product.description;
    price = product.price;
    imageUrl = product.imageUrl;
    notifyListeners();
  }
}
