import 'package:flutter/material.dart';

enum ButtonType {
  switchType,
  buttonType,
}

class SettingsRow extends StatelessWidget {
  final IconData? startIcon;
  final String title;
  final String? subTitle;
  final ButtonType? buttonType;
  final Color color;
  final Color? iconColor;
  final Icon? endIcon;
  const SettingsRow({
    Key? key,
    this.startIcon,
    required this.title,
    this.subTitle,
    required this.color,
    this.iconColor,
    this.buttonType,
    this.endIcon,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              borderRadius: const BorderRadius.all(
                Radius.circular(50),
              ),
            ),
            child: Icon(
              (startIcon ?? Icons.portable_wifi_off_outlined),
              size: 20,
              color: iconColor ?? color,
            ),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                  ),
                ),
                if (subTitle != null)
                  Text(
                    subTitle!,
                    style: const TextStyle(color: Colors.grey),
                  ),
              ],
            ),
          )),
          buttonType == ButtonType.switchType
              ? Switch(value: false, onChanged: (value) {})
              : Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: const Icon(
                    Icons.arrow_forward_ios,
                    size: 20,
                  ),
                )
        ],
      ),
    );
  }
}
