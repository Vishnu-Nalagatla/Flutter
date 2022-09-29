import 'package:e_commerce_shop/common/app_drawer.dart';
import 'package:e_commerce_shop/providers/products_provider.dart';
import 'package:e_commerce_shop/screens/UserProducts/edit_product_custom_modal.dart';
import 'package:e_commerce_shop/screens/UserProducts/user_product_item.dart';
import 'package:e_commerce_shop/screens/UserProducts/user_product_item_class.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserProductsScreen extends StatelessWidget {
  static const routeName = '/user-products';
  const UserProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserProductItemClass productItemClass = UserProductItemClass();

    print("1111111");
    final products = Provider.of<ProductsProvider>(context).items;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Products'),
        actions: [
          IconButton(
            onPressed: (() {
              productItemClass.modalSheet(context: context);
            }),
            icon: const Icon(Icons.add),
          )
        ],
      ),
      drawer: const AppDrawer(),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (ctx, index) {
                return ChangeNotifierProvider.value(
                  value: products[index],
                  child: Column(
                    children: const [
                      UserProductItem(),
                      Divider(),
                    ],
                  ),
                );
              },
            ),
          ),
          // _openModal ? EditProductModal() : Container(),
        ],
      ),
    );
  }
}
