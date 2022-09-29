import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CustomDropdown extends StatefulWidget {
  const CustomDropdown({Key? key}) : super(key: key);

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  List<Map<String, dynamic>> dropVales = [
    {"id": 0, "label": "None", "value": "none"},
    {"id": 1, "label": "One", "value": "one"},
    {"id": 2, "label": "Two", "value": "two"},
    {"id": 3, "label": "Three", "value": "three"},
    {"id": 4, "label": "Four", "value": "four"},
    {"id": 5, "label": "Five", "value": "five"},
    {"id": 6, "label": "Six", "value": "six"},
    {"id": 7, "label": "Seven", "value": "seven"},
    {"id": 8, "label": "Eight", "value": "eight"},
    {"id": 9, "label": "Nine", "value": "nine"},
  ];
  var isExpanded = false;
  String selectedValue = "";
  @override
  void initState() {
    // TODO: implement initState
    selectedValue = dropVales[0]['label'];
    // findButton();
    super.initState();
  }

  late final OverlayEntry _overlay = createOverlay();
  final GlobalKey _key = LabeledGlobalKey("button_icon");
  late Size buttonSize;
  late Offset buttonPosition;
  bool isMenuOpen = false;
  findButton() {
    RenderBox? renderBox =
        _key.currentContext?.findRenderObject() as RenderBox?;
    buttonSize = renderBox!.size;
    buttonPosition = renderBox.localToGlobal(Offset.zero);
  }

  OverlayEntry createOverlay() {
    findButton();
    return OverlayEntry(
      builder: (_) {
        return Positioned(
          top: buttonPosition.dy + buttonSize.height,
          left: buttonPosition.dx,
          width: 200,
          height: 200,
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              onClose();
            },
            onHorizontalDragStart: (_) {
              onClose();
            },
            onVerticalDragStart: (_) {
              onClose();
            },
            child: Card(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                ),
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: dropVales.length,
                  itemBuilder: ((context, index) {
                    return GestureDetector(
                      onTap: (() {
                        setState(() {
                          selectedValue = dropVales[index]['label'];
                          isExpanded = !isExpanded;
                        });
                        onClose();
                      }),
                      child: Container(
                        margin: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text("${dropVales[index]['label']}"),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void onClick() {
    Overlay.of(context)?.insert(_overlay);
  }

  void onClose() {
    _overlay.remove();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Custom DropDown"),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Center(
            child: Column(
              children: [
                GestureDetector(
                  key: _key,
                  onTap: () {
                    setState(() {
                      isExpanded = !isExpanded;
                    });
                    onClick();
                  },
                  child: Card(
                    child: Container(
                      width: constraints.maxWidth * 0.5,
                      height: 50,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 10,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(selectedValue),
                          isExpanded
                              ? const Icon(Icons.expand_less)
                              : const Icon(Icons.expand_more),
                        ],
                      ),
                    ),
                  ),
                ),
                Text('something'),
              ],
            ),
          );
        },
      ),
    );
  }
}
