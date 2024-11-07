// core/global_component/ButtonComponent.dart
import 'package:flutter/material.dart';

class ButtonComponent extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;

  ButtonComponent({required this.text, required this.onPressed, required this.color});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        padding: EdgeInsets.symmetric(vertical: 15),
      ),
      child: Text(text, style: TextStyle(fontSize: 16)),
    );
  }
}
