import 'package:flutter/material.dart';

class CalcButton extends StatelessWidget {
  const CalcButton({super.key, required this.label, required this.onPress});

  final String label;
  final onPress;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPress,
      style: TextButton.styleFrom(
        shape: const CircleBorder(), 
        // padding: const EdgeInsets.all(0.2),
        backgroundColor: Colors.blue,
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      )
    );    
  }
}