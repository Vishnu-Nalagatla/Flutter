import 'package:e_commerce_shop/providers/cart_provider.dart';
import 'package:e_commerce_shop/providers/orders_provider.dart';
import 'package:e_commerce_shop/screens/cart/cart_item.dart';
import 'package:e_commerce_shop/screens/orders/orders_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart-screen';
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    final cartProduct = cart.cartItems;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
      ),
      body: Column(
        children: [
          Card(
            margin: const EdgeInsets.all(15),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Text(
                    'Total ',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  Chip(
                    elevation: 6,
                    label: Text(
                      cart.totalAmount.toStringAsFixed(2),
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  TextButton(
                    onPressed: () {
                      Provider.of<OrdersProvider>(context, listen: false)
                          .addOrders(
                        cartProduct.values.toList(),
                        cart.totalAmount,
                      );
                      cart.clearCart();
                      Navigator.of(context).pushReplacementNamed(
                        OrdersScreen.routeName,
                      );
                    },
                    child: const Text(
                      "ORDER NOW",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: cart.cartItems.length,
              itemBuilder: (ctx, i) => CartItem(
                id: cartProduct.values.toList()[i].productId,
                title: cartProduct.values.toList()[i].title,
                quantity: cartProduct.values.toList()[i].quantity,
                price: cartProduct.values.toList()[i].price,
              ),
            ),
          )
        ],
      ),
    );
  }
}
