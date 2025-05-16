import 'package:flutter/material.dart';

class ArrowButton extends StatelessWidget {
  final VoidCallback onPressed;

  const ArrowButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Center(
          child: Icon(
            Icons.arrow_forward,
            size: 28,
            color: Color(0xFF5B47F0),
          ),
        ),
      ),
    );
  }
}
