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
    return GestureDetector(
      onTap: () {
        setState(() {
          isActive = !isActive;
        });
      },
      child: Card(
        margin: const EdgeInsets.only(right: 16),
        color: isActive ? orangeColor : Colors.white,
        child: Column(
          children: [
            Text(
              "Day",
              style: TextStyle(
                color: isActive ? Colors.white : Colors.black,
              ),
            ),
            Text(
              widget.nDay,
              style: TextStyle(
                color: isActive ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
