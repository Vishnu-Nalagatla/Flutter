import 'package:e_commerce_shop/providers/products_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetailsScreen extends StatelessWidget {
  static const routeName = '/product-detail';
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)?.settings.arguments as String;
    final productsData = Provider.of<ProductsProvider>(context, listen: false);
    final loadedProduct = productsData.findProductById(productId);
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProduct.title),
      ),
      body: LayoutBuilder(
        builder: (ctx, constraints) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: constraints.maxHeight * 0.30,
                  width: double.infinity,
                  child: Image(
                    image: NetworkImage(loadedProduct.imageUrl),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "\$ ${loadedProduct.price}",
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  loadedProduct.description,
                  textAlign: TextAlign.center,
                  softWrap: true,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
