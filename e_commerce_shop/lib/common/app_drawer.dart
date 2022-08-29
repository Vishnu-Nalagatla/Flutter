import 'package:e_commerce_shop/screens/orders/orders_screen.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: const Text("Hello Vishnu!"),
            automaticallyImplyLeading: false,
          ),
          ListTile(
            leading: const Icon(Icons.shop),
            title: const Text("Shop"),
            onTap: () {
              Navigator.of(context).pushReplacementNamed("/");
            },
          ),
          const Divider(
            height: 5,
          ),
          ListTile(
            leading: const Icon(Icons.online_prediction_rounded),
            title: const Text("Orders"),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(
                OrdersScreen.routeName,
              );
            },
          ),
        ],
      ),
    );
  }
}
