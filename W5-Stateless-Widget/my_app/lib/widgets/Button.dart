import 'package:flutter/material.dart';

enum ButtonType { primary, secondary, disabled }

enum ButtonOrderType { iconFirst, textFirst }

class Button extends StatelessWidget {
  final String text;
  final IconData icon;
  final ButtonType type;
  final ButtonOrderType orderType;
  const Button({
    super.key,
    required this.type,
    required this.orderType,
    required this.text,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return BaseButton(type: type, orderType: orderType, text: text, icon: icon);
  }
}

class BaseButton extends StatelessWidget {
  final ButtonType type;
  final ButtonOrderType orderType;
  final String text;
  final IconData icon;
  const BaseButton({
    super.key,
    required this.type,
    required this.orderType,
    required this.text,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: type == ButtonType.primary
            ? Colors.blue
            : type == ButtonType.secondary
            ? Colors.green
            : Colors.grey,
        borderRadius: BorderRadius.circular(50),
      ),
      margin: const EdgeInsets.all(20),
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(20),
        child: Row(
          spacing: 20,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            orderType == ButtonOrderType.iconFirst ? Icon(icon) : Text(text),
            orderType == ButtonOrderType.iconFirst ? Text(text) : Icon(icon),
          ],
        ),
      ),
    );
  }
}
