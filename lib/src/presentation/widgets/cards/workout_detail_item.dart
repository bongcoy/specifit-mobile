import 'package:flutter/material.dart';
import 'package:specifit/src/presentation/themes.dart';

class WorkoutDetailItem extends StatelessWidget {
  const WorkoutDetailItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String title = "Jumping Jacks";
    const String time = "1 menit";
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      color: Colors.white,
      surfaceTintColor: Colors.white,
      child: ListTile(
        title: const Text(title),
        subtitle: Row(
          children: const [
            Icon(Icons.watch_later_outlined, color: grey1Color,),
            SizedBox(width: 8,),
            Text(time),
          ],
        ),
      ),
    );
  }
}
