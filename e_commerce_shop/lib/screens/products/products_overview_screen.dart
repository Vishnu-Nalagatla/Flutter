import 'package:e_commerce_shop/common/app_drawer.dart';
import 'package:e_commerce_shop/common/cart_badge.dart';
import 'package:e_commerce_shop/providers/cart_provider.dart';
import 'package:e_commerce_shop/screens/cart/cart_screen.dart';
import 'package:e_commerce_shop/screens/products/products_grid.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum FilterOptions {
  Favorites,
  All,
}

class ProductsOverViewScreen extends StatefulWidget {
  const ProductsOverViewScreen({super.key});

  @override
  State<ProductsOverViewScreen> createState() => _ProductsOverViewScreenState();
}

class _ProductsOverViewScreenState extends State<ProductsOverViewScreen> {
  var _showFavoriteOnly = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My SHop"),
        actions: <Widget>[
          PopupMenuButton(
            icon: const Icon(Icons.more_vert),
            onSelected: (FilterOptions value) {
              setState(() {
                if (value == FilterOptions.Favorites) {
                  _showFavoriteOnly = true;
                } else {
                  _showFavoriteOnly = false;
                }
              });
            },
            itemBuilder: (_) => const [
              PopupMenuItem(
                value: FilterOptions.Favorites,
                child: Text("Your Favorites"),
              ),
              PopupMenuItem(
                value: FilterOptions.All,
                child: Text("Show All"),
              )
            ],
          ),
          Consumer<CartProvider>(
            builder: (ctx, cartData, inChild) => CartBadge(
              value: cartData.cartItemsCount.toString(),
              child: inChild ?? Container(),
            ),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
              icon: const Icon(Icons.shopping_cart),
            ),
          )
        ],
      ),
      drawer: const AppDrawer(),
      body: ProductsGrid(
        showFavs: _showFavoriteOnly,
      ),
    );
  }
}
