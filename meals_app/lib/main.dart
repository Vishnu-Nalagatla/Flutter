import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:meals_app/categories/categories_screen.dart';
import 'package:meals_app/categories_pdp/product_pdp.dart';
import 'package:meals_app/categories_plp/categories_meals_screen.dart';
import 'package:meals_app/categories_plp/meal.dart';
import 'package:meals_app/data/categories_data.dart';
import 'package:meals_app/settings/settings_screen.dart';
import 'package:meals_app/stack/tabs_screen.dart';

void main() {
  runApp(const MyApp());
}

// This widget is the root of your application.
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    "gluten": false,
    "vegetarian": false,
    "vegan": false,
    "lactoseFree": false,
  };
  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _toggleFavorites(String mealId) {
    final existingIndex =
        _favoriteMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool _isMealFavorites(String mealId) {
    return _favoriteMeals.any((meal) => meal.id == mealId);
  }

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableMeals = DUMMY_MEALS.where((mealItem) {
        if (_filters['gluten'] as bool && !mealItem.isGlutenFree) {
          return false;
        }
        if (_filters['vegetarian'] as bool && !mealItem.isVegetarian) {
          return false;
        }
        if (_filters['vegan'] as bool && !mealItem.isVegan) {
          return false;
        }
        if (_filters['lactoseFree'] as bool && !mealItem.isLactoseFree) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    print(_favoriteMeals);
    return MaterialApp(
      // client: client,
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        canvasColor: const Color(0xFFFFFEE5),
        fontFamily: "Raleway",
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: const TextStyle(
                fontFamily: "Raleway",
                fontSize: 24,
              ),
            ),
      ),
      home: TabsScreen(favoriteMeals: _favoriteMeals),
      routes: {
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(
              availableMeals: _availableMeals,
            ),
        ProductPdp.routeName: (ctx) => ProductPdp(
              toggleFavorites: _toggleFavorites,
              isMealFavorites: _isMealFavorites,
            ),
        SettingsScreen.routeName: (ctx) => SettingsScreen(
              currentFilters: _filters,
              saveFilters: _setFilters,
            ),
      },
    );
  }
}
