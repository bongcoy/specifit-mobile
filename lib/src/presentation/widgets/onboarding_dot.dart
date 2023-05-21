import 'package:flutter/material.dart';

class OnboardingDot extends StatelessWidget {
  const OnboardingDot({
    super.key,
    this.isActive = false,
  });

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 10,
      width: isActive ? 24 : 10,
      decoration: BoxDecoration(
        color: isActive
            ? const Color.fromARGB(255, 255, 155, 5)
            : Color.fromARGB(255, 225, 225, 225),
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
      ),
    );
  }
}
