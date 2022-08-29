import 'package:flutter/material.dart';
import 'package:meals_app/categories/categories_screen.dart';
import 'package:meals_app/categories_plp/meal.dart';
import 'package:meals_app/favorites/favorites_screen.dart';
import 'package:meals_app/stack/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;
  const TabsScreen({Key? key, required this.favoriteMeals}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;
  // late List<Map<String, dynamic>> _pages;
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  // }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    late List<Map<String, dynamic>> _pages = [
      {
        "page": const CategoriesScreen(),
        "title": "Categories",
      },
      {
        "page": FavoritesScreen(favoriteMeals: widget.favoriteMeals),
        "title": "Your Favorites"
      },
    ];

    return Scaffold(
      appBar: AppBar(title: Text(_pages[_selectedPageIndex]['title'])),
      drawer: const MainDrawer(),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        backgroundColor: Colors.pink,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.amber[800],
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
