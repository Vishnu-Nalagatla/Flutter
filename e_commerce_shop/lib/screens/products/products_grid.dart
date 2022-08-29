import 'package:e_commerce_shop/providers/product.dart';
import 'package:e_commerce_shop/providers/products_provider.dart';
import 'package:e_commerce_shop/screens/products/product_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductsGrid extends StatelessWidget {
  final bool showFavs;
  const ProductsGrid({Key? key, required this.showFavs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<ProductsProvider>(context);
    final products = showFavs ? productsData.favoriteItems : productsData.items;
    print("000000000000 ${products}");
    return products.isNotEmpty
        ? GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 3 / 2,
            ),
            itemCount: products.length,
            itemBuilder: (ctx, i) {
              print("1111111111111111");
              // Us the ChangeNotifierProvider.value() when it is a List or Grid.
              // cause it will be mostly useful in those Array.
              return ChangeNotifierProvider.value(
                value: products[i],
                child: ProductItem(
                    // id: products[i].id,
                    // title: products[i].title,
                    // imageUrl: products[i].imageUrl,
                    ),
              );
            },
          )
        : const Text("You Don't have any Favorites try add some products");
  }
}
