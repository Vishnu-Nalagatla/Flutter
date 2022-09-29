import 'dart:ui';

import 'package:flutter/material.dart';

class EditProductModal extends StatefulWidget {
  const EditProductModal({super.key});

  @override
  State<EditProductModal> createState() => _EditProductModalState();
}

class _EditProductModalState extends State<EditProductModal> {
  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "MODAL BOTTOM SHEET",
              style: TextStyle(
                  fontStyle: FontStyle.italic,
                  letterSpacing: 0.4,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                  constraints: const BoxConstraints(
                    maxWidth: 400,
                  ),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(30.0),
                    ),
                  ),
                  context: context,
                  builder: (context) {
                    return Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Stack(
                        alignment: Alignment.center,
                        clipBehavior: Clip.none,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Icon(
                                  Icons.close,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          Positioned(
                            bottom: 430,
                            child: Container(
                              color: Colors.white70,
                              // child: QrImage(
                              //   data: "1234567890",
                              //   version: QrVersions.auto,
                              //   size: 250,
                              // ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              child: const Text(
                'Click Me',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.6),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
