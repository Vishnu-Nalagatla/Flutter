import 'package:e_commerce_shop/providers/product.dart';
import 'package:e_commerce_shop/providers/products_provider.dart';
import 'package:e_commerce_shop/screens/UserProducts/user_product_item_class.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserProductItem extends StatelessWidget {
  const UserProductItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    UserProductItemClass productItemClass = UserProductItemClass();
    final product = Provider.of<Product>(context);
    print("22222222");
    return LayoutBuilder(
      builder: (context, constraints) {
        return ListTile(
          title: Text(product.title),
          leading: CircleAvatar(
            backgroundImage: NetworkImage(product.imageUrl),
          ),
          trailing: SizedBox(
            width: constraints.maxWidth * 0.25,
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    productItemClass.modalSheet(
                      context: context,
                      product: product,
                    );
                  },
                  icon: const Icon(Icons.edit),
                  color: Theme.of(context).primaryColor,
                ),
                IconButton(
                  onPressed: () {
                    Provider.of<ProductsProvider>(context, listen: false)
                        .deleteProduct(product.id);
                  },
                  icon: const Icon(Icons.delete),
                  color: Theme.of(context).errorColor,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
