import 'package:flutter/material.dart';

class FilterButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final bool selected;

  const FilterButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.selected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateColor.resolveWith((states) {
          if (states.contains(MaterialState.pressed)) {
            return Colors.orange;
          }
          return selected ? Colors.orange : Colors.grey;
        }),
      ),
      child: Text(
        label,
        style: const TextStyle(fontSize: 18.0),
      ),
    );
  }
}
