import 'package:e_commerce_shop/providers/product.dart';
import 'package:e_commerce_shop/screens/UserProducts/edit_product_input_form.dart';
import 'package:flutter/material.dart';

class UserProductItemClass {
  Future modalSheet({
    required BuildContext context,
    String? title,
    String? price,
    String? description,
    Product? product,
  }) {
    print("333333333");
    return showModalBottomSheet(
      constraints: const BoxConstraints(
        maxWidth: double.infinity,
        maxHeight: 500,
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(30.0),
        ),
      ),
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
          child: EditProductInputForm(
            product: product,
          ),
        );
      },
    );
  }
}
