import 'package:flutter/material.dart';
import 'package:specifit/src/presentation/themes.dart';

class DayButton extends StatefulWidget {
  final List<int> days;
  final void Function(int) onButtonSelected;

  const DayButton({
    Key? key,
    required this.days,
    required this.onButtonSelected,
  }) : super(key: key);

  @override
  _DayButtonState createState() => _DayButtonState();
}

class _DayButtonState extends State<DayButton> {
  int? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: widget.days.length,
      itemBuilder: (context, index) {
        final day = widget.days[index];
        final isSelected = day == _selectedDay;

        return Padding(
          padding: const EdgeInsets.only(right: 4.0),
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                if (isSelected) {
                  _selectedDay = null;
                } else {
                  _selectedDay = day;
                  widget.onButtonSelected(day);
                }
              });
            },
            style: ElevatedButton.styleFrom(
              primary: isSelected ? orangeColor : Colors.grey,
            ),
            child: Text(
              day.toString(),
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
              ),
            ),
          ),
        );
      },
    );
  }
}
