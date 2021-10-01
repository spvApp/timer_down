import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Color color;
  final String text;
  final VoidCallback? onPressed;

  const MyButton(
      {required this.color, required this.text, required this.onPressed})
      : super();

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: color,
      textColor: Colors.white,
      child: Text(text),
    );
  }
}
