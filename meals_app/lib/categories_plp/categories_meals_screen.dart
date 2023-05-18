import 'package:flutter/material.dart';
import 'package:meals_app/categories_plp/meal.dart';
import 'package:meals_app/categories_plp/product_card.dart';

class CategoryMealsScreen extends StatefulWidget {
  const CategoryMealsScreen({Key? key, required this.availableMeals})
      : super(key: key);

  static const routeName = '/category_meals';

  final List<Meal> availableMeals;

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
              },
            ),
          );
  }
}
