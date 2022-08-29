import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  Widget drawerList(String title, IconData icon, Function() topHandler) {
    return ListTile(
      leading: Icon(icon, size: 26),
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
      ),
      onTap: topHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            alignment: Alignment.centerLeft,
            color: Colors.orange,
            child: const Text(
              "Cooking Up!",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.pink,
              ),
            ),
          ),
          const SizedBox(height: 20),
          drawerList(
            "Meals",
            Icons.restaurant,
            () {
              Navigator.of(context).pushReplacementNamed("/");
            },
          ),
          drawerList(
            "Settings",
            Icons.settings,
            () {
              Navigator.of(context).pushReplacementNamed("/settings");
            },
          ),
        ],
      ),
    );
  }
}
