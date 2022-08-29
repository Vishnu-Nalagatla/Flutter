import 'package:flutter/material.dart';
import 'package:meals_app/stack/main_drawer.dart';

class SettingsScreen extends StatefulWidget {
  static const routeName = "/settings";
  final Function saveFilters;
  final Map<String, bool> currentFilters;
  const SettingsScreen({
    Key? key,
    required this.saveFilters,
    required this.currentFilters,
  }) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _glutenFree = widget.currentFilters['gluten'] as bool;
    _vegetarian = widget.currentFilters['vegetarian'] as bool;
    _vegan = widget.currentFilters['vegan'] as bool;
    _lactoseFree = widget.currentFilters['lactoseFree'] as bool;
  }

  Widget _buildSwitchListTile(
    String title,
    String description,
    bool currentValue,
    Function(bool) updateValue,
  ) {
    return ListView(
      shrinkWrap: true,
      children: [
        SwitchListTile(
          value: currentValue,
          title: Text(title),
          subtitle: Text(description),
          onChanged: updateValue,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Settings")),
      drawer: const MainDrawer(),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: const Text(
              "Adjust your meal selection",
              style: TextStyle(
                fontSize: 25,
              ),
            ),
          ),
          _buildSwitchListTile(
            "Gluten-Free",
            "Only includes gluten-free meals.",
            _glutenFree,
            (newValue) {
              setState(() {
                _glutenFree = newValue;
              });
            },
          ),
          _buildSwitchListTile(
            "Vegetarian-Free",
            "Only includes vegetarian-free meals.",
            _vegetarian,
            (newValue) {
              setState(() {
                _vegetarian = newValue;
              });
            },
          ),
          _buildSwitchListTile(
            "Vegan-Free",
            "Only includes vegan-free meals.",
            _vegan,
            (newValue) {
              setState(() {
                _vegan = newValue;
              });
            },
          ),
          _buildSwitchListTile(
            "LactoseFree-Free",
            "Only includes lactoseFree-free meals.",
            _lactoseFree,
            (newValue) {
              setState(() {
                _lactoseFree = newValue;
              });
            },
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              margin: const EdgeInsets.only(top: 20, right: 20),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(100),
              ),
              child: TextButton(
                onPressed: () {
                  widget.saveFilters({
                    "gluten": _glutenFree,
                    "vegetarian": _vegetarian,
                    "vegan": _vegan,
                    "lactoseFree": _lactoseFree,
                  });
                },
                child: const Text(
                  "Apply Filters",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
