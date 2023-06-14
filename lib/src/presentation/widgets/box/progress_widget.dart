import 'package:flutter/material.dart';
import 'package:specifit/src/presentation/themes.dart';

class ProgressWidget extends StatefulWidget {
  const ProgressWidget({Key? key}) : super(key: key);

  @override
  State<ProgressWidget> createState() => _ProgressWidgetState();
}

class _ProgressWidgetState extends State<ProgressWidget> {
  double progressPercentage = 20/100;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: LinearProgressIndicator(
            value: progressPercentage,
            color: orangeColor,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          '${(progressPercentage * 100).toStringAsFixed(1)}%',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
