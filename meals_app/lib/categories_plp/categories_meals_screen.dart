import 'package:flutter/material.dart';
import 'package:meals_app/categories_plp/meal.dart';
import 'package:meals_app/categories_plp/product_card.dart';
import 'package:meals_app/data/categories_data.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category_meals';
  final List<Meal> availableMeals;

  const CategoryMealsScreen({Key? key, required this.availableMeals})
      : super(key: key);
  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  late String categoryId;
  late String categoryTitle;
  late List<Meal> filteredMealData;
  bool isLoading = false;
  // @override
  // void initState() {
  //   super.initState();
  //   Future.delayed(Duration.zero, () {

  //   });
  // }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!isLoading) {
      print("111111111111111");
      final routeArgs =
          ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
      categoryId = routeArgs['categoryId'];
      categoryTitle = routeArgs['categoryTitle'];
      filteredMealData = widget.availableMeals.where((category) {
        return category.categories.contains(categoryId);
      }).toList();
      isLoading = true;
    }
  }

  void _removeMeals(String id) {
    setState(() {
      filteredMealData.removeWhere((meal) => meal.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    print("===>>> $categoryId  ${filteredMealData.length}");
    return !isLoading
        ? const Scaffold(body: Center(child: CircularProgressIndicator()))
        : Scaffold(
            appBar: AppBar(
              title: Text(categoryTitle),
            ),
            body: ListView.builder(
                itemCount: filteredMealData.length,
                itemBuilder: (ctx, index) {
                  return ProductCard(
                    product: filteredMealData[index],
                    // removeItem: _removeMeals,
                  );
                }),
          );
  }
}
