import 'package:e_commerce_shop/practice/custom_dropdown.dart';
import 'package:e_commerce_shop/providers/cart_provider.dart';
import 'package:e_commerce_shop/providers/orders_provider.dart';
import 'package:e_commerce_shop/providers/products_provider.dart';
import 'package:e_commerce_shop/screens/UserProducts/user_products_screen.dart';
import 'package:e_commerce_shop/screens/cart/cart_screen.dart';
import 'package:e_commerce_shop/screens/orders/orders_screen.dart';
import 'package:e_commerce_shop/screens/products/product_details_screen.dart';
import 'package:e_commerce_shop/screens/products/products_overview_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProductsProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => OrdersProvider(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.deepOrange,
          fontFamily: "Lato",
        ),
        // home: const UserProductsScreen(),
        // home: const CustomDropdown(),
        home: const ProductsOverViewScreen(),
        routes: {
          ProductDetailsScreen.routeName: (ctx) => const ProductDetailsScreen(),
          CartScreen.routeName: (ctx) => const CartScreen(),
          OrdersScreen.routeName: (ctx) => const OrdersScreen(),
          UserProductsScreen.routeName: (ctx) => const UserProductsScreen(),
        },
      ),
    );
  }
}
