import 'package:flutter/material.dart';

class ProgressSegments extends StatelessWidget {
  final int total;
  final int active;

  const ProgressSegments({
    super.key,
    required this.total,
    required this.active,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        total,
        (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: index == active ? 20 : 12,
          height: 6,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: index == active
                ? const Color(0xFF5B47F0)
                : Colors.white.withOpacity(0.3),
          ),
        ),
      ),
    );
  }
}
