import 'package:flutter/material.dart';
import 'package:specifit/src/presentation/widgets/cards/workout_detail_item.dart';

class WorkoutDetailScreen extends StatelessWidget {
  final String titleWorkout;
  final String imageUrl;

  const WorkoutDetailScreen({
    Key? key,
    required this.titleWorkout,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String descWorkout = "Istirahat setiap 5 menit selama 1 menit";
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(titleWorkout),
            const Text(descWorkout),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (ctx, idx) {
                  return const WorkoutDetailItem();
                },
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                child: const Text("Mulai"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
