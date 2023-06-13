import 'package:flutter/material.dart';
import 'package:specifit/src/presentation/themes.dart';

class WorkoutDetailItem extends StatelessWidget {
  final String title;
  final String time;
  const WorkoutDetailItem({Key? key, required this.title, required this.time})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      color: Colors.white,
      surfaceTintColor: Colors.white,
      child: ListTile(
        title: Text(title),
        subtitle: Row(
          children: [
            Icon(
              Icons.watch_later_outlined,
              color: grey1Color,
            ),
            SizedBox(
              width: 8,
            ),
            Text(time),
          ],
        ),
      ),
    );
  }
}
