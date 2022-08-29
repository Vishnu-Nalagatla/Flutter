import 'package:e_commerce_shop/providers/cart_provider.dart';
import 'package:e_commerce_shop/providers/product.dart';
import 'package:e_commerce_shop/screens/products/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatelessWidget {
  // final String id;
  // final String title;
  // final String imageUrl;
  const ProductItem({
    super.key,
    // required this.id,
    // required this.title,
    // required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    // If u want to listen only once even if it gets a update it will not take it.
    // since we gave a Consumer to a particular widget so no problem.... it will update only that.
    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<CartProvider>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        footer: GridTileBar(
            backgroundColor: Colors.black54,
            // Using Consumer is really efficient if u want to render that single widget not the whole component.
            leading: Consumer<Product>(builder: (ctx, dynamic, _) {
              print("2222222222222222222");
              return IconButton(
                color: product.isFavorite ? Colors.red : Colors.white,
                icon: Icon(
                  product.isFavorite ? Icons.favorite : Icons.favorite_border,
                ),
                onPressed: () {
                  product.toggleFavoriteStatus();
                },
              );
            }),
            title: Text(
              product.title,
              textAlign: TextAlign.center,
            ),
            trailing: Card(
              color: Colors.white,
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.shopping_cart),
                    color: Theme.of(context).accentColor,
                    onPressed: () {
                      cart.addItem(
                        product.id,
                        product.title,
                        product.price,
                      );
                    },
                  ),
                ],
              ),
            )),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetailsScreen.routeName,
              arguments: product.id,
            );
          },
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
