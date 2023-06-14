import 'package:flutter/material.dart';

class TryProgram extends StatefulWidget {
  final void onButtonSelected;
  final void onButtonUnselected;
  const TryProgram({
    Key? key,
    required this.onButtonSelected,
    required this.onButtonUnselected,
  }) : super(key: key);

  @override
  State<TryProgram> createState() => _TryProgramState();
}

class _TryProgramState extends State<TryProgram> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {

    return Expanded(
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            if (isSelected) {
              widget.onButtonSelected;
            } else {
              widget.onButtonUnselected;
            }
            isSelected = !isSelected;
          });
        },
        child: !isSelected ? const Row(
          children: [
            Icon(Icons.add),
            Text("Coba Program"),
          ],
        ) : const Row(
          children: [
            Icon(Icons.check),
            Text("Program Ditambahkan"),
          ],
        ),
      ),
    );
  }
}
