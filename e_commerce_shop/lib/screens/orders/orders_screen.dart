import 'package:e_commerce_shop/common/app_drawer.dart';
import 'package:e_commerce_shop/providers/orders_provider.dart';
import 'package:e_commerce_shop/screens/orders/order_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrdersScreen extends StatelessWidget {
  static const routeName = '/orders-screen';
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ordersData = Provider.of<OrdersProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Orders"),
      ),
      drawer: const AppDrawer(),
      body: ListView.builder(
        itemCount: ordersData.orderItems.length,
        itemBuilder: (ctx, i) {
          return OrderItem(
            order: ordersData.orderItems[i],
          );
        },
      ),
    );
  }
}
