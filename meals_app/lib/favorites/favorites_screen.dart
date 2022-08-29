import 'package:flutter/material.dart';
import 'package:meals_app/categories_plp/meal.dart';
import 'package:meals_app/categories_plp/product_card.dart';

class FavoritesScreen extends StatelessWidget {
  static const routeName = "/favorites";
  final List<Meal> favoriteMeals;
  const FavoritesScreen({Key? key, required this.favoriteMeals})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Center(
          child: const Text("You have no favorites yet - start adding some!"));
    } else {
      return ListView.builder(
          itemCount: favoriteMeals.length,
          itemBuilder: (ctx, index) {
            return ProductCard(
              product: favoriteMeals[index],
              // removeItem: _removeMeals,
            );
          });
    }
  }
}
