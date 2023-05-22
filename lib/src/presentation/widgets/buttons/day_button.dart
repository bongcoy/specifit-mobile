import 'package:flutter/material.dart';
import 'package:specifit/src/presentation/themes.dart';

class DayButton extends StatefulWidget {
  final String nDay;
  const DayButton({Key? key, required this.nDay}) : super(key: key);

  @override
  State<DayButton> createState() => _DayButtonState();
}

class _DayButtonState extends State<DayButton> {
  bool isActive = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          isActive = !isActive;
        });
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          isActive ? orangeColor : Colors.white,
        ),
        foregroundColor: MaterialStateProperty.all<Color>(
          isActive ? Colors.white : orangeColor,
        ),
      ),
      child: Column(
        children: [
          const Text("Day"),
          Text(widget.nDay),
        ],
      ),
    );
  }
}
