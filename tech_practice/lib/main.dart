import 'package:flutter/material.dart';
import 'package:tech_practice/settings_row.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Hello'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget heading(String title, EdgeInsetsGeometry margin) {
    return Container(
      margin: margin,
      child: Text(
        title,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                margin: const EdgeInsets.only(top: 50),
                child: const Icon(Icons.arrow_back_ios_new_sharp)),
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: const Text(
                "Settings",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
            ),
            heading("Account", const EdgeInsets.only(top: 50)),
            SettingsRow(
              title: "Vishnu",
              color: Colors.grey.shade300,
              startIcon: Icons.person,
              iconColor: Colors.black,
            ),
            heading("Settings", const EdgeInsets.only(top: 30)),
            const SettingsRow(
              title: "Language",
              subTitle: 'English',
              color: Colors.orange,
            ),
            const SettingsRow(
              title: "Notifications",
              color: Colors.blue,
              startIcon: Icons.notifications,
            ),
            const SettingsRow(
              title: "Dark Mode",
              subTitle: 'Off',
              color: Colors.green,
              startIcon: Icons.star_half,
              buttonType: ButtonType.switchType,
            ),
            const SettingsRow(
              title: "Help",
              color: Colors.pink,
              startIcon: Icons.help,
            ),
          ],
        ),
      ),
    ));
  }
}
